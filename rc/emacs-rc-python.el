;;; emacs-rc-python.el ---

;; Copyright (C) Andreas Marschke
;;
;; Author: andreas.marschke@gmail.com
;; Keywords:
;; Requirements:
;; Status: not intended to be distributed yet

;; support for Python and Django


;; Templating helper for Django Templates
(setq auto-mode-alist
      (append '(("\\.html$" . django-html-mumamo-mode)) auto-mode-alist))
(setq mumamo-background-colors nil)
(add-to-list 'auto-mode-alist '("\\.html$" . django-html-mumamo-mode))
(setq mumamo-display-error-lwarn nil)
(setq mumamo-per-buffer-local-vars-done-by-me nil)
;; Workaround the annoying warnings:
;;    Warning (mumamo-per-buffer-local-vars):
;;    Already 'permanent-local t: buffer-file-name
(eval-after-load "mumamo"
  '(setq mumamo-per-buffer-local-vars
	 (delq 'buffer-file-name mumamo-per-buffer-local-vars)))
