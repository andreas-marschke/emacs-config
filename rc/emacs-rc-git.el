;;; emacs-rc-git.el ---

;; standard git module
(require 'git)

;; git-emacs
;; (require 'git-emacs)

;; magit
(require 'magit)
(global-set-key "\C-cm" 'magit-status)
(setq magit-save-some-buffers (quote dontask))
(setq magit-auto-revert-mode nil)

;;; emacs-rc-git.el ends here
