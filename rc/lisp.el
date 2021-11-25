;;; emacs-rc-emacs-lisp.el --- Emacs Lisp Development tools

;; Copyright (C) 2019 Andreas Marschke

;; Author: Andreas Marschke <emacs@andreas-marschke.name>
;; Created: 21.04.2019
;; Version: 0.1
;; Package-Requires: (())
;; Keywords: 
;; URL:
;;; Commentary:
;; 
;;
;;; Code:

;; Emacs Lisp documentation
(use-package eldoc
  :ensure t
  :hook
  ((ielm-mode-hook . eldoc-mode)
   (eval-expression-minibuffer-setup-hook . eldoc-mode))
  :custom
  ((global-eldoc-mode t)
   (eldoc-echo-area-use-multiline-p t))
  :diminish global-eldoc-mode)

(diminish 'eldoc-mode nil)

(add-hook 'emacs-lisp-mode-hook 'eldoc-mode)
;;(add-hook 'lisp-interaction-mode-hook 'eldoc-mode)
;;(add-hook 'ielm-mode-hook 'eldoc-mode)
;;(add-hook 'eval-expression-minibuffer-setup-hook 'eldoc-mode)

;; edebug-extensions
(use-package edebug-x
  :requires edebug
  :functions edebug-x-mode
  :load-path "~/src/elisp/edebug-x/"
  :ensure t
  :bind
  (:map edebug-x-mode-map
        ("C-c SPC" . edebug-x-modify-breakpoint-wrapper)
        ("C-x SPC" . nil))
  :hook
  (edebug-mode . edebug-x-mode))

;; cask project file highlighting
(use-package cask-mode
  :ensure t
  :mode
  "Cask\\'")

(provide 'emacs-rc-emacs-lisp)
