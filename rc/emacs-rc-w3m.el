;;; emacs-rc-w3m.el ---

;; Copyright (C) 2003 Alex Ott
;;
;; Author: alexott@gmail.com
;; Keywords:
;; Requirements:
;; Status: not intended to be distributed yet

(autoload 'w3m "w3m" "Interface for w3m on Emacs." t)
(setq w3m-coding-system 'utf-8
                        w3m-file-coding-system 'utf-8
                        w3m-file-name-coding-system 'utf-8
                        w3m-input-coding-system 'utf-8
                        w3m-output-coding-system 'utf-8
                        w3m-terminal-coding-system 'utf-8
                        w3m-use-cookies t
                        )

(add-hook 'w3m-display-hook
          (lambda (url)
            (rename-buffer
             (format "*w3m: %s*" (or w3m-current-title
                                     w3m-current-url)) t)))
(setq w3m-key-binding (quote info))
(setq w3m-wget-substitute-download-command t)
(setq browse-url-browser-function 'w3m-browse-url)

;;; emacs-rc-w3m.el ends here
