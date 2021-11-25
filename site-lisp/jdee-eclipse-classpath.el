;;; jdee-eclipse-classpath.el --- Retrieve Jars for classpath configuration from classpath.xml files

;; Copyright (C) 2018 Andreas Marschke

;; Author: Andreas Marschke <emacs@andreas-marschke.name>
;; Created: 24.07.2018
;; Version: 0.1
;; Package-Requires: ((jdee))
;; Keywords: jdee,eclipse,classpath,xml
;; URL:
;;; Commentary:
;; Indirectly depends on projectile for indexing
;;
;;; Code:

(require 'subr-x)
(require 'xml)

(defgroup jdee-eclipse-classpath nil
  "JDEE utility functions for classpath data retrieval."
  :group 'tools)

(defcustom jdee-eclipse-classpath-common-component-file-name ".settings/org.eclipse.wst.common.component"
  "Path to Eclipse common.component XML file.

This path is relative to the root of the project."
  :group 'jdee-eclipse-classpath
  :type 'string)

(defcustom jdee-eclipse-classpath-file-name ".classpath"
  "File name of eclipse classpath file."
  :group 'jdee-eclipse-classpath
  :type 'string)

(defcustom jdee-eclipse-classpath-find-utility 'alien
  "Mechanic of how to find classpath files.
Akin to projectile's `projectile-indexing-method' this library can find .classpath
files in a project by way of either operating system mechanics (eg. `find(1)') or by way of
native EMACS LISP methods.  Define here what mechanic you wish to use."
  :group 'jdee-eclipse-classpath
  :type '(radio
          (const :tag "Native" native)
          (const :tag "Alien" alien)))

(defcustom jdee-eclipse-classpath-ignore-paths
  '(projectile-globally-ignored-files
    projectile-globally-ignored-directories
    projectile-ignored-directories)
  "Ignored path to filter out any undesired paths when searching for classpaths."
  :group 'jdee-eclipse-classpath
  :type '(repeat string))

;;; TODO: See if you can optimize this
;;;###autoload
(defun jdee-eclipse-classpath-common-components (file-path project-base-path)
  "Read '.settings/org.eclipse.wst.common.component' from FILE-PATH and find jars dependencies in PROJECT-BASE-PATH."
  (let ((paths-list '()))
    (dolist (element
             (xml-node-children
              (car (cdr (xml-node-children (car (xml-parse-file file-path)))))))
      (if (listp element)
          (if (eq 'dependent-module (car element))
              (let* ((handle-path (car (split-string (car (cdr (split-string (cdr (assq 'handle (car (cdr element)))) ":"))))))
                     (type (car (cdr (split-string handle-path "/")))))
                (if (string-equal "classpath" type)
                    (push (concat project-base-path "/" (string-join (cdr (cdr (cdr (split-string handle-path "/")))) "/")) paths-list))))))
    paths-list))

;;; TODO: Refactor into seq-map or seq-filter


(defun jdee-eclipse--get-classpathentries-from-file (file)
  "Find all classpathentry occurences in FILE."
  ;; <?xml version="1.0" encoding="UTF-8"?>
  ;; <classpath>
  ;;  <classpathentry ...>
  ;;  ...
  (cdr (xml-get-children (car (xml-parse-file file )) 'classpathentry)))

(defun jdee-eclipse--is-kind-lib (element)
  "Find out if ELEMENT is a 'lib'.

Example:
 <classpathentry exported='true' [kind='lib'] path='path/to/my.jar'/>."
  (string-equal (cdr (assq 'kind (car (cdr element)))) "lib"))

(defun jdee-eclipse--classpath-path-from-element (element)
  "Find PATH attribute on ELEMENT.
Example:
 <classpathentry exported='true' kind='lib' [path='path/to/my.jar']/>

Returns value of PATH"
  (cdr (assq 'path (car (cdr element)))))

;;;###autoload
(defun jdee-eclipse-classpath (file)
  "Return a list of .jar files parsed from .classpath xml-file in FILE."
  (let* ((xml-root (cdr (xml-parse-file file)))
         (classpath-entries (xml-get-children xml-root 'classpathentry))
         (classpath-libs (seq-filter 'jdee-eclipse--is-kind-lib classpath-entries)))
    classpath-libs))

(defun jdee-eclipse-classpath-paths (file project-base-path)
  "Map classpathentries in FILE to full path under PROJECT-BASE-PATH."
  (mapc (lambda (file) (concat project-base-path file)) (jdee-eclipse-classpath file)))

(defun jdee-eclipse-classpath--find-classpath (project-dir)
  "Use `alien' tools to find a list of classpath files in PROJECT-DIR."
  (let* ((command-string (format "find %s -name '.classpath'" project-dir))
         (command-output (shell-command-to-string command-string)))
    (delete-dups (append (mapc
                          (lambda (dir)
                                  (unless (projectile-ignored-directory-p
                                           (file-name-as-directory dir)) dir)) (split-string command-output "\n"))))))

(provide 'jdee-eclipse-classpath)
;;; jdee-eclipse-classpath.el ends here
