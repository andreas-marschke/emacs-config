(require 'keydef)

(defun other-window-back ()
  ( interactive )
  (other-window -1))


(global-unset-key (kbd "C-x i"))

(keydef "C-x t" (multi-term) )
(keydef "C-x M-[ a" (enlarge-window 5))
(keydef "C-x M-[ b" (enlarge-window -5))
(keydef "C-x M-[ c" (enlarge-window 5 t))
(keydef "C-x M-[ d" (enlarge-window -5 t))

(keydef "C-x <up>" (mocp-volume-up))
(keydef "C-x <down>" (mocp-volume-down))

(keydef "C-x o" 'other-window)
(keydef "C-x p" 'other-window-back)
(keydef "C-c C-x i" 'indent-region)
(keydef "C-x |" 'split-window-right)
