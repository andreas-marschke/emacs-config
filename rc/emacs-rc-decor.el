;;; emacs-rc-decor.el ---

;; Copyright (C) 2003 Alex Ott
;;
;; Author: alexott@gmail.com
;; Keywords:
;; Requirements:
;; Status: not intended to be distributed yet

(require 'tree-widget)

(load-library "time")
(setq display-time-24hr-format t
	  display-time-mail-file t
	  display-time-form-list (list 'time 'load)
	  display-time-day-and-date t)
(display-time)
(blink-cursor-mode t)

;; Enable mouse wheel support.
(require 'mwheel)
(mwheel-install)

;; use y/n instead of yes/no
(fset 'yes-or-no-p 'y-or-n-p)

;; set misc decoration variables
(setq global-font-lock-mode t)
(setq uniquify-buffer-name-style (quote forward))
(setq use-dialog-box nil)
(setq column-number-mode t)
(setq display-time-mode t)
(setq show-paren-mode t)
(setq tool-bar-mode nil)
(setq custom-buffer-done-kill t)
(setq initial-scratch-message nil)
(setq transient-mark-mode t)
(setq font-lock-comment-face 'font-lock-comment-delimiter-face)
;;; emacs-rc-decor.el ends here
