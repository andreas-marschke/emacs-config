(require 'slime)

(setq inferior-lisp-program "/usr/bin/sbcl")
(add-to-list 'load-path "~/.emacs.d/elisp/slime/")
(setq slime-contribs '(slime-fancy slime-scratch slime-editing-commands slime-repl slime-js))
(setq slime-lisp-implementations '((sbcl ("sbcl" "--core" "/home/andreas/.emacs.d/sbcl/slime-swank.core")
					 :init (lambda (port-file _)
						 (format "(swank:start-server %S)\n" port-file)))))
(require 'slime-autoloads)

(slime-setup)
