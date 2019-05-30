;;; emacs-rc-prog-misc.el --- Misceleanous Developer improvements

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

(add-to-list 'auto-mode-alist '("\\.screenrc$" . conf-mode))
(add-to-list 'auto-mode-alist '("Doxyfile$" . conf-mode))
(add-to-list 'auto-mode-alist '("\\.editorconfig$" . conf-mode))

(use-package proguard-mode
  :load-path "~/.emacs.d/elisp/proguard-mode"
  :mode
  ("proguard-.*\\.txt\\'"
   "proguard-rules\\.pro\\'"
   "\\.pro\\'"))

(use-package gitignore-mode
  :mode
  ("\\.?gitignore\\'"
   "\\.?gitignore_global\\'"))

(use-package rpm-spec-mode
  :mode
  ("\\.spect\\'" . rpm-spec-mode)
  :ensure t)

;; Nagios configuration files
(use-package nagios-mode
  :load-path "~/.emacs.d/elisp/nagios-mode/")

;; IOS Configuration
(use-package ios-config-mode
  :mode
  "\\.ios-cfg\\'"
  :load-path "~/.emacs.d/elisp/ios-config-mode")

;; (use-package smerge-mode
;;   :hook
;;   ((diff-mode . smerge-mode)))

(use-package hl-todo
  :custom
  (global-hl-todo-mode t)
  :ensure t
  :requires (groovy-mode)
  :hook
  (prog-mode . hl-todo-mode)
  (groovy-mode . hl-todo-mode))

(use-package highlight-numbers
  :ensure t
  :hook
  (prog-mode . highlight-numbers-mode))

;; whitespace mode
(use-package whitespace-cleanup-mode
  :functions
  whitespace-mode
  whitespace-cleanup
  ;; XXX: Use in graphical mode
  ;;:config
  ;;;(whitespace-toggle-options t)
  :custom
  (whitespace-global-mode nil)
  (global-whitespace-newline-mode nil)
  (whitespace-modes '(awk-mode))
  (whitespace-silent t)
  :custom-face
  (whitespace-empty ((t (:foreground "DodgerBlue4"))))
  (whitespace-indentation ((t (:foreground "DodgerBlue4"))))
  (whitespace-line ((t nil)))
  (whitespace-space ((t (:foreground "DodgerBlue4"))))
  (whitespace-newline ((t (:foreground "dark slate gray"))))
  (whitespace-space-after-tab ((t (:foreground "DodgerBlue2"))))
  (whitespace-space-before-tab ((t (:background "DodgerBlue2" :foreground "blue")))))

;;;;;; Mother of all C-likes cc-mode
(custom-set-variables
 '(c-basic-offset '2)
 '(c-default-style '((java-mode . "gnu")))
 '(c-insert-tab-function 'insert-tab)
 '(c-offsets-alist
   '((inline-open . 0)
     (inline-close . 0)
     (block-open . 0)
     (block-close . 0)
     (topmost-intro . 0)
     (inclass . +)
     (member-init-intro . +)
     (substatement-open . 0)
     (statement-block-intro . +)
     (func-decl-cont . 0)
     (defun-block-intro . +)
     (c-lineup-C-comments . 1))))

