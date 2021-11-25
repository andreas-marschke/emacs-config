;;; amarschke-util.el --- My personal utilities

;; Copyright (C) 2018 Andreas Marschke

;; Author: Andreas Marschke <emacs@andreas-marschke.name>
;; Created: 24.07.2018
;; Version: 0.1
;; Package-Requires: ((emacs "24"))
;; Keywords: utils
;; URL:
;;; Commentary:
;;
;;
;;; Code:

(defun menu-hide()
  "Called from init.el to hide menu when in termninal"
  (interactive)
  (dolist (m '(menu-bar-mode scroll-bar-mode blink-cursor-mode tool-bar-mode))
    (if (boundp m)
        (funcall m -1))))

(defun other-window-back (&optional args)
  "Select other window in counter-cyclic ordering of windows."
  (interactive "k")
  (other-window -1))

(provide 'amarschke-util)
;;; --- amarschke-util.el ends here

