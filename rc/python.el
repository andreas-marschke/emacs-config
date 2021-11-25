;;; python.el --- Python Support packages and dependencies

;; Copyright (C) 2021 Andreas Marschke

;; Author: Andreas Marschke <emacs@andreas-marschke.name>
;; Created: 22.10.2021
;; Version: 0.1
;; Package-Requires: (())
;; Keywords: 
;; URL:
;;; Commentary:
;; 
;;
;;; Code:

(use-package elpy
  :ensure t
  :init
  (elpy-enable))
