
(add-to-list 'js2-mode-hook 'projectile-mode)
(add-to-list 'java-mode-hook 'projectile-mode)
(add-to-list 'js-mode-hook 'projectile-mode)

(setq flx-ido-mode t)

(setq projectile-completion-system 'ido)

(defvar guessed-project nil)

(make-variable-buffer-local 'guessed-project)

(defun guess-project-from-file-name ()
  (save-match-data
    (setq guessed-project
	  '((cond
	   ((string-match "/boomerang/" buffer-file-name)
	    boomerang)
	   ((string-match "/mpulse-query.js/" buffer-file-name)
	    soasta)
	   ((string-match "/repository.js/" buffer-file-name)
	    soasta-js)
	   ((string-match "/boomerang-ludwig/" buffer-file-name)
	    soasta)
	   ))
    )))

(defun project-hook ()
  (guess-project-from-file-name)
  (message "")
  (case guessed-project
    ((soasta)
     (soasta-mode))
    ((boomerang)
     (boomerang-mode)
     )
    ((otherwise)
     (default-mode)
     )))

(add-hook 'js2-mode-hook 'project-hook)
(add-hook 'java-mode-hook 'project-hook)
(add-hook 'json-mode-hook 'project-hook)

;; (defun js2-init-hook-check-indent()
;;   "Depending on the file and path to the file change the style of indentation"
;;   (when (string-match ".*/boomerang/.*" (buffer-file-name (current-buffer)))
;;     (boomerang-mode))
;;   (when (string-match ".*/soasta/.*" (buffer-file-name (current-buffer)))
;;     (soasta-mode))
;;   (when (string-match ".*/js/.*" (buffer-filename (current-buffer)))
;;     (soasta-mode))
;;   )

;; (add-hook 'js2-init-hook 'js2-init-hook-check-indent)

(defun soasta-mode ()
  (interactive)
  (setq current-fill-column 240)
  (setq indent-tabs-mode nil)
  (setq tab-width 2)
  (setq js2-basic-offset 2)
  (setq hs-minor-mode t)
  (setq auto-fill-mode nil)
  (setq c-basic-offset '(. 2))
  (setq c-set-offset '(member-init-intro 2))
  (setq c-set-offset '(substatement-open 2))
  (setq c-set-offset '(statement-block-intro 2))
  (setq c-set-offset '(func-decl-cont 0))
  (setq c-set-offset '(topmost-intro 2))
  (setq c-set-offset '(inline-open 0))
  (c-set-offset 'block-open '2)
  (c-toggle-auto-hungry-state 2)
  )

(defun soasta-js-mode ()
  (interactive)
  (setq current-fill-column 240)
  (setq indent-tabs-mode nil)
  (setq tab-width 2)
  (setq js2-basic-offset 4)
  (setq hs-minor-mode t)
  (setq auto-fill-mode nil)
  (setq c-basic-offset '(. 2))
  (setq c-set-offset '(member-init-intro 2))
  (setq c-set-offset '(substatement-open 2))
  (setq c-set-offset '(statement-block-intro 2))
  (setq c-set-offset '(func-decl-cont 0))
  (setq c-set-offset '(topmost-intro 2))
  (setq c-set-offset '(inline-open 0))
  (c-set-offset 'block-open '2)
  (c-toggle-auto-hungry-state 2)
  )


(defun boomerang-mode ()
  (interactive)
  (setq current-fill-column 240)
  (setq indent-tabs-mode t)
  (setq tab-width 4)
  (setq hs-minor-mode t)
  (setq auto-fill-mode nil)
  (setq js2-basic-offset 4)
  (setq js2-bounce-indent-p t)
  (setq c-basic-offset '(. 4))
  (setq c-set-offset '(member-init-intro '++))
  (c-set-offset 'substatement-open 0)
  (c-set-offset 'block-open '0)
  (c-toggle-auto-hungry-state 0)
  )

(defun default-mode
  (setq indent-tabs-mode nil)
  (setq current-fill-column 240)
  (setq tab-width 2)
  (setq hs-minor-mode t)
  (setq auto-fill-mode nil)
  (c-basic-offset . 2)
  (c-set-offset 'member-init-intro '++)
  (c-set-offset 'substatement-open 0)
  (c-set-offset 'block-open '0)
  (c-toggle-auto-hungry-state 0))

