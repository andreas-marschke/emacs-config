;;; amarschke-util.el --- My personal utilities

;; Copyright (C) 2018 Andreas Marschke

;; Author: Andreas Marschke <emacs@andreas-marschke.name>
;; Created: 24.07.2018
;; Version: 0.1
;; Package-Requires: ((emacs "24"))
;; Keywords: utils
;; URL:
;;; Commentary:
;;
;;
;;; Code:
(require 'javadoc-lookup-x)
(defun menu-hide()
  "Called from init.el to hide menu when in termninal"
  (interactive)
  (dolist (m '(menu-bar-mode scroll-bar-mode blink-cursor-mode tool-bar-mode))
    (if (boundp m)
        (funcall m -1))))

(defun other-window-back (&optional args)
  "Select other window in counter-cyclic ordering of windows."
  (interactive "k")
  (other-window -1))

(defun compilation-regexps (project-type)
  "Add regexps to the list based on project-type")

(defun amarschke/get-pointcuts (file)
  "TODO: Make this index all pointcuts for inclusing in java 
projects when applying aspects."
  (let ((awk-command "awk")
        (awk-regex "/pointcut/,/\;/"))))


(defun amarschke/logcat-mode-clear-logcat ()
  "Calls logcats clear option to clear the logcat buffer and restarts collection of logs in a new buffer"
  (interactive)
  (let ((buffer-read-only nil)
        (logcat-clear-command (concat logcat-fb-adb-program logcat-fb-adb-arguments "logcat" " " "-c")))
    (logcat-stop)
    (erase-buffer)
    (let ((logcat-clear-call-return (shell-command-to-string logcat-clear-command)))
      (if (not (string-equal logcat-clear-call-return ""))
          (error (format "An Error occured clearing logcats buffer: %s" logcat-clear-call-return))))
    (logcat)
    (setq buffer-read-only t)))

(defun amarschke/start-activity-at-point ()
  "Start the Activity using ADB shell on a connected device."
  (interactive)
    (let* ((class-name (jdee-parse-get-class-at-point))
           (package-name (jdee-parse-get-package))
           (activity-path (concat package-name class-name))
           (adb-path "adb")
           (adb-opts "")
           (adb-device "")
           (adb-cmd-exec-str (concat adb-path adb-opts " shell am start " " -n " (substring package-name 0 (- (length package-name) 1))"/" activity-path)))
      (message (concat "Running Command: " adb-cmd-exec-str))
      (shell-command adb-cmd-exec-str)))

(defvar amarschke/gradle-executable "./gradlew"
  "Gradle executable to invoke to retrieve information from a project")

(defun amarschke/gradle-subproject-dependency-packages (subproject-name)
  "Retrieves a list of strings defining packages to retrieve javadocs for."
  (let* ((command-string (format "%s %s:dependencies | grep -o '[a-z0-9\\\\-\\\\.]*:[a-z0-9\\\\-\\\\.]*:[0-9\\\\-\\\\.]*'| sort -u" amarschke/gradle-executable subproject-name))
         (command-output (shell-command-to-string command-string))
         (dependency-packages (split-string command-output "\n" t)))
    dependency-packages))

(defun amarschke/gradle-load-javadocs-for-project (project)
  (let ((javadoc-io-url-base "https://www.javadoc.io/doc")
        (java-packages-list (amarschke/gradle-subproject-dependency-packages project)))
    (dolist (java-package java-packages-list)
      (ignore-errors
        (let ((java-package-items (split-string java-package ":"))
              (java-group (nth 0 java-package-items))
              (java-module (nth 1 java-package-items))
              (java-version (nth 2 java-package-items)))
          ;; avoid subProject references here, we can find those javadocs some way else
          (when (and (not (eq nil java-group)) (not (eq nil java-version)))
            (javadoc-lookup-x/add-web-root (format "%s/%s/%s/%s" javadoc-io-url-base java-group java-module java-version)))
          )))))

(provide 'amarschke-util)
;;; --- amarschke-util.el ends here

