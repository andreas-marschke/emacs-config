;;; emacs-rc-git.el ---

;; standard git module
(require 'git)

;; git-emacs
;; (require 'git-emacs)

;; magit
(require 'magit)
(global-set-key "\C-cm" 'magit-status)
(setq magit-save-some-buffers (quote dontask))

;; additional package
;(require 'egit)
;(require 'gitsum)

;;; emacs-rc-git.el ends here
