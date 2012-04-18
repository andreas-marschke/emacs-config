(defun alexott/lisp-mode-hook ()
  ;;(setq tab-width 4)
  (setq indent-tabs-mode t)
  (abbrev-mode 1)
  (auto-fill-mode 1)
  (turn-on-eldoc-mode)
  ;;(paredit-mode 1)
  (local-set-key [return] 'newline-and-indent)
  ;; (set (make-local-variable 'slime-lisp-implementations)
  ;;      (list (assoc 'sbcl slime-lisp-implementations)))
  )
(add-hook 'lisp-mode-hook 'alexott/lisp-mode-hook)
(add-hook 'lisp-mode-hook 'xxtjaxx/common-hook)


(defun alexott/lisp-interact-mode-hook ()
  (paredit-mode 1)
  )
(add-hook 'lisp-interaction-mode-hook 'alexott/lisp-interact-mode-hook)

;; lookup information in hyperspec
(require 'info-look)
(info-lookup-add-help
 :mode 'lisp-mode
 :regexp "[^][()'\" \t\n]+"
 :ignore-case t
 :doc-spec '(("(ansicl)Symbol Index" nil nil nil)))

(defun xxtjaxx/elisp-mode-hook ()
  (setq indent-tabs-mode t)
  (abbrev-mode 1)
  (auto-fill-mode 0)
  (turn-on-eldoc-mode)
  ;; (paredit-mode 0)
  ;; (local-set-key [return] 'newline-and-indent)
  ;; (local-set-key "\C-cf" 'find-function)
  ;; (local-set-key "\C-c4f" 'find-function-other-window)
  ;; (local-set-key "\C-c5f" 'find-function-other-frame)
  ;; (local-set-key "\C-ck" 'find-function-on-key)
  (local-set-key [(control c) /] 'semantic-ia-complete-symbol)
  )
(add-hook 'emacs-lisp-mode-hook 'xxtjaxx/elisp-mode-hook)
(add-hook 'emacs-lisp-mode-hook 'xxtjaxx/common-hook)
(add-hook 'emacs-lisp-mode-hook 'xxtjaxx/show-prog-keywords)

;;
(add-to-list 'auto-mode-alist '("\\.el" . emacs-lisp-mode))
(add-to-list 'auto-mode-alist '("\\.gnus$" . emacs-lisp-mode))
(add-to-list 'auto-mode-alist '("\\.emacs$" . emacs-lisp-mode))
