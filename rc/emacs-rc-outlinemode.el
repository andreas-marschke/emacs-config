;;; emacs-rc-outlinemode.el --- sets a list of modes and a hook to each mode to load outline-minor-mode

;; Copyright (C) 2011 Andreas Marschke
;;
;; Author: xxtjaxx@gmail.com
;; Keywords: outline-minor-mode
;; Requirements:
;; Status: not intended to be distributed yet

(defvar outline-hook-alist
  '(c++-mode-hook
    c-mode-hook
    cperl-mode-hook
    emacs-lisp-mode-hook
    lisp-mode-hook
    perl-mode-hook
    sh-mode-hook
    perl-mode-hook
    cperl-mode-hook )
  "alist of hooks to add outline-minor-mode to."
)

(defun xxtjaxx/outline-add-hooks ()
  (dolist (hook outline-hook-alist)
    (add-hook hook 'outline-minor-mode))
  )

(xxtjaxx/outline-add-hooks)
