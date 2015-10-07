(defun xxtjaxx/sh-check-finish-hook (buf msg)
  "Function, that is executed at the end of sh check"
  (when (not (string-match "finished" msg))
    (next-error 1 t)))

(defun xxtjaxx/sh-check-syntax ()
  "Check syntax of current file"
  (interactive)
  (when (string-match "^\\(ba\\|z\\)sh" (symbol-name sh-shell))
    (save-some-buffers t)
    (compilation-start (concat (symbol-name sh-shell) " -n " (buffer-file-name))
                       'sh-check-mode))
)

(defun xxtjaxx/sh-mode-hook ()
  (local-set-key "\C-cl" 'xxtjaxx/sh-check-syntax)
  (local-set-key [return] 'newline-and-indent)
  )
(add-hook 'sh-mode-hook 'xxtjaxx/sh-mode-hook)

(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
