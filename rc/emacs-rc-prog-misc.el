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

;; gtags
(autoload 'gtags-mode "gtags" "" t)

;; Working with RPM specs
(autoload 'rpm-spec-mode "rpm-spec-mode" "RPM spec mode." t)
(add-to-list 'auto-mode-alist '("\\.spec$" . rpm-spec-mode))

;; better diff3 minor mode
(autoload 'smerge-mode "smerge-mode" nil t)

;; PO translation mode
(autoload 'po-mode "po-mode"  "Major mode for translators to edit PO files" t)
(add-to-list 'auto-mode-alist '("\\.po$\\|\\.po\\." . po-mode))

;; whitespace mode
(autoload 'whitespace-mode "whitespace" "Toggle whitespace visualization." t)
(autoload 'whitespace-toggle-options "whitespace" "Toggle local `whitespace-mode' options." t)
(custom-set-variables
 '(whitespace-global-mode nil)
 '(whitespace-modes (quote (awk-mode)))
 '(whitespace-silent t))

;; automatically indenting yanked text if in programming-modes
(defvar yank-indent-modes '(TeX-mode
                c++-mode
                clojure-mode
                cperl-mode
                emacs-lisp-mode
                jde-mode
                js2-mode
                lisp-mode
                sql-mode
                LaTeX-mode
                c-mode
                java-mode
                lisp-interaction-mode
                perl-mode
                scheme-mode
                tcl-mode)
  "Modes in which to indent regions that are yanked (or yank-popped)")
(add-hook 'prog-mode-hook #'highlight-symbol-mode)

(defadvice yank (after indent-region activate)
  "If current mode is one of 'yank-indent-modes, indent yanked text (with prefix arg don't indent)."
  (if (member major-mode yank-indent-modes)
      (let ((mark-even-if-inactive t))
        (indent-region (region-beginning) (region-end) nil))))

(defadvice yank-pop (after indent-region activate)
  "If current mode is one of 'yank-indent-modes, indent yanked text (with prefix arg don't indent)."
  (if (member major-mode yank-indent-modes)
      (let ((mark-even-if-inactive t))
        (indent-region (region-beginning) (region-end) nil))))

(autoload 'paredit-mode "paredit" "Minor mode for pseudo-structurally editing Lisp code." t)

(eldoc-add-command 'paredit-backward-delete 'paredit-close-round)
