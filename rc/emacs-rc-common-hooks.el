;;; emacs-rc-common-hooks.el --- Common across emacs hooks needed to be installed

;; Copyright (C) 2017 Andreas Marschke

;; Author:  <emacs@andreas-marschke.name>
;; Created: 03.05.2017
;; Version: 0.1
;; Package-Requires: (())
;; Keywords: 
;; URL:
;;; Commentary:
;; 
;;
;;; Code:

(defface font-lock-post-face
  '(( ((class color) (min-colors 8))
          (:foreground "yellow" :weight bold)
         ))
  "Documentation")

(defun mail-add-signature()
  "Insert Signature in Mail"
  (insert-file "~/.signature"))

;; Shows Emacs Menu should I intend to use emacs in a GUI
(defun menu-show()
  "Show menu toggle"
  (interactive)
  (dolist (m '(menu-bar-mode scroll-bar-mode blink-cursor-mode))
    (if (boundp m)
	(funcall m 1)))
  )

(defun menu-hide()
  "Called from init.el to hide menu when in termninal"
  (interactive)
  (dolist (m '(menu-bar-mode scroll-bar-mode blink-cursor-mode))
    (if (boundp m)
	(funcall m -1)))
  )

(defadvice web-mode-highlight-part (around tweak-jsx activate)
  "Web-mode support for JSX/React"
  (if (equal web-mode-content-type "jsx")
      (let ((web-mode-enable-part-face nil))
	ad-do-it)
    ad-do-it))

;; Have Web-Mode use Django For nunjucks highlighting
(defun web-mode-use-django-engine()
  "If file ends with .nunjucks, use django-mode syntax highlighting"
  (when (and (stringp buffer-file-name)
	     (string-match "\\.nunjucks" buffer-file-name))
    (web-mode-set-engine "django"
			 )))

;; (defun auto-fill-disable ()
;;   "Disable Auto-Fill-Mode"
;;   (auto-fill-mode nil)
;;   )

(defun outline-easy-bindings-load()
  (require 'outline-mode-easy-bindings nil t))

;;; Outline-minor-mode addtl. hooks for easy bindings
(add-hook 'outline-minor-mode-hook 'outline-easy-bindings-load)
(add-hook 'outline-minor-mode-hook 'outshine-hook-function)

;;; Global hooks
(add-hook 'dired-load-hook '(lambda () (require 'dired-x)))
(add-hook 'after-init-hook 'global-company-mode)
(add-hook 'after-init-hook 'global-flycheck-mode)

;;; Mode-specific hooks
;;(add-hook 'js2-mode-hook 'auto-fill-disable)
(add-hook 'emacs-lisp-mode-hook 'outline-minor-mode)
(add-hook 'js2-mode-hook 'outline-minor-mode)
(add-hook 'java-mode-hook 'outline-minor-mode)
(add-hook 'web-mode-hook 'web-mode-use-django-engine)
(add-hook 'outline-minor-mode-hook 'outshine-hook-function)

