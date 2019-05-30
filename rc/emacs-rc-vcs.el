;;; emacs-rc-vcs.el --- VCS interaction related code

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

(use-package git
  :ensure t)

(use-package magithub
  :ensure t
  :after magit)

(use-package magit
  :ensure t
  :bind
  ("C-c m" . magit-status))

(provide 'emacs-rc-vcs)
