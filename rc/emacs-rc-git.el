;; standard git module
(require 'git)

;; magit
(require 'magit)
(global-set-key "\C-cm" 'magit-status)
(setq magit-save-some-buffers (quote dontask))
(setq magit-auto-revert-mode nil)
(setq magit-auto-revert-mode t)
