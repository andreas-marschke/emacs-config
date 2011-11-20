;;; emacs-rc-vcs-misc.el ---

;; Copyright (C) Alex Ott
;;
;; Author: Alex Ott <alexott@gmail.com>
;; Keywords:
;; Requirements:
;; Status: not intended to be distributed yet

;; PSVN customization

(setq svn-status-svn-environment-var-list (quote ( "LANG=de_DE.UTF-8")))
(autoload 'svn-status "psvn" nil t)

;;; emacs-rc-vcs-misc.el ends here
