;;; emacs-rc-keydefs.el --- Special key bindings

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

(require 'keydef)

(defun other-window-back ()
  ( interactive )
  (other-window -1))

(global-unset-key (kbd "C-x i"))

(keydef "C-x t" (multi-term) )
(keydef "C-c <up>" (enlarge-window 5))
(keydef "C-c <down>" (enlarge-window -5))
(keydef "C-c <left>" (enlarge-window 5 t))
(keydef "C-c <right>" (enlarge-window -5 t))

(keydef "C-x o" 'other-window)
(keydef "C-x p" 'other-window-back)
(keydef "C-c C-x i" 'indent-region)

(keydef "C-c C-c C-," 'outline-show-all)

(global-set-key "\C-cm" 'magit-status)
(global-set-key (kbd "C-x C-k C-k") 'gnus-kill-file-kill-by-author)
(global-set-key (kbd "C-h j") 'javadoc-lookup)
