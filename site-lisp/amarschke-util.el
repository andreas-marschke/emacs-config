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

(defun other-window-back ()
  "Select other window in counter-cyclic ordering of windows."
  (interactive)
  (other-window -1))

;;; --- amarschke-util.el ends here
