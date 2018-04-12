;;; emacs-rc-logcat.el --- Logcat addon code currently not planned to be added to the original source

;; Copyright (C) 2018 Andreas Marschke

;; Author: Andreas Marschke <emacs@andreas-marschke.name>
;; Created: 12.04.2018
;; Version: 0.1
;; Package-Requires: ((logcat))
;; Keywords: logcat, android, development
;; URL: https://github.com/andreas-marschke/emacs-config
;;; Commentary:
;; Code added here is so I have some convenience functions that I can use to work with logcat mode
;;
;;; Code:

(defun emacs-rc/logcat-mode-clear-logcat ()
  "Calls logcats clear option to clear the logcat buffer and restarts collection of logs in a new buffer"
  (interactive)
  (let ((buffer-read-only nil)
        (logcat-clear-command (concat logcat-fb-adb-program " " "logcat" " " "-c")))
    (logcat-stop)
    (erase-buffer)
    (let ((logcat-clear-call-return (shell-command-to-string logcat-clear-command)))
      (if (not (string-equal logcat-clear-call-return ""))
          (error (format "An Error occured clearing logcats buffer: %s" logcat-clear-call-return))
        )
      )
    (logcat-start)
    (setq buffer-read-only t)
    )
  )

;; Add C-x C-g as clearing console
(define-key logcat-mode-map [(control x) (control g)] 'emacs-rc/logcat-mode-clear-logcat)


