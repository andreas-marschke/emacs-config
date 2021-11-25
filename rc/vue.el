;;; emacs-rc-vue.el --- Vue JS Configuration

;; Copyright (C) 2019 Andreas Marschke

;; Author: Andreas Marschke <emacs@andreas-marschke.name>
;; Created: 25.09.2019
;; Version: 0.1
;; Package-Requires: (())
;; Keywords: 
;; URL:
;;; Commentary:
;; This module provides configuration and package loading for VueJS-based development
;;
;;; Code:

(use-package vue-html-mode
  :ensure t)

(use-package vue-mode
  :ensure t)

