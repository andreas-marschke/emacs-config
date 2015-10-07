(setq auto-compression-mode t)
(setq text-mode-hook (quote (turn-off-auto-fill text-mode-hook-identify)))
(setq user-full-name "Andreas Marschke")

(setq delete-selection-mode t)
(setq fill-column 200)
(setq kill-whole-line t)
(setq tab-always-indent t)
(setq indent-tabs-mode nil)
(setq tab-width 8)
(setq next-line-add-newlines t)
(setq font-lock-comment-face 'font-lock-comment-delimiter-face)

;; unmark some function
(put 'upcase-region 'disabled nil)

;set safe-local varaibles
(setq safe-local-variable-values (quote (
				      (c-file-offsets (substatement-open . 0))
				      (prompt-to-byte-compile)
				      (c-indentation-style . k&r)
				      (indent-tabs-mode . 1)
				      (folded-file . t)
				      (TeX-open-quote . "<<")
				      (TeX-close-quote . ">>")
				      )))

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
