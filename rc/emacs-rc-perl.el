;;; emacs-rc-perl.el ---

;; Copyright (C) 2003 Alex Ott
;;
;; Author: alexott@gmail.com
;; Keywords:
;; Requirements:
;; Status: not intended to be distributed yet


(autoload 'perlcritic        "perlcritic" "" t)
(autoload 'perlcritic-region "perlcritic" "" t)
(autoload 'perlcritic-mode   "perlcritic" "" t)

(require 'cperl-mode)
;; (autoload 'perl-mode "cperl-mode" "alternate mode for editing Perl progs" t)
(setq cperl-hairy t)

(defun xxtjaxx/perl-mode-hook ()
  ;;       (setq tab-width 2)
  (local-set-key [return] 'newline-and-indent)
  (setq indent-tabs-mode nil)
  (line-number-mode 1)
  (column-number-mode 1)
  (abbrev-mode 1)
  (turn-on-eldoc-mode)
  (cperl-mode)
  (setq compile-command (concat "perl -cw " buffer-file-name))
  (flymake-mode 1)
  )

(add-hook 'perl-mode-hook 'xxtjaxx/perl-mode-hook)

    ;; (eval-after-load "cperl-mode"
    ;;  '(add-hook 'cperl-mode-hook 'perlcritic-mode))
    ;; (eval-after-load "perl-mode"
    ;;  '(add-hook 'perl-mode-hook 'perlcritic-mode))

(setq cperl-auto-newline-after-colon t)
(setq cperl-autoindent-on-semi t)
(setq cperl-extra-newline-before-brace nil)
(setq cperl-indent-parens-as-block t)

;;; emacs-rc-perl.el ends here
