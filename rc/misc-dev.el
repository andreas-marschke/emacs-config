;;; emacs-rc-prog-misc.el --- Misceleanous Developer improvements
;;
;; Copyright (C) 2017 Andreas Marschke
;;
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

(require 'sgml-mode)

(defun xml-reformat-region (start end)
  "Reformat a region of XML between START and END."
  (interactive "r")
  (save-excursion
    (when (region-active-p)
      (sgml-pretty-print start end)
      (indent-region start end))))


(use-package git-modes
  :mode
  ("\\.?gitignore\\'"
   "\\.?gitignore_global\\'"))

(use-package rpm-spec-mode
  :mode
  ("\\.spect\\'" . rpm-spec-mode)
  :ensure t)

(use-package dockerfile-mode
  :ensure t)

(use-package hl-todo
  :custom
  (global-hl-todo-mode nil)
  :ensure t
  :hook
  ((groovy-mode . hl-todo-mode)
   (java-mode . hl-todo-mode)
   (emacs-lisp-mode . hl-todo-mode)))

(use-package mermaid-mode
  :mode
  "\\.mmd\\'"
  :ensure t)

(use-package csharp-mode
  :ensure t
  :mode
  "\\.cs\\'")
;; (use-package highlight-numbers
;;   :ensure t
;;   :hook
;;   (prog-mode . highlight-numbers-mode))

;; whitespace mode
(use-package whitespace-cleanup-mode
  :functions
  whitespace-mode
  whitespace-cleanup
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

(use-package xcscope
  :ensure t)

(use-package imenu-list
  :ensure t)

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

;;;;;; Make Copy & Paste "work"
(custom-set-variables
 '(cua-mode 1)
 '(cua-toggle-set-mark t)
 '(cua-enable-cua-keys t))

;;;;;; Compilation Mode

(defun amarschke/compilation-buffer-name-function (mode)
  "Renames the compilation buffer according to the project you're in. This is handy if you have multiple
 projects open and wish to work on and compile more than one project at the same time and especially important
 if you have long running compile or development processes you wish to start this way.

This function is called by `compilation-buffer-name-function' to provide naming. See its documentation for further information."
  (let ((buffer-tag-name ""))
        (cond
         ((and (projectile-mode) (projectile-project-p))
          (setq buffer-tag-name (projectile-project-name)))
         (t
          (setq buffer-tag-name (file-name-base (directory-file-name default-directory)))))
        (concat buffer-tag-name "/" mode)))

(custom-set-variables
 '(compilation-scroll-output t)
 '(compilation-ask-about-save nil)
 '(compilation-buffer-name-function
   amarschke/compilation-buffer-name-function))

;;;;; Tags and Symbol Lookup
(custom-set-variables
 '(tags-revert-without-query t))

(use-package ggtags
  :ensure t
  :hook
  ((c-mode-common . (lambda ()
                      (when (derived-mode-p 'c-mode 'c++-mode 'java-mode)
                        (ggtags-mode 1))))))

(defun addon-yas/helm-prompt (prompt choices &optional display-fn)
  "Use helm to select a snippet. Put this into `yas-prompt-functions.'"
  (interactive)
  (if (require 'helm-config nil t)
      (let ((result (helm-other-buffer
                     (list `((name . ,prompt)
                             (candidates . ,(if display-fn (mapcar display-fn choices)
                                              choices))
                             (action . (("Expand" . identity)))))
                     "*helm-select-yasnippet")))
        (cond ((null result)
               (signal 'quit "user quit!"))
              (display-fn
               (catch 'result
                 (dolist (choice choices)
                   (when (equal (funcall display-fn choice) result)
                     (throw 'result choice)))))
              (t result)))
    nil))

(use-package yasnippet
  :diminish yas-minor-mode
  :ensure t
  :custom
  (yas/global-mode 1)
  (yas-snippet-dirs '("~/.emacs.d/snippets/"))
  (yas-prompt-functions '(addon-yas/helm-prompt)))

(add-to-list 'auto-mode-alist '("\\(\\.\\|\\)bashrc\\'" . sh-mode))
(add-to-list 'auto-mode-alist '("\\(\\.\\|\\)bash_.*\\'" . sh-mode))
(add-to-list 'auto-mode-alist '("\\.sh\\'" . sh-mode))
(add-hook 'sh-set-shell-hook 'sh-learn-buffer-indent)

(use-package mermaid-mode
  :mode ("\\.mmd\\'")
  :ensure t)

(use-package ob-mermaid
  :ensure t)

(use-package bazel
  :ensure t)

(use-package protobuf-mode
  :ensure t)

(use-package yaml-mode
  :ensure t)

;; Establish basic list of compilation highlighters used
;; this is necessary since our other RCs are establishing additional highlight code
(setq compilation-error-regexp-alist
      '(ant
        bash
        python-tracebacks-and-caml
        cmake
        cmake-info
        comma
        cucumber
        java
        maven
        clang-include
        gcc-include
        ruby-Test::Unit
        gmake
        gnu
        perl
        php
        rxp
        perl--Pod::Checker
        perl--Test
        perl--Test2
        perl--Test::Harness
        weblint))

