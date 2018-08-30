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

(defun other-window-back (&optional args)
  "Select other window in counter-cyclic ordering of windows."
  (interactive "k")
  (other-window -1))

(defun compilation-regexps (project-type)
  "Add regexps to the list based on project-type")


(provide 'amarschke-util)
;;; --- amarschke-util.el ends here
