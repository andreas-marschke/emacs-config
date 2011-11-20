;;; emacs-rc-desktop.el --- Load desktop settings

;; Copyright (C) 2003 Alex Ott
;;
;; Author: alexott@gmail.com
;; Keywords:
;; Requirements:
;; Status: not intended to be distributed yet

(setq-default desktop-missing-file-warning nil)
(setq-default desktop-path (quote ("~/Desktop")))
(setq-default desktop-save t)
(setq-default desktop-save-mode t)
(setq-default save-place t)

(add-to-list 'desktop-locals-to-save 'buffer-file-coding-system)
(add-to-list 'desktop-locals-to-save 'tab-width)

(defun xxtjaxx/desktop-ignore-semantic (desktop-buffer-file-name)
       "Function to ignore cedet minor modes during restore of buffers"
       nil)
(add-to-list 'desktop-minor-mode-handlers '(semantic-stickyfunc-mode . xxtjaxx/desktop-ignore-semantic))
(add-to-list 'desktop-minor-mode-handlers '(senator-minor-mode . xxtjaxx/desktop-ignore-semantic))
(add-to-list 'desktop-minor-mode-handlers '(semantic-idle-scheduler-mode . xxtjaxx/desktop-ignore-semantic))
(add-to-list 'desktop-minor-mode-handlers '(semantic-idle-summary-mode . xxtjaxx/desktop-ignore-semantic))
(add-to-list 'desktop-minor-mode-handlers '(semantic-idle-completions-mode . xxtjaxx/desktop-ignore-semantic))
(add-to-list 'desktop-minor-mode-handlers '(semantic-mru-bookmark-mode . xxtjaxx/desktop-ignore-semantic))
(add-to-list 'desktop-minor-mode-handlers '(semantic-decoration-mode . xxtjaxx/desktop-ignore-semantic))
(add-to-list 'desktop-minor-mode-handlers '(srecode-minor-mode . xxtjaxx/desktop-ignore-semantic))
(add-to-list 'desktop-minor-mode-handlers '(ede-minor-mode . xxtjaxx/desktop-ignore-semantic))

;;(desktop-read)

;;; emacs-rc-desktop.el ends here
