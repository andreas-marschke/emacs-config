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

(defun disable-font-lock-mode (&rest arg)
  (font-lock-mode nil))

;;(add-to-list 'compilation-start-hook 'disable-font-lock-mode)

;; (add-to-list 'compilation-error-regexp-alist-alist '(gradle-build-file-error "^Build file '\\(/.*\\)' line: \\([0-9]*\\)" 1 2))
;; (add-to-list 'compilation-error-regexp-alist 'gradle-build-file-error)

;; (add-to-list 'compilation-error-regexp-alist-alist '(gradle-script-file-error "^Script '\\(/.*\\)' line: \\([0-9]*\\)" 1 2))
;; (add-to-list 'compilation-error-regexp-alist 'gradle-script-file-error)

;; (add-to-list 'compilation-error-regexp-alist-alist '(c-mode-warning-compilation "----------
;; \\([0-9]+. WARNING in \\(.*\\)
;;  (at line \\([0-9]+\\))
;; \\(\\(.*
;; \\)+?\\).*^+
;; \\(.*
;; \\)\\)" 2 3 nil 1 1
;; (6 compilation-warning-face)) t)
;; (add-to-list 'compilation-error-regexp-alist 'c-mode-warning-compilation)
;; (add-to-list 'compilation-error-regexp-alist-alist '(c-mode-error-compilation "----------
;; \\([0-9]+. ERROR in \\(.*\\)
;;  (at line \\([0-9]+\\))
;; \\(\\(.*
;; \\)+?\\).*^+
;; \\(.*
;; \\)\\)" 2 3 nil 2 1
;; (6 compilation-error-face)) t)
;; (add-to-list 'compilation-error-regexp-alist 'c-mode-error-compilation)

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
  (defun  compilation-support-ansi-color (&rest args)
    (when (eq major-mode 'compilation-mode)
      (ansi-color-apply-on-region compilation-filter-start (point-max))))
  (defun compilation-enable-font-lock (&rest args)
    (font-lock-mode 2))
  (add-hook 'compilation-finish-functions 'compilation-support-ansi-color)
  (add-hook 'compilation-finish-functions 'compilation-enable-font-lock))

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

(require 'cedet)
(require 'semantic)
(dolist (mode-hook '(jde-mode-hook java-mode-hook c-mode-hook c++-mode-hook groovy-mode-hook)
                   (add-to-list 'mode-hook 'semantic-minor-mode)))

(custom-set-variables 
 '(semantic-mode t)
 '(senator-highlight-found nil)
 '(senator-step-at-start-end-tag-classes nil)
 '(global-semantic-decoration-mode nil)
 '(global-semantic-highlight-edits-mode t)
 '(global-semantic-highlight-func-mode t)
 '(global-semantic-idle-breadcrumbs-mode t)
 '(global-semantic-idle-completions-mode t)
 '(global-semantic-idle-local-symbol-highlight-mode t)
 '(global-semantic-idle-summary-mode t)
 '(global-semantic-mru-bookmark-mode nil)
 '(global-semantic-show-parser-state-mode t)
 '(global-semantic-show-unmatched-syntax-mode nil)
 '(global-semantic-stickyfunc-mode t)
 '(semantic-analyze-summary-function 'semantic-format-tag-short-doc)
 '(semantic-complete-inline-analyzer-displayor-class 'semantic-displayor-tooltip)
 '(semantic-complete-inline-analyzer-idle-displayor-class 'semantic-displayor-tooltip)
 '(semantic-decoration-mode t)
 '(semantic-decoration-styles '())
 ;;'(("semantic-decoration-on-includes")
 ;; ("semantic-decoration-on-protected-members")
 ;; ("semantic-decoration-on-private-members")))
 '(semantic-default-submodes
   '(global-semantic-idle-completions-mode
     global-semantic-idle-scheduler-mode
     global-semanticdb-minor-mode
     global-semantic-idle-summary-mode
     global-semantic-idle-local-symbol-highlight-mode
     ))
 '(semantic-displayor-tooltip-mode 'verbose)
 '(semantic-mode-line-prefix "SEM" nil (semantic/util-modes))
 '(semantic-sb-autoexpand-length 2)
 '(semantic-show-unmatched-syntax-mode nil nil))

(use-package yasnippet
  :diminish yas-minor-mode
  :ensure t
  :hook
  ((prog-mode . yas-minor-mode)
   (org-mode . yas-minor-mode))
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

;; Disable Semantic-Idle-Scheduler-Function errors
(advice-add 'semantic-idle-scheduler-function :around #'ignore)

;; (use-package paredit
;;   :hook
;;   (emacs-lisp-mode . paredit-mode))

(provide 'emacs-rc-misc-dev)
