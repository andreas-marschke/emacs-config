(normal-top-level-add-to-load-path '("~/.emacs.d/elisp/") )
(normal-top-level-add-to-load-path '("~/.emacs.d/elisp/yasnippet/") )
(normal-top-level-add-to-load-path '("~/.emacs.d/elisp/python/") )
(normal-top-level-add-to-load-path '("~/.emacs.d/elisp/nxhtml/") )
(normal-top-level-add-to-load-path '("~/.emacs.d/elisp/python-django/") )
(normal-top-level-add-to-load-path '("~/.emacs.d/elisp/less/") )
(normal-top-level-add-to-load-path '("~/.emacs.d/elisp/yaml-mode/") )
(normal-top-level-add-to-load-path '("~/.emacs.d/elisp/dirtree/"))
(normal-top-level-add-to-load-path '("~/.emacs.d/elisp/editorconfig/"))
(normal-top-level-add-to-load-path '("~/.emacs.d/elisp/nagios-mode/"))
(normal-top-level-add-to-load-path '("~/.emacs.d/elisp/ios-config-mode/"))

(require 'keydef)
(require 'yaml-mode)
(require 'lua-mode)
(require 'mocp)
(require 'multi-mode)
(require 'multi-term)
(require 'pastebin)
(require 'w3m)
(require 'org-install)
(require 'iswitchb)
(require 'nav)
(require 'powershell-mode)
(require 'less-css-mode)
(require 'perldoc)
(require 'python-django)
(require 'windata)
(require 'tree-mode)
(require 'dirtree)
(require 'nagios-mode)
(require 'ios-config-mode)
(require 'markdown-mode)
(require 'nodejs-repl)
(require 'editorconfig)

(load "~/.emacs.d/elisp/nxhtml/autostart.el")

(load "~/.emacs.d/rc/emacs-rc-ccmode.el")
(load "~/.emacs.d/rc/emacs-rc-cmake.el")

(load "~/.emacs.d/rc/emacs-rc-gdb.el")
(load "~/.emacs.d/rc/emacs-rc-git.el")
(load "~/.emacs.d/rc/emacs-rc-info.el")
(load "~/.emacs.d/rc/emacs-rc-js.el")
(load "~/.emacs.d/rc/emacs-rc-keydefs.el")
(load "~/.emacs.d/rc/emacs-rc-lisp.el")
(load "~/.emacs.d/rc/emacs-rc-misc-things.el")
(load "~/.emacs.d/rc/emacs-rc-org-mode.el")
(load "~/.emacs.d/rc/emacs-rc-outlinemode.el")
(load "~/.emacs.d/rc/emacs-rc-perl.el")
(load "~/.emacs.d/rc/emacs-rc-prog-misc.el")
(load "~/.emacs.d/rc/emacs-rc-python.el")
(load "~/.emacs.d/rc/emacs-rc-screen.el")
(load "~/.emacs.d/rc/emacs-rc-sh-mode.el")
(load "~/.emacs.d/rc/emacs-rc-yasnippet.el")
(load "~/.emacs.d/rc/emacs-rc-common-hooks.el")
(nav-disable-overeager-window-splitting)

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(canlock-password "647dc58dfe29df3e23118aaabef8f78aa113039e")
 '(column-number-mode t)
 '(cua-mode t nil (cua-base))
 '(develock-auto-enable nil)
 '(develock-max-column-plist nil)
 '(dired-listing-switches "-al")
 '(font-lock-mode t t)
 '(ido-ubiquitous-mode t)
 '(initial-scratch-message (shell-command-to-string "cat ~/.scratch.el"))
 '(icomplete-mode t)
 '(message-courtesy-message nil)
 '(message-dont-reply-to-names nil)
 '(message-reply-to-function nil)
 '(mml-default-directory nil)
 '(mocp-theme "transparent-background")
 '(multi-term-program "/bin/bash")
 '(show-paren-mode t)
 '(size-indication-mode t)
 '(user-full-name "Andreas Marschke")
 '(user-mail-address "andreas.marschke@googlemail.com")
 '(whitespace-global-mode nil)
 '(whitespace-modes (quote (awk-mode)))
 '(whitespace-silent t)
 '(css-indent-offset 2)
 '(cssm-indent-level 1)
 '(yas-global-mode 1)
 '(mouse-wheel-scroll-amount '(1 ((shift) . 1)))
 '(mouse-wheel-progressive-speed nil)
 '(mouse-wheel-follow-mouse 't)
 '(scroll-step 1)
 '(erc-hide-list '("JOIN" "PART" "QUIT"))
)

(server-start)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

(menu-hide)
