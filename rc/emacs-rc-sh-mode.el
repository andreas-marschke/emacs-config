;;; emacs-rc-sh-mode.el ---

;; Copyright (C) Alex Ott
;;
;; Author: Alex Ott <alexott@gmail.com>
;; Keywords:
;; Requirements:
;; Status: not intended to be distributed yet

;;

(defun xxtjaxx/sh-check-finish-hook (buf msg)
  "Function, that is executed at the end of sh check"
  (when (not (string-match "finished" msg))
    (next-error 1 t)))

(define-compilation-mode sh-check-mode "SH"
  "Mode for check sh source code."
  (set (make-local-variable 'compilation-disable-input) t)
  (set (make-local-variable 'compilation-scroll-output) nil)
  (set (make-local-variable 'compilation-finish-functions)
       (list 'xxtjaxx/sh-check-finish-hook))
  )

(defun xxtjaxx/sh-check-syntax ()
  "Check syntax of current file"
  (interactive)
  (when (string-match "^\\(ba\\|z\\)sh" (symbol-name sh-shell))
    (save-some-buffers t)
    (compilation-start (concat (symbol-name sh-shell) " -n " (buffer-file-name))
                       'sh-check-mode))
  )

;; sh mode hook
(defun xxtjaxx/sh-mode-hook ()
  (local-set-key "\C-cl" 'xxtjaxx/sh-check-syntax)
  (local-set-key [return] 'newline-and-indent)
  )
(add-hook 'sh-mode-hook 'xxtjaxx/sh-mode-hook)
(add-hook 'sh-mode-hook 'xxtjaxx/common-hook)
(add-hook 'sh-mode-hook 'xxtjaxx/show-prog-keywords)

(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;;; emacs-rc-sh-mode.el ends here


