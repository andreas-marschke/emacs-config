;;; emacs-rc-common-hooks.el ---

(defface font-lock-post-face
  '(( ((class color) (min-colors 8))
          (:foreground "yellow" :weight bold)
         ))
  "Documentation")

;; clean trailing whitespaces automatically
(setq xxtjaxx/trailing-whitespace-modes '(c++-mode
					  c-mode
					  emacs-lisp-mode
					  lisp-mode
					  js2-mode
					  html-mode
					  java-mode
					  perl-mode
					  cperl-mode
					  web-mode))

(defun xxtjaxx/trailing-whitespace-hook ()
  (when (member major-mode xxtjaxx/trailing-whitespace-modes)
        (delete-trailing-whitespace)))
(add-hook 'before-save-hook 'xxtjaxx/trailing-whitespace-hook)

;; If there is anything in the *scratch* buffer it will save it off to a file
(defun save-scratch ()
  (switch-to-buffer (get-buffer "*scratch*"))
  (write-file "~/.scratch.el" nil)
  )

(defun mail-add-signature()
  (insert-file "~/.signature")
  )

;; Shows Emacs Menu should I intend to use emacs in a GUI
(defun menu-show()
  (interactive)
  (dolist (m '(menu-bar-mode scroll-bar-mode blink-cursor-mode))
    (if (boundp m)
	(funcall m 1)))
  )

;; Called from init.el to hide menu when in termninal
(defun menu-hide()
  (interactive)
  (dolist (m '(menu-bar-mode scroll-bar-mode blink-cursor-mode))
    (if (boundp m)
	(funcall m -1)))
  )

;; Preferred Modes for files
(add-to-list 'auto-mode-alist '("\\.\\(pl\\)$" . cperl-mode))
(add-to-list 'auto-mode-alist '("\\.\\(less\\)$" . less-css-mode))
(add-to-list 'auto-mode-alist '("\\.\\(mdwn\\|md\\)$" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.\\(screenrc\\)$" . conf-mode))
(add-to-list 'auto-mode-alist '("\\.\\(js\\|javascript\\|js\\.es6\\)$" . js2-mode))
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
(add-to-list 'auto-mode-alist '("\\.\\(html\\)$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.\\(yml\\|yaml\\)$" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.\\(gradle\\|groovy\\)$" . groovy-mode))
(add-to-list 'auto-mode-alist '("\\.\\(aj\\|java\\)$" . java-mode))
(add-to-list 'auto-mode-alist '("\\.\\(nunjucks\\)$" . web-mode))

;; Have Web-Mode use Django For nunjucks highlighting
(defun web-mode-use-django-engine()
  (when (and (stringp buffer-file-name)
	     (string-match "\\.nunjucks" buffer-file-name))
    (web-mode-set-engine "django"
			 )))
(add-hook 'web-mode-hook 'web-mode-use-django-engine)

(add-hook 'dired-load-hook '(lambda () (require 'dired-x)))
(setq dired-omit-mode t)

(setq mumamo-background-colors nil)
