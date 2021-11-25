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

;; Window configuration
(use-package windata)

;; Tree Widget Management
(use-package tree-mode)

(require 'info)

;; Mode Sensitive Info lookup
(require 'info-look)

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
  :bind
  (("C-x t" . multi-term))
  :custom
  ((multi-term-program "/bin/bash")
   (multi-term-try-create t)
   (multi-term-buffer-name "shell")
   (multi-term-scroll-show-maximum-output t)
   (multi-term-scroll-to-bottom-on-output t)))

(setq Info-directory-list (append Info-directory-list '("/Users/amarschk/src/lisp/emacs-mac/info")))

(use-package neotree
  :bind
  (("<f12>" . neotree-toggle))
  :ensure t)

(use-package calfw
  :bind
  (("<f6>" . cfw:open-org-calendar))
  :custom
  ((cfw:org-capture-template
    '(("c" "calfw2org" entry (file nil)  "* %?
 %(cfw:org-capture-day)"))))
  :ensure t)

(use-package calfw-cal
  :ensure t)

(use-package calfw-org
  :ensure t)
(use-package calfw-ical
  :ensure t)

(use-package calibredb
  :ensure t)

(use-package german-holidays
  :ensure t
  :config
  (setq calendar-holidays (append calendar-holidays holiday-german-NW-holidays)))


;;; misc.el ends here
