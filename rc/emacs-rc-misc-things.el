;;; emacs-rc-misc-things.el --- Miscaleanous quality of life fixes

;; Copyright (C) 2017 Andreas Marschke

;; Author: <emacs@andreas-marschke.name>
;; Created: 03.05.2017
;; Version: 0.1
;; Package-Requires: (())
;; Keywords:
;; URL:
;;; Commentary:
;;
;;
;;; Code:

(custom-set-variables
 ;; Automatically decompress files for reading if possible
 '(auto-compression-mode t)
 ;; Scroll compilation
 '(compilation-scroll-output t)
 ;; Common User Access style editing, Copy, Paste, etc.
 '(cua-mode t nil (cua-base))

 ;; Column width max
 '(current-fill-column 240 t)
 '(fill-column 240)
 ;; Delete on selected region removes it
 '(delete-selection-mode t)

 '(develock-auto-enable nil)
 '(develock-max-column-plist nil)
 ;; Comment fontface
 '(font-lock-comment-face 'font-lock-comment-delimiter-face)
 ;; Enable Code Highlighting
 '(font-lock-mode t t)
 ;; Don't use tabs for indentation by default
 '(indent-tabs-mode nil)
 ;; Kills whole line if asked
 '(kill-whole-line t)
 ;; Scrolling in UI mode
 '(mouse-wheel-follow-mouse (quote t))
 '(mouse-wheel-progressive-speed nil)
 '(mouse-wheel-scroll-amount (quote (1 ((shift) . 1))))
 ;; Don't add new lines when scrolling to last line
 '(next-line-add-newlines nil)
 ;; Use tab always as indent command unless otherwise bound
 '(tab-always-indent t)
 ;; Columns for tab width display
 '(tab-width 4)
 '(user-full-name "Andreas Marschke")
 )

;; unmark some function
(put 'upcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)


