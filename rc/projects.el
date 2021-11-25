;;; emacs-rc-projects.el --- Projects and Project Management

;; Copyright (C) 2017 Andreas Marschke

;; Author:  <emacs@andreas-marschke.name>
;; Created: 21.04.2019
;; Version: 0.2
;; Keywords: 
;; URL:
;;; Commentary:
;;
;;; Code:

;;;; Utility Functions used

(defun projectile-delight-modeline-string-eval-fn ()
  "Returns 'delight' string for the modeline."
  (if (projectile-project-p)
      (concat " P:{" (projectile-project-name) "}")
    ""))

;;;; Packages used.
(use-package projectile
  :ensure t
  :delight '(:eval (projectile-delight-modeline-string-eval-fn))
  :requires
  ggtags
  helm
  :load-path "~/src/elisp/projectile/"
  :functions projectile-register-project-type
  :bind-keymap
  ("C-c p" . projectile-command-map)
  :custom
  (projectile-globally-ignored-files
   '(".gradle"
     ".gitattributes"
     ".git*"
     "*~"
     "TAGS"
     "GPATH"
     "GRTAGS"
     "GTAGS"
     ".project"
     "package-lock.json"
     "cscope.files"
     "cscope.out"
     "todo.org"
     "notes.org"
     "*.class"
     "src.processed"))
  (projectile-globally-ignored-file-suffixes '("class" "bin" "jar"))
  (projectile-globally-ignored-directories
   '("*NIH-source"
     "*NIH"
     "*src.processed"
     ".idea"
     ".gradle"
     ".ensime_cache"
     ".eunit"
     ".git"
     ".cache"
     ".hg"
     ".fslckout"
     "_FOSSIL_"
     ".bzr"
     "_darcs"
     ".tox"
     ".svn"
     ".stack-work"
     "*build"
     "*node_modules"))
  (projectile-indexing-method 'hybrid)
  (projectile-completion-system 'helm)
  (projectile-enable-caching t)
  (projectile-keymap-prefix (kbd "C-c p"))
  :config
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  (projectile-mode)
  (projectile-global-mode)
  (helm-projectile-on)
  (projectile-register-project-type 'boomerang '("boomerang.js")
                                    :compile "grunt --no-color lint"
                                    :test "grunt --no-color lint"
                                    :run "grunt --no-color test:debug")

  (projectile-register-project-type 'boomerang-express '("package.json" "index.js" "Gruntfile.js" ".eslintrc" "tests" "TODO.org")
                                    :run "grunt run"
                                    :test "grunt test"
                                    :compile "grunt lint"))
(projectile-global-mode)

;; (defun soasta-mode ()
;;   "SOASTA style indentation and coding style."

;;   (setq indent-tabs-mode nil)
;;   (setq tab-width 2)
;;   (setq js2-basic-offset 2)
;;   (setq hs-minor-mode t)
;;   (setq auto-fill-mode nil)
;;   ;(setq c-basic-offset '(. 2))
  
;;   ;; (setq c-offsets-alist
;;   ;;       '(quote
;;   ;;         (inline-open           . +)
;;   ;;         (inline-close          . 0)
;;   ;;         (topmost-intro         . 0)
;;   ;;         (inclass               . +)
;;   ;;         (member-init-intro     . +)
;;   ;;         (substatement-open     . 0)
;;   ;;         (statement-block-intro . +)
;;   ;;         (func-decl-cont        . 0)
;;   ;;         (inline-open           . 0)
;;   ;;         (block-open            . +)
;;   ;;         (defun-block-intro     . +)
;;   ;;         (c-lineup-C-comments   . 1)
;;   ;;         ))
  
;;   (c-toggle-auto-hungry-state -1)
;;   )

;; (defun soasta-js-mode ()
;;   "SOASTA Javascript library configuration."
;;   (interactive)
;;   (defvar current-fill-column 240)
;;   (setq indent-tabs-mode nil)
;;   (setq tab-width 2)

;;   (setq js2-basic-offset 4)

;;   (setq hs-minor-mode t)

;;   (setq auto-fill-mode nil)

;;   ;; (setq c-basic-offset '(. 2))

;;   ;; (setq c-offsets-alist
;;   ;;   '(quote
;;   ;;     (member-init-intro     . +)
;;   ;;     (substatement-open     . +)
;;   ;;     (statement-block-intro . +)
;;   ;;     (func-decl-cont        . 0)
;;   ;;     (inline-open           . 0)
;;   ;;     (block-open            . +)
;;   ;;     ))
;;   (c-toggle-auto-hungry-state 2)
;;   )


;; (defun boomerang-mode ()
;;   "Boomerang.js indentation and coding style definition."
;;   (interactive)
;;   (setq current-fill-column 240)
;;   (setq indent-tabs-mode t)
;;   (setq tab-width 4)
;;   (defvar hs-minor-mode t)
;;   (defvar auto-fill-mode nil)
;;   (defvar js2-basic-offset 4)
;;   (defvar js2-bounce-indent-p t)
;;   (defvar c-basic-offset '(. 4))
;;   (defvar c-set-offset '(member-init-intro '++))
;;   (c-set-offset 'substatement-open 0)
;;   (c-set-offset 'block-open '0)
;;   (c-toggle-auto-hungry-state 0)
;;   )
