;;; emacs-rc-projectile.el --- Projectile configuration

;; Copyright (C) 0000 Free Software Foundation, Inc.

;; Author:  <@>
;; Created: 14 Jul 2010
;; Version: 0.0
;; Package-Requires: (())
;; Keywords: projectile
;; URL:
;;; Commentary:
;; 
;;
;;; Code:

;;(add-to-list 'js2-mode-hook 'projectile-mode)
;;(add-to-list 'java-mode-hook 'projectile-mode)
;;(add-to-list 'js-mode-hook 'projectile-mode)

(defvar flx-ido-mode t)
(defvar projectile-completion-system 'ido)

(projectile-global-mode)

(defun soasta-mode ()
  "SOASTA style indentation and coding style."
  
  (interactive)
  (defvar current-fill-column 240)
  (setq indent-tabs-mode nil)
  (setq tab-width 2)
  (setq js2-basic-offset 2)

  (setq hs-minor-mode t)
  (setq auto-fill-mode nil)
  (setq c-basic-offset '(. 2))

  (setq c-offsets-alist
	'(quote
	  (inline-open           . +)
	  (inline-close          . 0)
	  (member-init-intro     . +)
	  (substatement-open     . +)
	  (statement-block-intro . +)
	  (func-decl-cont        . 0)
	  (topmost-intro         . +)
	  (inline-open           . 0)
	  (block-open            . +)
	  (defun-block-intro     . +)
	  ))
  
  (c-toggle-auto-hungry-state 2)
  )

(defun soasta-js-mode ()
  "SOASTA Javascript library configuration."
  (interactive)
  (defvar current-fill-column 240)
  (setq indent-tabs-mode nil)
  (setq tab-width 2)

  (setq js2-basic-offset 4)

  (setq hs-minor-mode t)

  (setq auto-fill-mode nil)

  (setq c-basic-offset '(. 2))

  (setq c-offsets-alist
    '(quote
      (member-init-intro     . +)
      (substatement-open     . +)
      (statement-block-intro . +)
      (func-decl-cont        . 0)
      (topmost-intro         . +)
      (inline-open           . 0)
      (block-open            . +)
      ))
  (c-toggle-auto-hungry-state 2)
  )


(defun boomerang-mode ()
  "Boomerang.js indentation and coding style definition."
  (interactive)
  (defvar current-fill-column 240)
  (setq indent-tabs-mode t)
  (setq tab-width 4)
  (defvar hs-minor-mode t)
  (defvar auto-fill-mode nil)
  (defvar js2-basic-offset 4)
  (defvar js2-bounce-indent-p t)
  (defvar c-basic-offset '(. 4))
  (defvar c-set-offset '(member-init-intro '++))
  (c-set-offset 'substatement-open 0)
  (c-set-offset 'block-open '0)
  (c-toggle-auto-hungry-state 0)
  )

(projectile-register-project-type 'boomerang '("boomerang.js")
				  :compile "grunt --no-color lint"
				  :test "grunt --no-color lint"
				  :run "grunt --no-color test:debug"
				  :test-suffix ".js")

(projectile-register-project-type 'boomerang-android '("mpulse-android")
				  :compile "gradle clean build -Pbuildnumber=1-x"
				  :test "gradle clean build test -Pbuildnumber=1-x"
				  :run "gradle clean build test -Pbuildnumber=1-x"
				  :test-suffix ".java")

(projectile-register-project-type 'mpulse-java '("test-app")
				  :compile "gradle clean build -Pbuildnumber=1-x"
				  :test "gradle clean build test -Pbuildnumber=1-x"
				  :run "gradle clean build test -Pbuildnumber=1-x"
				  :test-suffix ".java")

(defun flycheck-checker-javascript-eslint-find-binary-hook ()
  "Simple method for setting correct eslint version."
  (if (projectile-project-p)
      (message "Projectile switched to project checking for correct place of linter...")
    (when (eq 'boomerang (projectile-project-type))
      (message (concat "Found Boomerang project setting eslint executable to: " (concat (projectile-project-root) "node_modules/.bin/eslint")))
      (defvar flycheck-javascript-eslint-executable (concat (projectile-project-root) "node_modules/.bin/eslint"))
      (boomerang-mode)
      )
    )
  )

(defun cc-mode-indentation-mode-hook()
  (if (projectile-project-p)
      (when (eq 'boomerang (projectile-project-type))
	(when (string-suffix-p ".js" (buffer-file-name (current-buffer)))
	  (or (string-suffix-p ".html" (buffer-file-name (current-buffer)))
	      (boomerang-mode))
	  (or (string-suffix-p ".jsx" (buffer-file-name (current-buffer)))
	      (boomerang-mode))
	  (boomerang-mode))))
  )


(add-hook 'projectile-after-switch-project-hook 'flycheck-checker-javascript-eslint-find-binary-hook)
(add-hook 'projectile-find-file-hook 'flycheck-checker-javascript-eslint-find-binary-hook)
(add-hook 'projectile-find-dir-hook 'flycheck-checker-javascript-eslint-find-binary-hook)
(add-hook 'find-file-hook 'flycheck-checker-javascript-eslint-find-binary-hook)

(add-hook 'projectile-find-file-hook 'cc-mode-indentation-mode-hook)
(add-hook 'projectile-find-dir-hook 'cc-mode-indentation-mode-hook)
(add-hook 'find-file-hook 'cc-mode-indentation-mode-hook)

;;(provide emacs-rc-projectile)

;;; emacs-rc-projectile.el ends here