(require 'cperl-mode)

(add-to-list 'auto-mode-alist '("\\.t$" . cperl-mode))
(add-to-list 'auto-mode-alist '("\\.pl$" . cperl-mode))

(use-package rainbow-delimiters
  :custom-face
  (rainbow-delimiters-depth-2-face ((t (:foreground "pink3"))))
  (rainbow-delimiters-depth-7-face ((t (:foreground "PaleGreen3"))))
  :config
  (show-paren-mode)
  :hook
  (emacs-lisp-mode . rainbow-delimiters-mode)
  (js2-mode . rainbow-delimiters-mode)
  :ensure t)

(use-package outshine
  :ensure t
  :diminish outshine-mode outline-minor-mode
  :hook
  ((emacs-lisp-mode . outshine-mode)
   (java-mode . outshine-mode)))

(ignore-errors
  (require 'ansi-color)
  (defun my-colorize-compilation-buffer ()
    (when (eq major-mode 'compilation-mode)
      (ansi-color-apply-on-region compilation-filter-start (point-max))))
  (add-hook 'compilation-filter-hook 'my-colorize-compilation-buffer))

;;;;;; Make Copy & Paste "work"
(custom-set-variables
 '(cua-mode 1)
 '(cua-toggle-set-mark t)
 '(cua-enable-cua-keys t))

;;;;;; Compilation Mode
(custom-set-variables
 '(compilation-scroll-output t)
 '(compilation-ask-about-save nil)
 '(compilation-buffer-name-function
   (lambda (mode)
      (let ((buffer-tag-name ""))
        (cond
         ((and (projectile-mode) (projectile-project-p))
          (setq buffer-tag-name (projectile-project-name)))
         (t
          (setq buffer-tag-name (file-name-base (directory-file-name default-directory)))))
        (concat buffer-tag-name "/" mode)))))

;;;;; Tags and Symbol Lookup
(custom-set-variables
 '(tags-revert-without-query 1))

(use-package etags-select
  :ensure t)

(use-package ggtags
  :ensure t
  :hook
  ((c-mode-common . (lambda ()
                      (when (derived-mode-p 'c-mode 'c++-mode 'java-mode)
                        (ggtags-mode 1))))))

;; (use-package semantic
;;   :hook
;;   (prog-mode . semantic-mode)
;;   :custom
;;   (senator-highlight-found t)
;;   (senator-step-at-start-end-tag-classes nil)
;;   (global-semantic-decoration-mode nil)
;;   (global-semantic-highlight-edits-mode nil)
;;   (global-semantic-highlight-func-mode nil)
;;   (global-semantic-idle-breadcrumbs-mode nil nil (semantic/idle))
;;   (global-semantic-idle-completions-mode nil nil (semantic/idle))
;;   (global-semantic-idle-local-symbol-highlight-mode nil nil (semantic/idle))
;;   (global-semantic-idle-summary-mode nil)
;;   (global-semantic-mru-bookmark-mode nil)
;;   (global-semantic-show-parser-state-mode nil)
;;   (global-semantic-show-unmatched-syntax-mode nil)
;;   (global-semantic-stickyfunc-mode nil)
;;   (semantic-analyze-summary-function 'semantic-format-tag-short-doc)
;;   (semantic-complete-inline-analyzer-displayor-class 'semantic-displayor-tooltip)
;;   (semantic-complete-inline-analyzer-idle-displayor-class 'semantic-displayor-tooltip)
;;   ;; TODO: nil, necessary or bad face vals?
;;   (semantic-decoration-mode nil)
;;   (semantic-decoration-styles
;;     '(("semantic-decoration-on-includes")
;;       ("semantic-decoration-on-protected-members")
;;       ("semantic-decoration-on-private-members")
;;       ("semantic-tag-boundary")))
;;   (semantic-default-submodes
;;    '(global-semantic-idle-completions-mode
;;      ;;global-semantic-idle-scheduler-mode
;;      global-semanticdb-minor-mode
;;      ;;global-semantic-idle-summary-mode
;;      ;;global-semantic-idle-local-symbol-highlight-mode
;;      ))
;;   (semantic-displayor-tooltip-mode 'verbose)
;;   (semantic-mode-line-prefix "SEM" nil (semantic/util-modes))
;;   (semantic-sb-autoexpand-length 2)
;;   (semantic-show-unmatched-syntax-mode nil nil))

(use-package yasnippet
  :diminish yas-minor-mode
  :ensure t
  :hook
  (prog-mode . yas-minor-mode)
  :custom
  ;; XXX: Are there inline overlays for what's being attempted here?
  (yas-prompt-functions '(yas-dropdown-prompt yas-completing-prompt yas-no-prompt))
  :config
  (add-to-list 'yas-snippet-dirs "~/.emacs.d/snippets/")
  (yas-reload-all))

(add-to-list 'auto-mode-alist '("\\(\\.\\|\\)bashrc\\'" . sh-mode))
(add-to-list 'auto-mode-alist '("\\(\\.\\|\\)bash_.*\\'" . sh-mode))
(add-to-list 'auto-mode-alist '("\\.sh\\'" . sh-mode))
(add-hook 'sh-set-shell-hook 'sh-learn-buffer-indent)

;; (use-package paredit
;;   :hook
;;   (emacs-lisp-mode . paredit-mode))

(provide 'emacs-rc-misc-dev)
