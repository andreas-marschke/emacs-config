;(autoload 'perlcritic        "perlcritic" "" t)
;(autoload 'perlcritic-region "perlcritic" "" t)
;(autoload 'perlcritic-mode   "perlcritic" "" t)

(require 'cperl-mode)
;;(autoload 'perl-mode "cperl-mode" "alternate mode for editing Perl progs" t)
;(setq cperl-hairy t)

;; (defun xxtjaxx/perl-mode-hook ()
;;   (local-set-key [return] 'newline-and-indent)
;;   (setq indent-tabs-mode nil)
;;   (line-number-mode 1)
;;   (column-number-mode 1)
;;   (abbrev-mode 1)
;;   (cperl-mode)
;;   (setq compile-command (concat "perl -cw " buffer-file-name))
;;   )

;; (add-hook 'perl-mode-hook 'xxtjaxx/perl-mode-hook)
;(setq cperl-auto-newline-after-colon t)
;(setq cperl-autoindent-on-semi t)
;(setq cperl-extra-newline-before-brace nil)
;(setq cperl-indent-parens-as-block t)
