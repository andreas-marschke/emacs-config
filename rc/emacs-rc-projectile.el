;;; emacs-rc-projectile.el --- Projectile configuration

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
  ;;(setq c-basic-offset '(. 2))
  
  ;; (setq c-offsets-alist
  ;;       '(quote
  ;;         (inline-open           . +)
  ;;         (inline-close          . 0)
  ;;         (topmost-intro         . 0)
  ;;         (inclass               . +)
  ;;         (member-init-intro     . +)
  ;;         (substatement-open     . 0)
  ;;         (statement-block-intro . +)
  ;;         (func-decl-cont        . 0)
  ;;         (inline-open           . 0)
  ;;         (block-open            . +)
  ;;         (defun-block-intro     . +)
  ;;         (c-lineup-C-comments   . 1)
  ;;         ))
  
  (c-toggle-auto-hungry-state -1)
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

  ;; (setq c-basic-offset '(. 2))

  ;; (setq c-offsets-alist
  ;;   '(quote
  ;;     (member-init-intro     . +)
  ;;     (substatement-open     . +)
  ;;     (statement-block-intro . +)
  ;;     (func-decl-cont        . 0)
  ;;     (inline-open           . 0)
  ;;     (block-open            . +)
  ;;     ))
  (c-toggle-auto-hungry-state 2)
  )


(defun boomerang-mode ()
  "Boomerang.js indentation and coding style definition."
  (interactive)
  (setq current-fill-column 240)
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
				  :run "grunt --no-color test:debug")

;; (projectile-register-project-type 'jdee-maven '("pom.xml" "prj.el")
;;                                   :compile 'jdee-build
;;                                   :test 'jdee-build
;;                                   :test 'jdee-build)

(projectile-register-project-type 'boomerang-android '("mpulse-android" "aspectj-xlint.properties" "build.gradle" "build.xml" "mpulse-android-gradle-plugin")
                                  :compile "./gradlew clean updateTestBNADependencies build install -Pbuildnumber=1-x -x mpulse-java:test && ./gradlew -b test-bna/build.gradle clean build :Application:connectedAndroidTest"
                                  :test "./gradlew clean updateTestBNADependencies build install -Pbuildnumber=1-x -x mpulse-java:test && ./gradlew -b test-bna/build.gradle clean build :Application:connectedAndroidTest"
                                  :run "./gradlew clean updateTestBNADependencies build install -Pbuildnumber=1-x -x mpulse-java:test && ./gradlew -b test-bna/build.gradle clean build :Application:connectedAndroidTest")

(defun flycheck-checker-javascript-eslint-find-binary-hook ()
  "Simple method for setting correct eslint version."
  (if (ignore-errors (projectile-project-p))
      (when (eq 'boomerang (projectile-project-type))
	;;(message (concat "Found Boomerang project setting eslint executable to: " (concat (projectile-project-root) "node_modules/.bin/eslint")))
	(flycheck-set-checker-executable (concat (projectile-project-root) "node_modules/.bin/eslint"))))
  )

(defun cc-mode-indentation-mode-hook()
  (if (ignore-errors (projectile-project-p))
      (cond ((eq 'boomerang (ignore-errors (projectile-project-type)))
	     (boomerang-mode))
	    ((eq 'soasta (ignore-errors (projectile-project-type)))
	     (soasta-mode))
	    ((eq 'mpulse-java (ignore-errors (projectile-project-type)))
	     (soasta-mode))
	    ((eq 'boomerang-android (ignore-errors (projectile-project-type)))
	     (soasta-mode))
	    ))
  )

;;(add-hook 'projectile-after-switch-project-hook 'flycheck-checker-javascript-eslint-find-binary-hook)
;;(add-hook 'projectile-find-file-hook 'flycheck-checker-javascript-eslint-find-binary-hook)
;;(add-hook 'projectile-find-dir-hook 'flycheck-checker-javascript-eslint-find-binary-hook)
;;(add-hook 'find-file-hook 'flycheck-checker-javascript-eslint-find-binary-hook)

(add-hook 'web-mode-hook 'cc-mode-indentation-mode-hook)
(add-hook 'js2-mode-hook 'cc-mode-indentation-mode-hook)
;;(add-hook 'java-mode-hook 'cc-mode-indentation-mode-hook)
;;(add-hook 'jdee-mode-hook 'cc-mode-indentation-mode-hook)

;;; Projectile keybindings for NeoTree
(defun neotree-project-dir ()
  "Open NeoTree using the git root."
  (interactive)
  (let ((project-dir (projectile-project-root))
	(file-name (buffer-file-name)))
    (neotree-toggle)
    (if project-dir
	(if (neo-global--window-exists-p)
	    (progn
	      (neotree-dir project-dir)
	      (neotree-find file-name)))
      (message "Could not find git project root."))))
(global-set-key [f8] 'neotree-project-dir)

;;; emacs-rc-projectile.el ends here
