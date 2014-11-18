;;; emacs-rc-common-hooks.el ---

(defface font-lock-post-face
  '(( ((class color) (min-colors 8))
          (:foreground "yellow" :weight bold)
         ))
  "Documentation")

;; clean trailing whitespaces automatically
(setq xxtjaxx/trailing-whitespace-modes '(c++-mode c-mode haskell-mode emacs-lisp-mode
                                                   lisp-mode scheme-mode erlang-mode js-mode js2-mode html-mode))

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
t
(defun mail-add-signature()
  (insert-file "~/.signature")
  )

(defun menu-show()
  (interactive)
  (dolist (m '(menu-bar-mode tool-bar-mode scroll-bar-mode blink-cursor-mode))
    (if (boundp m)
	(funcall m 1)))
  )

(defun menu-hide()
  (interactive)
  (dolist (m '(menu-bar-mode tool-bar-mode scroll-bar-mode blink-cursor-mode))
    (if (boundp m)
	(funcall m -1)))
  )


(add-to-list 'auto-mode-alist '("\\.\\(pl\\)$" . cperl-mode))
(add-to-list 'auto-mode-alist '("\\.\\(less\\)$" . less-css-mode))
(add-to-list 'auto-mode-alist '("\\.\\(mdwn\\|md\\)$" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.\\(screenrc\\)$" . conf-mode))
(add-to-list 'auto-mode-alist '("\\.\\(js\\|javascript\\)$" . javascript-mode))
(add-to-list 'auto-mode-alist '("emacs$" . emacs-lisp-mode))
(add-to-list 'auto-mode-alist '("\\.\\(emacs\\)$" . lisp-mode))
(add-to-list 'auto-mode-alist '("mutt\-andreas-.*" . mail-mode))
(add-to-list 'auto-mode-alist '("\\.\\(latex\\|texi\\|tex\\)$" . latex-mode))
(add-to-list 'auto-mode-alist '("\\(Doxygfile\\)$" . conf-mode))
(add-to-list 'auto-mode-alist '("\\(bashrc\\)$" . sh-mode))
(add-to-list 'auto-mode-alist '("\\(bash_alias\\)$" . sh-mode))
(add-to-list 'auto-mode-alist '("\\.\\(nse\\)$" . lua-mode))
(add-to-list 'auto-mode-alist '("\\.\\(t\\)$" . cperl-mode))
(add-to-list 'auto-mode-alist '("\\.editorconfig$" . conf-unix-mode))
(add-to-list 'auto-mode-alist '("\\.\\(html\\)$" . django-nxhtml-mumamo-mode))
(add-to-list 'auto-mode-alist '("\\.\\(yml\\|yaml\\)$" . yaml-mode))
;;; emacs-rc-common-hooks.el ends here
