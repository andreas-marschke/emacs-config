;;; emacs-rc-flycheck.el --- Flycheck configuration

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
 '(flycheck-emacs-lisp-load-path "inherit")
 '(flycheck-checkers
   (quote
    (css-csslint
     css-stylelint
     emacs-lisp
     emacs-lisp-checkdoc
     groovy
     javascript-eslint
     json-jsonlint
     less
     less-stylelint
     perl
     perl-perlcritic
     rpm-rpmlint
     markdown-mdl
     nix
     sh-bash
     sh-posix-dash
     sh-posix-bash
     sh-shellcheck
     sql-sqlint
     systemd-analyze
     tex-chktex
     tex-lacheck
     texinfo
     xml-xmlstarlet
     xml-xmllint
     yaml-jsyaml
     )
    )
   )
 )
