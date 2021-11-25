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
  :custom
  ((helm-input-idle-delay 0.25)
   (helm-display-function 'helm-default-display-buffer)
   (helm-display-buffer-reuse-frame t)
   (helm-use-undecorated-frame-option t))
  :bind
  (("M-x" . helm-M-x))
  :ensure t)

(use-package helm-company
  :requires
  (helm company)
  :ensure t
  :bind
  (("M-l" . helm-company)))

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

(use-package helm-etags-plus
  :bind
  (("M-," . helm-etags-plus-select))
  :hook
  ((helm-etags-plus-select-hook . etags-table-recompute))
  :ensure t)

;;(use-package helm-jstack
;;  :ensure t)
(use-package helm-cscope
  :ensure t)

(use-package helm-flycheck
  :ensure t)

(use-package helm-c-yasnippet
  :ensure t)

(use-package helm-projectile
  :after projectile
  :ensure t)

(use-package helm-org
  :after org
  :ensure t)

(use-package org-projectile-helm
  :ensure t
  :after
  (projectile helm org))
