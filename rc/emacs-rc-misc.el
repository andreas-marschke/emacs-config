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

;;;; Utilities

;;; XXX Maybe I'll play around with it again at some point...
;; (use-package emms
;;   :custom
;;   (emms-info-functions '(emms-info-libtag))
;;   (emms-source-file-default-directory "~/share/audio/kemp/")
;;   (emms-player-list '(emms-player-mpg321
;;                      emms-player-ogg123
;;                      emms-player-mplayer))
;;   :config
;;   (require 'emms-setup)
;;   (require 'emms-player-mplayer)
;;   (require 'emms-info-libtag)
;;   (define-emms-simple-player mplayer '(file url)
;;     (regexp-opt '(".ogg" ".mp3" ".wav" ".mpg" ".mpeg" ".wmv" ".wma"
;;                   ".mov" ".avi" ".divx" ".ogm" ".asf" ".mkv" "http://" "mms://"
;;                   ".rm" ".rmvb" ".mp4" ".flac" ".vob" ".m4a" ".flv" ".ogv" ".pls"))
;;     "mplayer" "-slave" "-quiet" "-really-quiet" "-fullscreen")
;;   (emms-all)
;;   (emms-default-players))

;; Window configuration
(use-package windata)

;; Tree Widget Management
(use-package tree-mode)

(require 'info)

;; Mode Sensitive Info lookup
(require 'info-look)

;; Emacs Lisp documentation
(require 'eldoc)

;; Searching
(use-package ack
  :ensure t)

;; Ag searching
(use-package ag
  :ensure t)

;; ipcalc
(use-package ipcalc)

;; CSV Highlighting
(use-package csv-mode
  :ensure t)

(use-package adoc-mode
  :ensure t
  :mode "\\.adoc\\'")

(use-package markdown-mode
  :ensure t
  :init
  :mode
  "\\.\\(mdwn\\|markdown\\|md\\)\\'")

;; Multiple Terminals in Emacs
(use-package multi-term
  :ensure t
  :bind ("C-x t" . multi-term)
  :custom
  (multi-term-program "/bin/bash"))

;;; FIXME: Needs REVIEW
;; (custom-set-variables
;;  ;; Automatically decompress files for reading if possible
;;  '(auto-compression-mode t)
;;  ;; Scroll compilation
;;  '(compilation-scroll-output t)
;;  ;; Common User Access style editing, Copy, Paste, etc.
;;  '(cua-mode t nil (cua-base))

;;  ;; Column width max
;;  '(current-fill-column 240 t)
;;  '(fill-column 240)
;;  ;; Delete on selected region removes it
;;  '(delete-selection-mode t)

;;  '(develock-auto-enable nil)
;;  '(develock-max-column-plist nil)
;;  ;; Comment fontface
;;  '(font-lock-comment-face 'font-lock-comment-delimiter-face)
;;  ;; Enable Code Highlighting
;;  '(font-lock-mode t t)
;;  ;; Don't use tabs for indentation by default
;;  '(indent-tabs-mode nil)
;;  ;; Kills whole line if asked
;;  '(kill-whole-line t)
;;  ;; Scrolling in UI mode
;;  '(mouse-wheel-follow-mouse (quote t))
;;  '(mouse-wheel-progressive-speed nil)
;;  '(mouse-wheel-scroll-amount (quote (1 ((shift) . 1))))
;;  ;; Don't add new lines when scrolling to last line
;;  '(next-line-add-newlines nil)
;;  ;; Use tab always as indent command unless otherwise bound
;;  '(tab-always-indent t)
;;  ;; Columns for tab width display
;;  '(tab-width 4)
;;  '(user-full-name "Andreas Marschke")
;;  )

(use-package neotree
  :ensure t)

(provide 'emacs-rc-misc)
