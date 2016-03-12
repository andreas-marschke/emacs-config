(normal-top-level-add-to-load-path '("~/.emacs.d/elisp/") )
(normal-top-level-add-to-load-path '("~/.emacs.d/elisp/ack") )
(normal-top-level-add-to-load-path '("~/.emacs.d/elisp/with-editor") )
(normal-top-level-add-to-load-path '("~/.emacs.d/elisp/dirtree/"))
(normal-top-level-add-to-load-path '("~/.emacs.d/elisp/editorconfig/"))
(normal-top-level-add-to-load-path '("~/.emacs.d/elisp/ios-config-mode/"))
(normal-top-level-add-to-load-path '("~/.emacs.d/elisp/js-mode") )
(normal-top-level-add-to-load-path '("~/.emacs.d/elisp/coffee-mode") )
(normal-top-level-add-to-load-path '("~/.emacs.d/elisp/js2-mode/") )
(normal-top-level-add-to-load-path '("~/.emacs.d/elisp/json-mode/") )
(normal-top-level-add-to-load-path '("~/.emacs.d/elisp/json-reformat/") )
(normal-top-level-add-to-load-path '("~/.emacs.d/elisp/json-snatcher/") )
(normal-top-level-add-to-load-path '("~/.emacs.d/elisp/keydef/") )
(normal-top-level-add-to-load-path '("~/.emacs.d/elisp/less/") )
(normal-top-level-add-to-load-path '("~/.emacs.d/elisp/git-modes/") )
(normal-top-level-add-to-load-path '("~/.emacs.d/elisp/magit/lisp/") )
(normal-top-level-add-to-load-path '("~/.emacs.d/elisp/mongo-el/"))
(normal-top-level-add-to-load-path '("~/.emacs.d/elisp/mustache/") )
(normal-top-level-add-to-load-path '("~/.emacs.d/elisp/nagios-mode/"))
(normal-top-level-add-to-load-path '("~/.emacs.d/elisp/nxhtml/") )
(normal-top-level-add-to-load-path '("~/.emacs.d/elisp/python-django/") )
(normal-top-level-add-to-load-path '("~/.emacs.d/elisp/python/") )
(normal-top-level-add-to-load-path '("~/.emacs.d/elisp/slime/") )
(normal-top-level-add-to-load-path '("~/.emacs.d/elisp/swank-js/") )
(normal-top-level-add-to-load-path '("~/.emacs.d/elisp/web-mode") )
(normal-top-level-add-to-load-path '("~/.emacs.d/elisp/yaml-mode/") )
(normal-top-level-add-to-load-path '("~/.emacs.d/elisp/yasnippet/") )
(normal-top-level-add-to-load-path '("~/.emacs.d/elisp/s/") )
(normal-top-level-add-to-load-path '("~/.emacs.d/elisp/dash.el/") )
(normal-top-level-add-to-load-path '("~/.emacs.d/elisp/gradle-mode/") )
(normal-top-level-add-to-load-path '("~/.emacs.d/elisp/groovy-mode/") )
(normal-top-level-add-to-load-path '("~/.emacs.d/elisp/jdee/lisp"))
(normal-top-level-add-to-load-path '("~/.emacs.d/elisp/logcat-mode") )
(normal-top-level-add-to-load-path '("~/.emacs.d/elisp/jsx-mode/src") )

(normal-top-level-add-to-load-path '("~/src/java/jdee/build/lisp") )
(normal-top-level-add-to-load-path '("~/src/java/jdee/build/config") )
;(normal-top-level-add-to-load-path '("~/.emacs.d/elisp/eclim/") )
;(normal-top-level-add-to-load-path '("~/.emacs.d/elpa/company-0.8.12") )

(load "jde-autoload")
(require 'yaml-mode)
(require 'lua-mode)
(require 'mustache-mode)
(require 'mocp)
(require 'logcat)
(require 'multi-mode)
(require 'keydef)
(require 'multi-term)
(require 'js2-mode)
(require 'org-install)
(require 'nav)
(require 'powershell-mode)
(require 'less-css-mode)
(require 'coffee-mode)
(require 'magit)
(require 'windata)
(require 'tree-mode)
(require 'dirtree)
(require 'nagios-mode)
(require 'ios-config-mode)
(require 'markdown-mode)
(require 'editorconfig)
(require 'server)
(require 'gradle-mode)
(require 'groovy-mode)
(require 'dash)
(require 'web-mode)
(require 'ack)
(require 'jsx-mode)

(load "editorconfig")
(load "~/.emacs.d/rc/emacs-rc-ccmode.el")
(load "~/.emacs.d/rc/emacs-rc-cmake.el")
(load "~/.emacs.d/rc/emacs-rc-git.el")
(load "~/.emacs.d/rc/emacs-rc-info.el")
(load "~/.emacs.d/rc/emacs-rc-slime.el")
(load "~/.emacs.d/rc/emacs-rc-js.el")
(load "~/.emacs.d/rc/emacs-rc-erc.el")
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
(load "~/.emacs.d/rc/emacs-rc-java.el")
(load "~/.emacs.d/rc/emacs-rc-melpa.el")
(load "~/.emacs.d/rc/emacs-rc-projectile.el")

(nav-disable-overeager-window-splitting)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-fill-mode nil)
 '(canlock-password "647dc58dfe29df3e23118aaabef8f78aa113039e")
 '(color-theme-is-global nil)
 '(column-number-mode t)
 '(compilation-scroll-output t)
 '(css-indent-offset 2)
 '(cssm-indent-level 1)
 '(cua-mode t nil (cua-base))
 '(develock-auto-enable nil)
 '(develock-max-column-plist nil)
 '(dired-listing-switches "-al")
 '(eclim-executable "/usr/local/eclipse/plugins/org.eclim_2.4.1/bin/eclim")
 '(font-lock-mode t t)
 '(ido-mode (quote buffer) nil (ido))
 '(initial-scratch-message (shell-command-to-string "cat ~/.scratch.el"))
 '(js2-basic-offset 8)
 '(js2-concat-multiline-strings nil)
 '(js2-highlight-level 3)
 '(js2-include-jslint-globals t)
 '(js2-include-node-externs t)
 '(js2-skip-preprocessor-directives t)
 '(magit-last-seen-setup-instructions "1.4.0" t)
 '(message-courtesy-message nil)
 '(message-dont-reply-to-names nil)
 '(message-reply-to-function nil)
 '(mml-default-directory nil)
 '(mocp-theme "transparent-background")
 '(mouse-wheel-follow-mouse (quote t))
 '(mouse-wheel-progressive-speed nil)
 '(mouse-wheel-scroll-amount (quote (1 ((shift) . 1))))
 '(multi-term-program "/bin/bash")
 '(nodejs-repl-command "node")
 '(org-agenda-files
   (quote
    ("~/src/doc/boomerang.todo.org" "~/src/doc/concerto.todo.org")))
 '(projectile-enable-caching t)
 '(projectile-global-mode t)
 '(ring-bell-function (quote ignore) t)
 '(scroll-step 1)
 '(show-paren-mode t)
 '(size-indication-mode t)
 '(user-full-name "Andreas Marschke")
 '(user-mail-address "amarschke@soasta.com")
 '(web-mode-enable-auto-closing t)
 '(web-mode-enable-auto-pairing t)
 '(web-mode-indent-style 2)
 '(web-mode-markup-indent-offset 2)
 '(web-mode-script-padding 1)
 '(whitespace-global-mode nil)
 '(whitespace-modes (quote (awk-mode)))
 '(whitespace-silent t))

(server-start)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

(menu-hide)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-tooltip ((t (:foreground "white"))))
 '(magit-diff-added ((t (:background "black" :foreground "green"))))
 '(magit-diff-added-highlight ((t (:background "black" :foreground "green" :weight bold))))
 '(magit-diff-base ((t (:background "black" :foreground "red"))))
 '(magit-diff-base-highlight ((t (:background "black" :foreground "red" :weight bold))))
 '(magit-diff-removed ((t (:background "black" :foreground "red"))))
 '(magit-diff-removed-highlight ((t (:foreground "red" :weight bold))))
 '(magit-diffstat-added ((t (:foreground "green"))))
 '(magit-item-highlight ((t (:inherit default))))
 '(magit-log-head-label-bisect-bad ((t (:background "black" :foreground "red" :box 1))))
 '(magit-log-head-label-bisect-good ((t (:background "black" :foreground "dark olive green" :box 1))))
 '(magit-log-head-label-bisect-skip ((t (:background "red" :foreground "white" :box 1))))
 '(web-mode-doctype-face ((t (:distant-foreground "#ff" :foreground "#ff")))))
