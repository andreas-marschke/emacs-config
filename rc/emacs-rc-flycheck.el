;;; emacs-rc-flycheck.el --- Flycheck configuration

;; Copyright (C) 2017 Andreas Marschke.

;; Author: Andreas Marschke
;; Created: 14 Jul 2010
;; Version: 0.0
;; Package-Requires: (())
;; Keywords: flycheck
;; URL:
;;; Commentary:
;;
;;
;;; Code:

(require 'flycheck)

(setq flycheck-checkers
      (quote
       (asciidoctor
	asciidoc
	c/c++-clang
	c/c++-gcc
	c/c++-cppcheck
	css-csslint
	css-stylelint
	dockerfile-hadolint
	emacs-lisp
	emacs-lisp-checkdoc
	groovy
	html-tidy
	javascript-eslint
	javascript-standard
	json-jsonlint
	less
	less-stylelint
	lua-luacheck
	lua
	perl
	perl-perlcritic
	pug
	python-flake8
	python-pylint
	python-pycompile
	rpm-rpmlint
	markdown-mdl
	nix
	scss-lint
	scss-stylelint
	sass/scss-sass-lint
	sass
	scss
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
	yaml-ruby
	)
       )
      )

(defun projectile-find-flycheck-eslint-project-path ()
  "."
  (if (projectile-project-p)
      (let ((root (ignore-errors (projectile-project-root))))
	(when root
	  (setq my-flycheck-javascript-eslint-executable-path (concat root "node_modules/.bin/eslint"))
	  root
	  )
	)
    )
  )

(defvar my-flycheck-javascript-eslint-executable-path "")

(flycheck-define-checker my-javascript-eslint
  "A Javascript syntax and style checker using eslint.

See URL `https://github.com/eslint/eslint'."
  :command ("" (eval my-flycheck-javascript-eslint-executable-path) "--format=checkstyle"
            (option-list "--rulesdir" flycheck-eslint-rules-directories)
            "--stdin" "--stdin-filename" source-original)
  :standard-input t
  :error-parser flycheck-parse-checkstyle
  :error-filter
  (lambda (errors)
    (seq-do (lambda (err)
              ;; Parse error ID from the error message
              (setf (flycheck-error-message err)
                    (replace-regexp-in-string
                     (rx " ("
                         (group (one-or-more (not (any ")"))))
                         ")" string-end)
                     (lambda (s)
                       (setf (flycheck-error-id err)
                             (match-string 1 s))
                       "")
                     (flycheck-error-message err))))
            (flycheck-sanitize-errors errors))
    errors)
  :enabled (lambda () (flycheck-eslint-config-exists-p))
  :modes (js-mode js-jsx-mode js2-mode js2-jsx-mode js3-mode rjsx-mode)
  :next-checkers ((warning . javascript-jscs))
  :verify
  (lambda (_)
    (let* ((default-directory
             (projectile-find-flycheck-eslint-project-path))
           (have-config (flycheck-eslint-config-exists-p)))
      (list
       (flycheck-verification-result-new
        :label "config file"
        :message (if have-config "found" "missing")
        :face (if have-config 'success '(bold error)))))))


(eval-after-load 'flycheck
  '(progn
     (flycheck-add-mode 'html-tidy 'web-mode)
     (flycheck-add-mode 'css-csslint 'web-mode)
     (flycheck-add-mode 'javascript-eslint 'web-mode)))

;;;;



