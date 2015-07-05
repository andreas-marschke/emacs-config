;;(require 'nodejs-repl)
(require 'js2-mode)
(require 'json-mode)

(autoload 'js2-mode "js2-mode" nil t)

;; run grunt from emacs
(setq grunt-cmd "grunt --no-colors")

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

(eval-after-load 'js2-mode
  '(progn (define-key js2-mode-map (kbd "TAB")
	    (lambda()
	      (interactive)
	      (let ((yas/fallback-behavior 'return-nil))
		(unless (yas/expand)
		  (indent-for-tab-command)
		  (if (looking-back "^\s*")
		      (back-to-indentation))))))))


(add-to-list 'compilation-error-regexp-alist '("^\\(.*\\): line \\([0-9]*\\), col \\([0-9]*\\), \\(Error\\|Warning\\) - \\(.*\\)$" 1 2 3))
(add-to-list 'compilation-error-regexp-alist '("^\s*at\s\\(.*\\) (\\([0-9]*\\):\\([0-9]*\\)) $" 1 2 3))
(add-to-list 'compilation-error-regexp-alist '("^\s*at\s\\([0-9]*\\):\\([0-9]*\\) $" 1 2 3))
(add-to-list 'compilation-error-regexp-alist '("^(\w+)$\n^\s*\\([0-9]*\\):\\([0-9]*\\)\s*error\s*\\(.*\\)" 1 2 3))
