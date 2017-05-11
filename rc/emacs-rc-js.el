;;; emacs-rc-js.el --- Javascript Development Configuration

;; Copyright (C) 2017 Andreas Marschke

;; Author:  <emacs@andreas-marschke.name>
;; Created: 03.05.2017
;; Version: 0.
;; Package-Requires: (())
;; Keywords: 
;; URL:
;;; Commentary:
;; 
;;
;;; Code:

(autoload 'js2-mode "js2-mode" nil t)

(eval-after-load 'js2-mode
  '(progn (define-key js2-mode-map (kbd "TAB")
	    (lambda()
	      (interactive)
	      (let ((yas/fallback-behavior 'return-nil))
		(unless (yas/expand)
		  (indent-for-tab-command)
		  (if (looking-back "^\s*")
		      (back-to-indentation))))))))

(add-to-list 'compilation-error-regexp-alist '("^\s*[exec]\s*at\s\\(.*\\):\\(\d*\\):\\(\d*\\)" 1 2 3))
(add-to-list 'compilation-error-regexp-alist '("^\\(.*\\): line \\([0-9]*\\), col \\([0-9]*\\), \\(Error\\|Warning\\) - \\(.*\\)$" 1 2 3))
(add-to-list 'compilation-error-regexp-alist '("^\s*at\s\\(.*\\) (\\([0-9]*\\):\\([0-9]*\\)) $" 1 2 3))
(add-to-list 'compilation-error-regexp-alist '("^\s*at\s\\([0-9]*\\):\\([0-9]*\\) $" 1 2 3))
(add-to-list 'compilation-error-regexp-alist '("^(\w+)$\n^\s*\\([0-9]*\\):\\([0-9]*\\)\s*error\s*\\(.*\\)" 1 2 3))

(add-hook 'js-mode-hook
          (lambda ()
            (set (make-local-variable 'company-backends)
                 '((company-yasnippet)))))

(custom-set-variables
 '(js-indent-level 4)
 '(js2-concat-multiline-strings nil)
 '(js2-highlight-level 3)
 '(js2-include-jslint-globals t)
 '(js2-include-node-externs t)
 '(js2-init-hook (quote (boomerang-mode auto-fill-mode)))
 '(js2-mode-assume-strict t)
 '(js2-skip-preprocessor-directives t)
 '(nodejs-repl-command "node"))
