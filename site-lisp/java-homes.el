;;; java-homes.el --- Java JDK and Runtime Management

;; Copyright (C) 2021 Andreas Marschke

;; Author: Andreas Marschke <emacs@andreas-marschke.name>
;; Created: 15.10.2021
;; Version: 0.1
;; Package-Requires: ((subr-x))
;; Keywords: xml,java,sdk,jdk
;; URL: 
;;; Commentary:
;; Allows presentation and management of the currently installed
;; runtimes and  allows switching between them.
;;
;;; Code:

(require 'subr-x)

(defgroup java-homes nil
  "Java Homes manages the Java SDKs and virtual machine runtimes
installed in the current system."
  :group 'tools)

(defcustom java-homes-javahome-executable-bin "java_home"
  "Name or path of the `java_home' executable to run to get the 
current java virtual envs."
  :group 'java-homes)

;; TODO: Make this a proper map with
;; :version ;; for --version <version>
;; :architecture ;; for --arch <architecture>
;; :datamodel ;; for --datamodel <datamodel>
(defcustom java-homes-param-filters '()
  "List of filter params to pass to java_home when retrieving current
 list of runtimes."
  :group 'java-homes)

(defvar java-homes--buffer-name "*java-homes*"
  "Name of the buffer created to list java homes.")

(defun java-homes--format-filters ()
  "Map out filters as they are set in `java-homes-param-filters'."
  (string-join java-homes-param-filters " "))

(defun java-homes--shell-exec-command ()
  (format "%s %s %s" java-homes-javahome-executable-bin "-X" ()))

(defun java-homes-list ()
  "List the currently available java homes."
  (interactive)
  (let ((buffer (generate-new-buffer java-homes--buffer-name)))
    (set-buffer-major-mode buffer)
    
    (display-buffer buffer '(display-buffer-pop-up-frame . nil))
    ))

(defun java-homes--exec-homes ()
  (let* ((command-args (format "%s %s" "-X" (java-homes--format-filters)))
         (command-string (format "%s %s" java-homes-javahome-executable-bin command-args))
         (command-output (shell-command-to-string command-string))
         (root (with-temp-buffer
	                          (insert command-output)
	                          (xml-parse-region (point-min) (point-max))))
         (plist (car root)))
    plist))

(defun java-homes--get-homes ()
  "Get current list of java homes and parse the XML structure
for presentation in `java-homes--buffer-name'."
  )

(defun java-homes--buffer-content (content)
  (with-current-buffer java-homes--buffer-name
    (goto-char (point-max))
    (insert content)))

;; TODO: Fix this up to work to parse the contents of the shell xml
;; Current Problems with this implementation:
;;  - XML in list is not a decent tree but instead
;;    <dict><key><value><key><value><key><true/false></dict>
;;    - Makes it awkward to parse and make sense of in lisp list
;;      structures in my head.
;;    - Should map properly, need to consp?
;; See: ~/src/conf/osx-plist.el for inspiration to deal with shitty xml
(let* ((command-args (format "%s %s" "-X" (java-homes--format-filters)))
         (command-string (format "%s %s" java-homes-javahome-executable-bin command-args))
         (command-output (shell-command-to-string command-string))
         (root (with-temp-buffer
	                          (insert command-output)
	                          (xml-parse-region (point-min) (point-max))))
         (plist (car root))
         (dicts (xml-node-children (car (xml-get-children plist 'array))))
         (dict-mapping-func (lambda (dict)
                              (let ((keys (xml-get-children dict 'key))
                                    (-strings (xml-get-children dict 'string))
                                    (simple-res (append keys -strings)))
                              ))
         (sub-dicts (map 'listp dict-mapping-func dicts))
  ) sub-dicts)
