;;; emacs-rc-check.el --- All *check related tools and linters Validating code

;; Copyright (C) 2019 Andreas Marschke

;; Author: Andreas Marschke <emacs@andreas-marschke.name>
;; Created: 21.04.2019
;; Version: 0.1
;; Package-Requires: (())
;; Keywords: flycheck,validation,linting
;; URL:
;;; Commentary:
;;
;;; Code:

(use-package flycheck
  :requires
  (flycheck-inline
   flycheck-checkbashisms
   flycheck-gradle)
  :hook
  ((flycheck-mode . flycheck-inline-mode)
   (java-mode . flycheck-mode)
   (prog-mode . flycheck-mode)
   (lisp-mode . flycheck-mode)
   (org-mode . flycheck-mode)
   (emacs-lisp-mode . flycheck-mode)
   (xml-mode . flycheck-mode)
   (groovy-mode . flycheck-mode)
   (markdown-mode . flycheck-mode)
   (js2-mode . flycheck-mode))
  :custom
  ((flycheck-emacs-lisp-load-path "inherit")))

(use-package flycheck-inline
  :config
  (flycheck-inline-mode)
  :ensure t)

(use-package flycheck-checkbashisms
  :ensure t)

(use-package flycheck-inline
  :ensure t)

(use-package flycheck-gradle
  :ensure t)

(use-package flycheck-vale
  :ensure t)

(use-package flycheck-cask
  :ensure t
  :hook
  (emacs-lisp-mode . flycheck-cask-setup))

(use-package flycheck-checkbashisms
  :ensure t
  :hook
  (sh-mode . flycheck-checkbashisms-setup))

(provide 'emacs-rc-check)
