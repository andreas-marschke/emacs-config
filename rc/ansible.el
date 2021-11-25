;;; emacs-rc-ansible.el --- Description

;; Copyright (C) 2020 Andreas Marschke

;; Author: Andreas Marschke <emacs@andreas-marschke.name>
;; Created: 13.05.2020
;; Version: 0.1
;; Package-Requires: ()
;; Keywords: ansible,config,app,admin,servers
;; URL:
;;; Commentary:
;; Just some configuration and dependency lines to get ansible integration setup in emacs
;;
;;; Code:

(use-package ansible
  :ensure t)

(use-package ansible-doc
  :ensure t)

;;(use-package ansible-vault
;;  :ensure t)

(use-package company-ansible
  :ensure t)
