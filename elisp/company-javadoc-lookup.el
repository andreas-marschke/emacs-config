;;; company-javadoc-lookup.el --- company-mode completion backend for javadoc-lookup
;;
;;; Metadata
;; Copyright (C) 2017 Andreas Marschke
;;
;; Author: Andreas Marschke
;; Created: 1 May 2017
;; Version: 0.1
;; Keywords: java, javadoc, company, completion
;; URL:
;;; Changelog
;;
;;;; Version 0.1 - Initial Release
;;
;; - supports basic lookup based on javadoc-lookup
;;
;;; Commentary:
;;
;; A company-mode backend adding support for javadoc-lookup where we are resolving based
;; on classes accessible via `jdl/get-class-list'
;;
;;
;;; Usage:
;; In your configuration you may add this backend in a mode-specific setup ie.:
;;
;; (add-hook 'java-mode-hook
;;           (lambda ()
;;             (add-to-list (make-local-variable 'company-backends)
;;                          'company-javadoc-lookup))
;;
;;
;;; Code:

;;;; Requirements
(require 'company)
(require 'cl-lib)
(require 'javadoc-lookup)

;;;; Vars
(defvar company-jdl/-java-import-tree nil
  "Internal tree structure containing all import list nodes")

;;;; Class definition
(defclass company-jdl-node()
  ((children :initarg :children
	     :label "children"
             :initform (list)
	     :documentation "Children of a node")
   (value :initarg :value
	  :label "value"
	  :documentation "Value of node")))

;;;; Utility Functions
(defun company-jdl/build-node (value)
  "Builds new node based on VALUE"
  (company-jdl-node :value value)
  )

(defun company-jdl/append-node (parent child)
  "Append CHILD to PARENT. Returns PARENT node"
  (if (ignore-errors (oref parent children))
      (oset parent :children (list child))
    (object-add-to-list parent :children child)
    )
  )

(defun company-jdl/node-list-get-values (node-list)
  "Get values for all elements in NODE-LIST"
  (cl-map 'list '(lambda (node) (oref node value)) node-list))

(defun company-jdl/has-children (node)
  "Return non-nil if NODE's :children has values"
  (not (eq nil (ignore-errors (oref node children)))))

(defun company-jdl/has-named-child (node name)
  "Checks if one of the children defined in NODE matches NAME"
  (cl-loop for child in (ignore-errors (oref node children)) do
	   (if (string-match (oref child value) name)
	       (cl-return child))))

(defun company-jdl/get-named-child (node name)
  (company-jdl/has-named-child node name))

(defun company-jdl/node-matches-value (node name)
  (string-match (oref node value) name))

(defun company-jdl/ret-node (node)
  node
  )

(defun company-jdl/find-deepest-match (node-root name-list)
  "Iterate down the trees of NODE-LIST to find the deepest NODE matching the full
 chain of NAME-LIST. Returns last found node via NODE-CURRENT."
  (labels
      ((find-deepest-match
        (-p-node-root -p-name-list)
        (cond ((and (eq nil (ignore-errors (oref -p-node-root children))) (<= 1 (length -p-name-list))) -p-node-root)
              ((= 1 (length -p-name-list)) (company-jdl/get-named-child -p-node-root (car -p-name-list)))
              ((< 1 (length -p-name-list)) (find-deepest-match (company-jdl/get-named-child -p-node-root (car -p-name-list)) (cdr -p-name-list)))
	      )
	))
    (find-deepest-match node-root name-list))
  )

(defun get-element (list name)
  (let ((-iter 0))
    (cl-loop for item in list do
             (setq -iter (+ 1 -iter))
             (when (eq 0 (string-match item name))
                 (cl-return (nthcdr -iter list)))
             )
    )
  )

(defun company-jdl/build-tree ()  
  (setq company-jdl/-java-import-tree (company-jdl/build-node ""))  
  (cl-loop
   for class in (jdl/get-class-list) do
   (print (format "Current Class: %s" class))
   (cl-loop
    for subset in (split-string class "\\.") do
    (cond
     ;; Tree is completely empty or subset is root of a package
     ((or (not (company-jdl/has-children company-jdl/-java-import-tree))
          (and
           (eq nil (company-jdl/has-named-child company-jdl/-java-import-tree subset))
           (eq 0 (string-match subset (car (split-string class "\\."))))))
      (print "Did not have children adding current subset")
      (object-add-to-list company-jdl/-java-import-tree :children (company-jdl/build-node subset)) )
     
     ((company-jdl/find-deepest-match company-jdl/-java-import-tree (split-string class "\\."))
      (print (format "Current found deepest for subset (%s): %s" subset (company-jdl/find-deepest-match company-jdl/-java-import-tree (split-string class "\\."))))
      (company-jdl/append-node (company-jdl/find-deepest-match company-jdl/-java-import-tree (split-string class "\\.")) (company-jdl/build-node subset))
      )
     )
    ) 
   )
  )

(defun company-jdl/get-tree-list-from-string (content)
  (reverse (nthcdr 1 (reverse (split-string content "\\.")))))

(defun company-jdl/match-regular-expression (regex content num)
  (string-match  content)
  (match-string-no-properties num content))

(defun company-jdl/find-package-node-list-from-root (content)
  (oref
   (company-jdl/find-deepest-match
    company-jdl/-java-import-tree
    (company-jdl/get-tree-list-from-string content))
   children))

(defun company-jdl/handle-arg (arg)
  (let
      ((content (ignore-errors (company-jdl/match-regular-expression "^import \\(.*\\)" arg 1))))
    (cond ((not (eq nil content))
           (all-completions arg (company-jdl/node-list-get-values (company-jdl/find-package-node-list-from-root content))))
          ((eq nil content)
           (all-completions arg (company-jdl/node-list-get-values (oref company-jdl/-java-import-tree children)))) )) )

;;;; Company Mode backend
;;;###autoload
(defun company-javadoc-lookup (command &optional arg &rest ignored)
  (interactive (list 'interactive))
  (cl-case command
    (interactive (company-begin-backend 'company-javadoc-lookup))
    (prefix (when (and (eq major-mode 'java-mode) (company-grab-symbol) (looking-back "^import .*"))
	      (match-string 0)))
    (candidates (company-jdl/handle-arg)) ) )

(provide 'company-javadoc-lookup)


