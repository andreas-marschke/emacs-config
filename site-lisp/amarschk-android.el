;;; amarschk-android.el --- Android-specific addon functions for emacs

;; Copyright (C) 2021 Andreas Marschke

;; Author: Andreas Marschke <emacs@andreas-marschke.name>
;; Created: 10.10.2021
;; Version: 0.1
;; Package-Requires: ((javadoc-lookup-x) (jdee) (projectile))
;; Keywords: 
;; URL:
;;; Commentary:
;; A set of utility functions used when I was professionally developing software for Android Applications
;;
;; amarschke/logcat-mode-clear-logcat: A simple method to clear the buffer to reduce
;;                                     clutter in logcat when running a large batch of
;;                                     unit tests.
;;
;; amarschke/start-activity-at-point: Let ADB start an Android Application with the activity class-at-point
;;                                    as entry for the application to show.
;;
;; amarschke/gradle-subproject-dependency-packages: Find dependency packages for current gradlew project
;;
;; amarschke/gradle-load-javadocs-for-project: Loads javadoc packages for the dependencies in your gradle project
;;
;;; Code:

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


