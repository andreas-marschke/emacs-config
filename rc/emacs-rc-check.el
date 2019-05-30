;;; emacs-rc-check.el --- All *check related tools and linters Validating code

;; Copyright (C) 2019 Andreas Marschke

;; Author: Andreas Marschke <emacs@andreas-marschke.name>
;; Created: 21.04.2019
;; Version: 0.1
;; Package-Requires: (())
;; Keywords: 
;; URL:
;;; Commentary:
;;
;;; Code:

(use-package flycheck-inline
  :config
  (flycheck-inline-mode)
  :ensure t)

(use-package flycheck-cask
  :ensure t
  :hook
  (emacs-lisp-mode . flycheck-cask-setup))

(use-package flycheck-checkbashisms
  :ensure t
  :hook
  (sh-mode . flycheck-checkbashisms-setup))

(use-package flycheck
  :requires
  flycheck-inline
  flycheck-cask  
  flycheck-checkbashisms
  flycheck-css-colorguard
  flycheck-gradle
  flycheck-kotlin
  flycheck-objc-clang
  flycheck-swift
  :hook
  (
  (java-mode . flycheck-mode)
  (prog-mode . flycheck-mode)
  (lisp-mode . flycheck-mode)
  (emacs-lisp-mode . flycheck-mode)
  (xml-mode . flycheck-mode)
  (groovy-mode . flycheck-mode))
  :custom-face
  (flycheck-android-lint-severity-fatal-face ((t (:underline "DarkOrange2"))))
  (flycheck-android-lint-severity-information-face ((t (:stipple nil :underline "DarkOliveGreen2"))))
  :custom
  (flycheck-checkers '())
  (flycheck-emacs-lisp-load-path "inherit"))

(provide 'emacs-rc-check)
