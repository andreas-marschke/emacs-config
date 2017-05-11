;;; emacs-rc-info.el --- info(1) additional configuration

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

(add-to-list  'Info-directory-list "~/.emacs.d/info")
(add-to-list  'Info-directory-list "/usr/share/info")
