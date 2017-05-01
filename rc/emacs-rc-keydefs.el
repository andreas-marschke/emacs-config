(require 'keydef)

(defun other-window-back ()
  ( interactive )
  (other-window -1))

(global-unset-key (kbd "C-x i"))

(keydef "C-x t" (multi-term) )
(keydef "C-c <up>" (enlarge-window 5))
(keydef "C-c <down>" (enlarge-window -5))
(keydef "C-c <left>" (enlarge-window 5 t))
(keydef "C-c <right>" (enlarge-window -5 t))

(keydef "C-x o" 'other-window)
(keydef "C-x p" 'other-window-back)
(keydef "C-c C-x i" 'indent-region)
(global-set-key (kbd "C-x C-k C-k") 'gnus-kill-file-kill-by-author)

(global-set-key (kbd "C-h j") 'javadoc-lookup)

(keydef "C-c C-c C-," 'outline-show-all)
