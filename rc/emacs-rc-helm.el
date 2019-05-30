;;; emacs-rc-helm.el --- Helm related configuration

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

(use-package helm
  :ensure t)

(use-package helm-company
  :requires
  (helm company)
  :ensure t
  :bind
  (("M-]" . helm-company)))

(use-package helm-ag
  :requires
  (helm ag)
  :ensure t)

(use-package helm-directory
  :ensure t)

(use-package helm-etags-plus
  :ensure t
  :bind
  ("M-j" . helm-etags-plus-select))

(use-package helm-gtags
  :ensure t)
;(use-package helm-jstack
;  :ensure t)
(use-package helm-flycheck
  :ensure t)
(use-package helm-c-yasnippet
  :ensure t)

(use-package helm-projectile
  :ensure t)

(provide 'emacs-rc-helm)
