;;; emacs-rc-slime.el ---

;; Copyright (C) Alex Ott
;;
;; Author: Alex Ott <alexott@gmail.com>
;; Keywords:
;; Requirements:
;; Status: not intended to be distributed yet

;;; SLIME
(require 'inf-lisp)
(setq inferior-lisp-program "sbcl")
(setq slime-net-coding-system 'utf-8-unix)
;(push "~/emacs/slime/" load-path)
(require 'slime)
(slime-setup)
(add-hook 'lisp-mode-hook
	  (lambda ()
	    (slime-mode t)))

(add-hook 'inferior-lisp-mode-hook
	  (lambda ()
	    (inferior-slime-mode t)))

;; (add-hook 'slime-mode-hook (lambda () (slime-autodoc-mode t)))

;; (setq slime-lisp-implementations '((clojure ("clj-cmd") :init swank-clojure-init)))
;; (add-to-list 'slime-lisp-implementations '(sbcl ("sbcl")  :coding-system utf-8-unix))

(setq slime-use-autodoc-mode nil)
(eval-after-load "slime"
  '(progn
 ;;    (push "~/emacs/slime/contrib" load-path)
     (slime-setup '(slime-fancy slime-asdf slime-banner slime-fuzzy slime-repl))
     (setq slime-complete-symbol*-fancy t)
     (setq slime-complete-symbol-function 'slime-fuzzy-complete-symbol)
     ))

(global-set-key [f5] 'slime)
(global-set-key [(control f11)] 'slime-selector)

;;; emacs-rc-slime.el ends here
