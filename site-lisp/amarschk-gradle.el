;;; amarschk-gradle.el --- Gradle Addon functions for emacs

;; Copyright (C) 2021 Andreas Marschke

;; Author: Andreas Marschke <emacs@andreas-marschke.name>
;; Created: 10.10.2021
;; Version: 0.1
;; Package-Requires: ((javadoc-lookup-x))
;; Keywords: 
;; URL:
;;; Commentary:
;; 
;;
;;; Code:

(require 'javadoc-lookup-x)

(defvar amarschke/gradle-executable "./gradlew"
  "Gradle executable to invoke to retrieve information from a project")

(defvar amarschke/javadoc-url "https://www.javadoc.io/doc"
  "URL to javadoc.io")

(defun amarschke/gradle-subproject-dependency-packages (subproject-name)
  "Retrieves a list of strings defining packages to retrieve javadocs for."
  (let* ((command-string (format "%s %s:dependencies | grep -o '[a-z0-9\\\\-\\\\.]*:[a-z0-9\\\\-\\\\.]*:[0-9\\\\-\\\\.]*'| sort -u" amarschke/gradle-executable subproject-name))
         (command-output (shell-command-to-string command-string))
         (dependency-packages (split-string command-output "\n" t)))
    dependency-packages))


(defun amarschke/gradle-load-javadocs-for-project (project base-url java-packages)
  "Usage: (let ((amarschke/gradle-subproject-dependency-packages project))
(amarschke/gradle-load-javadocs-for-project amarschke/javadoc-url (...)))"
  (let ((javadoc-url-base (if (not base-url)
                                 amarschke/javadoc-url
                               base-url)))
    (dolist (java-package java-packages)
      (ignore-errors
        (let ((java-package-items (split-string java-package ":"))
              (java-group (nth 0 java-package-items))
              (java-module (nth 1 java-package-items))
              (java-version (nth 2 java-package-items)))
          ;; avoid subProject references here, we can find those javadocs some way else
          (when (and (not (eq nil java-group)) (not (eq nil java-version)))
            (javadoc-lookup-x/add-web-root (format "%s/%s/%s/%s" javadoc-url-base java-group java-module java-version)))
          )))))
