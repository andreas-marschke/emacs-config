(setq grunt-cmd "grunt")

(defun grunt ()
  "Run grunt"
  (interactive)
  (let* ((grunt-buffer (get-buffer-create "*grunt*"))
        (result (call-process-shell-command grunt-cmd nil grunt-buffer t))
        (output (with-current-buffer grunt-buffer (buffer-string))))
    (cond ((zerop result)
           (message "Grunt completed without errors"))
          (t
           (message nil)
           (split-window-vertically)
           (set-window-buffer (next-window) grunt-buffer)))))


(add-to-list 'compilation-error-regexp-alist '("^\\(.*\\): line \\([0-9]*\\), col \\([0-9]*\\), Error - \\(.*\\)$" 1 2 3))
