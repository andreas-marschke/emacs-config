;;; emacs-rc-elisp.el --- Settings for Emacs Lisp editing

;; Copyright (C) 2004 Alex Ott
;; Copyright (C) 2010 Andreas Marschke
;; Copyright (C) 2011 Andreas Marschke
;;
;; Author: alexott@gmail.com
;; Author: xxtjaxx@gmail.com
;; Keywords:
;; Requirements:
;; Status: not intended to be distributed yet

(defun xxtjaxx/elisp-mode-hook ()
  (setq indent-tabs-mode t)
  (abbrev-mode 1)
  (auto-fill-mode 0)
  (turn-on-eldoc-mode)
  ;; (paredit-mode 0)
  ;; (local-set-key [return] 'newline-and-indent)
  ;; (local-set-key "\C-cf" 'find-function)
  ;; (local-set-key "\C-c4f" 'find-function-other-window)
  ;; (local-set-key "\C-c5f" 'find-function-other-frame)
  ;; (local-set-key "\C-ck" 'find-function-on-key)
  (local-set-key [(control c) /] 'semantic-ia-complete-symbol)
  )
(add-hook 'emacs-lisp-mode-hook 'xxtjaxx/elisp-mode-hook)
(add-hook 'emacs-lisp-mode-hook 'xxtjaxx/common-hook)
(add-hook 'emacs-lisp-mode-hook 'xxtjaxx/show-prog-keywords)

;;
(add-to-list 'auto-mode-alist '("\\.el" . emacs-lisp-mode))
(add-to-list 'auto-mode-alist '("\\.gnus$" . emacs-lisp-mode))
(add-to-list 'auto-mode-alist '("\\.emacs$" . emacs-lisp-mode))


;;; emacs-rc-elisp.el ends here
