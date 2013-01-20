;;; emacs-rc-misc-things.el ---

;; Copyright (C) 2003 Alex Ott
;;
;; Author: alexott@gmail.com
;; Keywords:
;; Requirements:
;; Status: not intended to be distributed yet

;; misc variables
(setq auto-compression-mode t)
(setq text-mode-hook (quote (turn-on-auto-fill text-mode-hook-identify)))
(setq user-full-name "Andreas Marschke")

(setq delete-selection-mode t)
(setq fill-column 90)
(setq kill-whole-line t)
(setq tab-always-indent t)
(setq indent-tabs-mode nil)
(setq tab-width 8)
(setq next-line-add-newlines t)
(setq font-lock-comment-face 'font-lock-comment-delimiter-face)

;; unmark some function
(put 'upcase-region 'disabled nil)

;; set safe-local varaibles
(setq safe-local-variable-values (quote (
				      (c-file-offsets (substatement-open . 0))
				      (prompt-to-byte-compile)
				      (c-indentation-style . k&r)
				      (indent-tabs-mode . 1)
				      (folded-file . t)
				      (TeX-open-quote . "<<")
				      (TeX-close-quote . ">>")
				      )))

;;
(defun toggle-menu ()
  (dolist (m '(menu-bar-mode tool-bar-mode scroll-bar-mode blink-cursor-mode))
    (if (boundp m)
	(funcall m -1)
      (funcall m 1)))
  )
;; Make EMACS fullscreen :D
(defun toggle-fullscreen (&optional f)
  (interactive)
  (let ((current-value (frame-parameter nil 'fullscreen)))
    (set-frame-parameter nil 'fullscreen
			 (if (equal 'fullboth current-value)
			     (if (boundp 'old-fullscreen)
				 old-fullscreen nil)
			   (progn (setq old-fullscreen current-value)
				  'fullboth)))))
;;; emacs-rc-misc-things.el ends here





