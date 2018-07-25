;;; jdee-eclipse-classpath.el --- Retrieve Jars for classpath configuration from classpath.xml files

;; Copyright (C) 2018 Andreas Marschke

;; Author: Andreas Marschke <emacs@andreas-marschke.name>
;; Created: 24.07.2018
;; Version: 0.1
;; Package-Requires: ((jdee))
;; Keywords: jdee,eclipse,classpath,xml
;; URL:
;;; Commentary:
;;
;;
;;; Code:

(defgroup jdee-eclipse-classpath nil
  "JDEE utility functions for classpath data retrieval."
  :group 'tools)

(defcustom jdee-eclipse-classpath-common-component-file-name ".settings/org.eclipse.wst.common.component"
  "Path to Eclipse common.component XML file.

This path is relative to the root of the project."
  :group 'jdee-eclipse-classpath)

(defcustom jdee-eclipse-classpath-file-name ".classpath"
  "File name of eclipse classpath file."
  :group 'jdee-eclipse-classpath)

;;; TODO: See if you can optimize this
;;;###autoload
(defun jdee-eclipse-classpath-common-components (file-path project-base-path)
  "Read '.settings/org.eclipse.wst.common.component' and find jars dependencies"
  (let ((paths-list '()))
    (dolist (element
             (xml-node-children
              (car (cdr (xml-node-children (car (xml-parse-file file-path)))))))
      (if (listp element)
          (if (eq 'dependent-module (car element))
              (let* ((handle-path (car (split-string (car (cdr (split-string (cdr (assq 'handle (car (cdr element)))) ":"))))))
                     (type (car (cdr (split-string handle-path "/")))))
                (if (string-equal "classpath" type)
                    (push (concat project-base-path "/" (string-join (cdr (cdr (cdr (split-string handle-path "/")))) "/")) paths-list) )
                ))))
    paths-list))

;;; TODO: Refactor into seq-map or seq-filter

;;;###autoload
(defun jdee-eclipse-classpath (file project-base-path)
  "Return a list of *.jar files parsed from .classpath.xml in FILE."
  (let ((paths-list '())
        (kind-is-lib (lambda (element) (string-equal (cdr (assq 'kind (car (cdr element)))) "lib"))))
    (dolist (element (cdr (xml-node-children (car (xml-parse-file file)))))
      (if (listp element)
          (if (kind-is-lib element)
              (push (concat project-base-path (cdr (assq 'path (car (cdr element))))) paths-list))))
    paths-list))

(provide 'jdee-eclipse-classpath)

;;; --- jdee-eclipse-classpath.el ends here
