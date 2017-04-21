(add-to-list 'js2-mode-hook 'projectile-mode)
(add-to-list 'java-mode-hook 'projectile-mode)
(add-to-list 'js-mode-hook 'projectile-mode)

(setq flx-ido-mode t)

(setq projectile-completion-system 'ido)

(defun soasta-mode ()
  (interactive)
  (setq current-fill-column 240)
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
  (interactive)
  (setq current-fill-column 240)
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


