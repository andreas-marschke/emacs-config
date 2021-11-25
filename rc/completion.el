;;; emacs-rc-completion.el --- Completion configuration

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

(use-package company-flow
  :ensure t)

(use-package company
  :ensure t
  :diminish
  :bind ("C-c l" . helm-company)
  :config
  (global-company-mode t)
  :custom-face
  (company-preview ((t (:background "RoyalBlue4" :foreground "gray97"))))
  (company-preview-search ((t (:inherit company-preview :foreground "light green"))))
  (company-template-field ((t (:background "cyan4" :foreground "yellow3"))))
  (company-tooltip ((t (:background "grey20" :foreground "white"))))
  :custom
  (global-company-mode t)
  (company-abort-manual-when-too-short t)
  (company-auto-complete nil)
  (company-auto-commit nil)
  ;;(company-auto-complete-chars '(32 95 40 41 119 46 34 36 39 124))
  (company-show-numbers nil)
  (company-tooltip-flip-when-above t)
  (company-tooltip-idle-delay 3)
  (company-tooltip-margin 2)
  (company-tooltip-offset-display 'lines)
  (company-transformers '(company-sort-by-backend-importance))
  (company-xcode-types
   '("Category"
     "Class"
     "Class Method"
     "Class Variable"
     "Constant"
     "Enum"
     "Field"
     "Instance Method"
     "Instance Variable"
     "Macro"
     "Modeled Class"
     "Modeled Method"
     "Modeled Property"
     "Property"
     "Protocol"
     "Structure"
     "Type"
     "Union"
     "Variable"
     "Function"))
  :hook
  ((c-mode  . (lambda()
                (set (make-local-variable 'company-backends)
                      '((company-files
                         company-etags
                         company-gtags
                         company-dict
                         company-yasnippet)))
                ))
   (js2-mode . (lambda ()
                 (set (make-local-variable 'company-backends)
                      '((company-files
                         company-etags
                         company-gtags
                         company-dict
                         company-yasnippet)))))
   (web-mode . (lambda ()
                 (set (make-local-variable 'company-backends)
                      '((company-files
                         company-css
                         company-etags
                         company-dict
                         company-nxml
                         company-yasnippet)))))
   (java-mode . (lambda ()
                 (set (make-local-variable 'company-backends)
                      '((company-files
                         company-yasnippet)))))
   (org-mode . (lambda ()
                 (set (make-local-variable 'company-backends)
                      '((company-files
                         company-keywords
                         company-oddmuse
                         company-yasnippet
                         company-dabbrev)))))))

(use-package company-quickhelp
  :ensure t
  :after company
  :hook
  (after-init-hook . company-quickhelp-mode))

(use-package company-statistics
  :ensure t
  :functions company-statistics--init
  :hook
  (after-init . company-statistics-mode)
  :after (company))

(provide 'emacs-rc-completion)
