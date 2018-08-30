;;; javadoc-lookup-x.el --- Extra functionality for javadoc-lookup
;;
;; Copyright (C) 2018 Andreas Marschke
;;
;; Author: Andreas Marschke <emacs@andreas-marschke.name>
;; Created: 06.08.2018
;; Version: 0.1
;; Package-Requires: ((javadoc-lookup "1.1.0"))
;; Keywords: 
;; URL:
;;; Commentary:
;; This file contains convenience functions for making javadoc-lookup easier to use. 
;;
;; Usage:
;; (require 'javadoc-lookup-x)
;; (javadoc-lookup-x/add-web-root "https://docs.gradle.org/current/javadoc")
;;
;;; Code

(require 'javadoc-lookup)

;; TODO: Can we make this function crossplatform or even replace this with elisp?
(defun jdl-x/web-get-classes (root)
  "Get classes from `allclasses-frame.html' in ROOT javadoc root url."
  (let* ((html-string (shell-command-to-string (concat "wget -qO- \"" root "/allclasses-frame.html\"")))
         (strings-lines (split-string html-string "\n"))
         (classFrame-lines (seq-filter (lambda (line &rest a) (string-match-p ".*target=\"classFrame\".*" line)) strings-lines))
         (classes (seq-map (lambda (line &rest ) (when (string-match "href=\"\\(.*\\.html\\)\".*" line) (match-string 1 line))) classFrame-lines)))
    classes))

(defun jdl-x/index-classes (root)
  "Creates hash based on urls found under ROOT.

See: `jdl-x/web-get-classes'"
  (let ((new-hash (make-hash-table :test 'equal)))
    (dolist (class (jdl-x/web-get-classes root))
      (jdl/add-file (concat root "/" class) new-hash (cons root '()) ))
    new-hash))

(defun jdl-x/webcache-save (root hash)
  (let ((cache-file-name (jdl/cache-name root)))
    (jdl/save-cache (concat javadoc-lookup-cache-dir "/" cache-file-name) hash)))

(defun jdl-x/webcache-load (root)
  "Loads pre-cached index file for ROOT from `javadoc-lookup-cache-dir'."
  (let ((cache-file-name (jdl/cache-name root)))
    (jdl/load-cache (concat javadoc-lookup-cache-dir "/" cache-file-name))))

;;;###autoload
(defun javadoc-lookup-x/add-web-root (web-root)
  "Adds WEB-ROOT to javadoc-lookup index."
  (let* ((cache-file-name (jdl/cache-name web-root))
         (cache-file-exists-p (file-exists-p (concat javadoc-lookup-cache-dir "/" cache-file-name))))
    (unless cache-file-exists-p
      (jdl-x/webcache-save web-root (jdl-x/index-classes web-root)))
    (jdl-x/webcache-load web-root)))

(provide 'javadoc-lookup-x)
