;;; emacs-rc-git.el --- Git specific configuration

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

(custom-set-variables
 '(magit-diff-arguments
   (quote
    ("--stat" "--no-ext-diff" "--diff-algorithm=histogram")))
 '(magit-diff-mode-hook nil)
 '(magit-diff-paint-whitespace t)
 '(magit-diff-refine-hunk (quote all))
 '(magit-last-seen-setup-instructions "1.4.0" t)
 '(magit-save-some-buffers (quote dontask))
 '(magit-auto-revert-mode nil)
 '(magit-auto-revert-mode t)
 '(git-commit-summary-max-length 130))

(custom-set-faces
 '(magit-blame-heading ((t (:foreground "grey"))))
 '(magit-diff-added ((t (:background "black" :foreground "green"))))
 '(magit-diff-added-highlight ((t (:background "black" :foreground "green" :weight bold))))
 '(magit-diff-base ((t (:background "black" :foreground "red"))))
 '(magit-diff-base-highlight ((t (:background "black" :foreground "red" :weight bold))))
 '(magit-diff-removed ((t (:background "black" :foreground "red"))))
 '(magit-diff-removed-highlight ((t (:foreground "red" :weight bold))))
 '(magit-diffstat-added ((t (:foreground "green"))))
 '(magit-hash ((t (:foreground "blue"))))
 '(magit-item-highlight ((t (:inherit default))))
 '(magit-log-head-label-bisect-bad ((t (:background "black" :foreground "red" :box 1))))
 '(magit-log-head-label-bisect-good ((t (:background "black" :foreground "dark olive green" :box 1))))
 '(magit-log-head-label-bisect-skip ((t (:background "red" :foreground "white" :box 1)))))

