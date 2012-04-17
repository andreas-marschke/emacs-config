;;; emacs-rc-common-hooks.el ---

(defface font-lock-post-face
  '(( ((class color) (min-colors 8))
          (:foreground "yellow" :weight bold)
         ))
  "Documentation")

(defun xxtjaxx/common-hook ()
  ;; (local-set-key "\C-:" 'uncomment-region)
  ;; (local-set-key "\C-;" 'comment-region)
  ;; (local-set-key "\C-c\C-c" 'comment-region)
  (font-lock-add-keywords nil  '(("\\<\\(FIXME\\|TODO\\|BUG\\):" 1 font-lock-warning-face t)))
  (font-lock-add-keywords nil '(("\\<\\(FIXME\\|TODO\\|BUG\\):" 1 font-lock-warning-face t)))
  (font-lock-add-keywords nil  '(("\\<\\(DONE\\|NOTE\\):" 1 font-lock-variable-name-face t)))
  (font-lock-add-keywords 'org-mode '(("\\(POST\\) " 1 font-lock-post-face t)))
  (font-lock-add-keywords 'c++-mode '(("\\<\\(FIXME\\|TODO\\|BUG\\):" 1 font-lock-todo-face t)))
  (font-lock-add-keywords 'c++-mode '(("\\<\\(DONE\\|NOTE\\):" 1 font-lock-doc-face t)))
  (font-lock-add-keywords 'sh-mode  '(("\\<\\(DONE\\|NOTE\\):" 1 font-lock-doc-face t)))
  (font-lock-add-keywords nil '(("\\<\\(DONE\\|NOTE\\):" 1 font-lock-doc-face t)))
  (font-lock-add-keywords 'fundamental-mode '(("\\<\\(DONE\\):" 1 font-lock-doc-face t)))
  (font-lock-add-keywords 'fundamental-mode '(("\\<\\(FIXME\\|TODO\\|BUG\\):" 1 font-lock-todo-face t)))
  (font-lock-add-keywords 'org-mode '(("-*- Mode:org -*-" 1 font-lock-doc-face t)))
  (font-lock-add-keywords 'org-mode '(("\\<\\(FIXME\\|BUG\\):" 1 font-lock-todo-face t)))
  )

;; show FIXME: / TODO: / FIXME: keywords
(defun xxtjaxx/show-prog-keywords ()
  "highlight additional keywords"
  ;; highlight too long lines
  (font-lock-add-keywords nil '(("^[^\n]\\{80\\}\\(.*\\)$" 1 font-lock-warning-face t)))
  (xxtjaxx/common-hook)
  )

;; clean trailing whitespaces automatically
(setq xxtjaxx/trailing-whitespace-modes '(c++-mode c-mode haskell-mode emacs-lisp-mode
                                                   lisp-mode scheme-mode erlang-mode))

(defun xxtjaxx/trailing-whitespace-hook ()
  (when (member major-mode xxtjaxx/trailing-whitespace-modes)
        (delete-trailing-whitespace)))
(add-hook 'before-save-hook 'xxtjaxx/trailing-whitespace-hook)

;; untabify some modes
;; (setq xxtjaxx/untabify-modes '(haskell-mode emacs-lisp-mode lisp-mode scheme-mode
;;                                                erlang-mode clojure-mode))
(defun xxtjaxx/untabify-hook ()
  (when (member major-mode xxtjaxx/untabify-modes)
        (untabify (point-min) (point-max))))
;; (add-hook 'before-save-hook 'xxtjaxx/untabify-hook)
;: (add-hook 'before-save-hook 'whitespace-cleanup)
(defun save-scratch ()
  (switch-to-buffer (get-buffer "*scratch*"))
  (write-file "~/.scratch.el" nil)
  )

;; (defun mail-add-signature()
;;   (insert-file "~/.signature")
;;   )

(defun set-prog-dictionary ()
  (setq ispell-local-dictionary "english")
  (setq ispell-dictionary "english")
  )
(defun set-org-dictionary ()
  (setq ispell-local-dictionary "german8")
  (setq ispell-dictionary "german8")
  )

(add-hook 'c-mode-hook 'set-prog-dictionary)
(add-hook 'c++-mode-hook 'set-prog-dictionary)
(add-hook 'csharp-mode-hook 'set-prog-dictionary)
(add-hook 'cc-mode-hook 'set-prog-dictionary)
(add-hook 'org-mode-hook 'set-org-dictionary)
(add-hook 'kill-emacs-hook 'save-scratch)

(add-hook 'lisp-mode-hook 'xxtjaxx/show-prog-keywords)
(add-hook 'c++-mode-hook 'xxtjaxx/show-prog-keywords)
(add-hook 'c-mode-hook 'xxtjaxx/show-prog-keywords)
(add-hook 'sh-mode-hook 'xxtjaxx/show-prog-keywords)
;; (add-hook 'org-mode-hook 'xxtjaxx/show-prog-keywords)
(add-hook 'haskell-mode-hook 'xxtjaxx/show-prog-keywords)
(add-hook 'emacs-lisp-mode-hook 'xxtjaxx/show-prog-keywords)

(add-to-list 'auto-mode-alist '("\\.\\(pl\\)$" . cperl-mode))
(add-to-list 'auto-mode-alist '("\\.\\(mdwn\\)$" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.\\(screenrc\\)$" . conf-mode))
(add-to-list 'auto-mode-alist '("\\.\\(js\\|javascript\\)$" . javascript-mode))
(add-to-list 'auto-mode-alist '("emacs" . emacs-lisp-mode))
(add-to-list 'auto-mode-alist '("\\.\\(emacs\\)$" . lisp-mode))
(add-to-list 'auto-mode-alist '("mutt\-andreas-.*" . mail-mode))
(add-to-list 'auto-mode-alist '("\\.\\(latex\\|texi\\|tex\\)$" . latex-mode))
(add-to-list 'auto-mode-alist '("\\(Doxygfile\\)$" . conf-mode))
(add-to-list 'auto-mode-alist '("\\(bashrc\\)$" . sh-mode))
(add-to-list 'auto-mode-alist '("\\(bash_alias\\)$" . sh-mode))
(add-to-list 'auto-mode-alist '("\\.\\(nse\\)$" . lua-mode))
;;; emacs-rc-common-hooks.el ends here






