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

;; https://github.com/jwiegley/use-package/issues/319 :rolling_eyes:
(assq-delete-all 'org package--builtins)
(assq-delete-all 'org package--builtin-versions)

(use-package org
  :ensure org-plus-contrib
  :pin org
  :preface
  (assq-delete-all 'org package--builtins)
  (assq-delete-all 'org package--builtin-versions)
  :defines (org-mode org)
  :bind
  (("<f10>" . org-capture)
   ("<f9>" . org-agenda))
  :demand t
  :hook
  ((org-mode . yas-minor-mode))
  :mode
  ("\\.org\\'" . org-mode)
  :custom
  (org-directory "~/src/doc")
  (org-agenda-files
   '("~/src/doc"
     "~/src/doc/documentation"
     "~/src/doc/proposals"
     "~/src/doc/questions"
     "~/src/doc/testplans"
     "~/src/doc/notes"))
  (org-highlight-latex-and-related '(latex script entities))
  (org-priority-faces nil)
  (org-src-preserve-indentation t)
  (org-adapt-indentation nil)
  (org-html-postamble-format nil)
  (org-html-postamble nil)
  (org-capture-templates
   '(("t" "Todo" entry (file+datetree "~/src/doc/todo.org")
      "* TODO %?\nDEADLINE: %^{Deadline:}t\n  %i")
     ("w" "Weekly Reports" entry (file+datetree "~/src/doc/journal.org")
      "* %?\n  %a")
     ("dt" "Developer TODO" entry (file ,(concat (projectile-project-root) "todo.org")))))
  (org-todo-keywords
   '((sequence "TODO" "WORKING" "PENDING" "CANCELED" "DONE")
     (sequence "LOW" "MID" "HIGH")
     (sequence "EASY" "MID" "HARD")))
  (org-todo-keyword-faces
    '(("TODO" . "red")
      ("WORKING" . "yellow")
      ("CANCELED" . "blue")
      ("PENDING" . "orange")
      ("DONE" . "green"))))

(use-package org-recur
  :ensure t
  :hook ((org-mode . org-recur-mode)
         (org-agenda-mode . org-recur-agenda-mode))
  :custom
  ((org-recur-finish-done t)
   (org-recur-finish-archive t)
   ;; Log time a task was set to Done.
   (org-log-done (quote time))
   
   ;; Don't log the time a task was rescheduled or redeadlined.
   (org-log-redeadline nil)
   (org-log-reschedule nil))
  :config
  (define-key org-recur-mode-map (kbd "C-c d") 'org-recur-finish)

  ;; Rebind the 'd' key in org-agenda (default: `org-agenda-day-view').
  (define-key org-recur-agenda-mode-map (kbd "d") 'org-recur-finish)
  (define-key org-recur-agenda-mode-map (kbd "C-c d") 'org-recur-finish))

;; Refresh org-agenda after rescheduling a task.
(defun org-agenda-refresh ()
  "Refresh all `org-agenda' buffers."
  (dolist (buffer (buffer-list))
    (with-current-buffer buffer
      (when (derived-mode-p 'org-agenda-mode)
        (org-agenda-maybe-redo)))))

(defadvice org-schedule (after refresh-agenda activate)
  "Refresh org-agenda."
  (org-agenda-refresh))


(use-package ox-jira
  :ensure t)

(use-package ox-slack
  :ensure t)

(use-package ox-json
  :ensure t)

(use-package org-projectile
  :ensure t
  :after projectile)

(use-package ob-mermaid
  :ensure t)

