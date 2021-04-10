;;; init.el --- Emacs Initialization Configuration

;; Copyright (C) 2018-2019 Andreas Marschke

;; Author: Andreas Marschke <emacs@andreas-marschke.name>
;; Created: 24.07.2018
;; Version: 0.1
;; Package-Requires: ((use-package "20180715"))
;; Keywords:
;; URL: https://github.com/andreas-marschke/emacs-config
;;
;;; Commentary:
;; This is my personal Emacs initialization file.
;; It contains most if not all of what I need to work on:
;;  - Java Projects
;;  - Android Projects
;;  - Javascript Projects
;;
;;; Code:

;;; Package Initialization


;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(require 'package)

;;;; Archives
(setq package-archives
      '(("gnu" . "http://elpa.gnu.org/packages/")
        ("melpa" . "https://melpa.org/packages/")
        ("org" . "https://orgmode.org/elpa/")))

(package-initialize)

;; If it's not installed, bootstrap use-package
(if (not (package-installed-p 'use-package))
  (ignore-errors (package-install "use-package")(require 'use-package)))

;;;; Use-Package
(setq use-package-always-ensure t)
(setq use-package-compute-statistics t)

;;(unless package-archive-contents
;;  (package-refresh-contents))

;;; Basics
;;;; Emacs Startup/Runtime Configuration

;; Always load newest byte code
(setq load-prefer-newer t)

;; reduce the frequency of garbage collection by making it happen on
;; each 50MB of allocated data (the default is on every 0.76MB)
(setq gc-cons-threshold 50000000)

;; warn when opening files bigger than 100MB
(setq large-file-warning-threshold 100000000)

;;;; Personal Stuff

(setq user-full-name "Andreas Marschke"
      user-mail-address "emacs@andreas-marschke.name")

;; disable the annoying bell ring
(setq ring-bell-function 'ignore)

;; disable startup screen
(setq inhibit-startup-screen t)

;; Static Cursor
(blink-cursor-mode -1)

;; Disable Messages in Mini-Buffer
(setq minibuffer-message-timeout 0)

;; Custom-Set-Variables are Stored here
(setq custom-file "~/.emacs.d/custom-vars.el")
(load custom-file)

;; NO more ~ files
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;;;; UI

;; nice scrolling
(setq scroll-margin 0
      scroll-conservatively 100000
      scroll-preserve-screen-position 1)

;; mode line settings
(line-number-mode t)
(column-number-mode t)
(size-indication-mode t)

;; enable y/n answers
(fset 'yes-or-no-p 'y-or-n-p)

;;;; Editing

;; don't use tabs to indent
(setq-default indent-tabs-mode nil)

;; but maintain correct appearance
(setq-default tab-width 4)

;; delete the selection with a keypress
(delete-selection-mode t)

(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)

(setq auto-compression-mode t)
(setq auto-fill-mode nil)
(setq browse-url-browser-function 'browse-url-default-browser)
(setq column-number-mode t)
;;(add-to-list 'Info-directory-list "~/.emacs.d/info")
;;(add-to-list 'Info-directory-list "/usr/share/info")
(setq current-fill-column 240)

(defcustom js2r-kbd-prefix "C-c C-n"
  "JS2 Refactor Mode Keyboard Prefix used to invoke refactor calls.")

;; Emacs Server Utility used to setup socket for EmacsClient
(require 'server)

;; Directory Utils
(require 'dired-x)

;;; Use Packages!
(add-to-list 'load-path "~/.emacs.d/elisp/use-package")
(require 'use-package)

;;;; Utility Package
(use-package amarschke-util
  :commands
  ;; Navigate one window back (see: `C-h k C-x o')
  other-window-back
  menu-hide
  :load-path "~/.emacs.d/site-lisp/"
  :bind
  (("C-x o" . 'other-window)
   ("C-x p" . 'other-window-back)))

;;;; Load our Monster Package!

(use-package diminish
  :ensure t
  )

(use-package delight
  :ensure t)

(load "~/.emacs.d/rc/emacs-rc-apple.el")
(load "~/.emacs.d/rc/emacs-rc-screen.el")
(load "~/.emacs.d/rc/emacs-rc-misc.el")
(load "~/.emacs.d/rc/emacs-rc-misc-dev.el")
(load "~/.emacs.d/rc/emacs-rc-vue.el")
(load "~/.emacs.d/rc/emacs-rc-check.el")
(load "~/.emacs.d/rc/emacs-rc-helm.el")
(load "~/.emacs.d/rc/emacs-rc-projects.el")
(load "~/.emacs.d/rc/emacs-rc-org.el")
(load "~/.emacs.d/rc/emacs-rc-vcs.el")
(load "~/.emacs.d/rc/emacs-rc-jvm.el")
(load "~/.emacs.d/rc/emacs-rc-web.el")
(load "~/.emacs.d/rc/emacs-rc-completion.el")
(load "~/.emacs.d/rc/emacs-rc-logcat.el")

;; (use-package emacs-rc
;;   :requires
;;   emacs-rc-screen
;;   emacs-rc-misc  
;;   emacs-rc-misc-dev
;;   emacs-rc-projects
;;   emacs-rc-check
;;   emacs-rc-apple
;;   emacs-rc-jvm
;;   emacs-rc-vcs
;;   emacs-rc-web
;;   emacs-rc-helm
;;   emacs-rc-org
;;   emacs-rc-completion
;;   :load-path "~/.emacs.d/rc/")

(load "~/.emacs.d/rc/emacs-rc.el")

(menu-hide)

(when (not (eq window-system nil))
  
  (load-theme 'sanityinc-solarized-dark)
  
  (use-package highlight-indent-guides
    :diminish
    :ensure t
    :custom
    (highlight-indent-guides-method 'character)
    (highlight-indent-guides-character ?\|)
    :config
    (highlight-indent-guides-mode)
    :hook
    (prog-mode . highlight-indent-guides-mode))
  
  (use-package color-theme-sanityinc-solarized
    :functions color-theme-sanityinc-solarized
    :ensure t)
  
  (use-package color-theme-modern
    :ensure t
    :requires
    color-theme-sanityinc-solarized
    :custom
    ;;(custom-enabled-themes '(color-theme-sanityinc-solarized-dark))
    (custom-safe-themes
     '("4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" default))))

;;(server-start)

(defun init-file ()
  "Find-file `~/.emacs.d/init.el'."
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(custom-set-variables
  '(font-lock-maximum-decoration
    '((js-mode . t)
      (compilation-mode . t)
      (prog-mode . t))))

(global-set-key (kbd "M-i") 'indent-region)
(global-set-key (kbd "C-c C-o") 'browse-url-at-point)
(global-set-key (kbd "C-x b") 'helm-mini)

(dolist (key '("\M-k" "\M-l" "\M-j" "\M-i"))
    (global-unset-key key))
(global-unset-key (kbd "C-x i"))
(global-unset-key (kbd "C-x C-x"))

(setq ido-mode nil)
;;; this file ends here ---
