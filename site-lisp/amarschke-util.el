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

(provide 'amarschke-util)
;;; --- amarschke-util.el ends here

