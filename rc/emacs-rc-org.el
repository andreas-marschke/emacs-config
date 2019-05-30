;;; emacs-rc-org.el --- Org Mode configuration

;; Copyright (C) 2019 Andreas Marschke

;; Author: Andreas Marschke <emacs@andreas-marschke.name>
;; Created: 21.04.2019
;; Version: 0.1
;; Package-Requires: (())
;; Keywords: 
;; URL:
;;; Commentary:
;; 
;;
;;; Code:

(use-package org
  :functions org-mode
  :mode
  ("\\.org\\'" . org-mode)
  :custom
  (org-agenda-files nil)
  (org-highlight-latex-and-related '(latex script entities))
  (org-priority-faces nil)
  (org-agenda-files '("~/src/doc/todo.org"))
  (org-src-preserve-indentation t)
  (org-todo-keyword-faces
    '(("TODO" . "red")
      ("WORKING" . "yellow")
      ("CANCELED" . "blue")
      ("PENDING" . "orange")
      ("DONE" . "green"))))

(provide 'emacs-rc-org)
