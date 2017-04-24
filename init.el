
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

;;; Code:
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/elisp/org-mode/lisp")
(add-to-list 'load-path "~/.emacs.d/elisp/org-mode/contrib/lisp")
(normal-top-level-add-to-load-path '("~/.emacs.d/elisp/") )
(normal-top-level-add-to-load-path '("~/.emacs.d/elisp/javadoc-lookup") )
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
(normal-top-level-add-to-load-path '("~/.emacs.d/elisp/python-django/") )
(normal-top-level-add-to-load-path '("~/.emacs.d/elisp/python/") )
(normal-top-level-add-to-load-path '("~/.emacs.d/elisp/slime/") )
(normal-top-level-add-to-load-path '("~/.emacs.d/elisp/swank-js/") )
(normal-top-level-add-to-load-path '("~/.emacs.d/elisp/web-mode") )
(normal-top-level-add-to-load-path '("~/.emacs.d/elisp/yaml-mode/") )
(normal-top-level-add-to-load-path '("~/.emacs.d/elisp/yasnippet/") )
(normal-top-level-add-to-load-path '("~/.emacs.d/elisp/s/") )
(normal-top-level-add-to-load-path '("~/.emacs.d/elisp/dash/") )
(normal-top-level-add-to-load-path '("~/.emacs.d/elisp/gradle-mode/") )
(normal-top-level-add-to-load-path '("~/.emacs.d/elisp/groovy-mode/") )
(normal-top-level-add-to-load-path '("~/.emacs.d/elisp/logcat-mode") )
(normal-top-level-add-to-load-path '("~/.emacs.d/elisp/jsx-mode/src") )
(normal-top-level-add-to-load-path '("~/.emacs.d/elisp/glsl-mode") )
(normal-top-level-add-to-load-path '("~/.emacs.d/elisp/proguard-mode") )
(normal-top-level-add-to-load-path '("~/.emacs.d/elisp/neotree") )
(normal-top-level-add-to-load-path '("~/.emacs.d/elisp/ipcalc") )
(normal-top-level-add-to-load-path '("~/.emacs.d/elisp/groovy-mode") )
(normal-top-level-add-to-load-path '("~/.emacs.d/elisp/company-mode") )
(normal-top-level-add-to-load-path '("~/.emacs.d/elisp/projectile") )
(normal-top-level-add-to-load-path '("~/.emacs.d/elisp/epl") )
(normal-top-level-add-to-load-path '("~/.emacs.d/elisp/pkg-info") )
(normal-top-level-add-to-load-path '("~/.emacs.d/elisp/flycheck") )
(normal-top-level-add-to-load-path '("~/.emacs.d/elisp/dockerfile-mode") )
(normal-top-level-add-to-load-path '("~/.emacs.d/elisp/websocket") )
(normal-top-level-add-to-load-path '("~/.emacs.d/elisp/indium") )


(require 'yaml-mode)
(require 'projectile)
(require 'lua-mode)
(require 'mustache-mode)
(require 'mocp)
(require 'groovy-mode)
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
(require 'dash)
(require 'web-mode)
(require 'ack)
(require 'jsx-mode)
(require 'glsl-mode)
(require 'neotree)
(require 'ipcalc)
(require 'javadoc-lookup)
(require 'maven-fetch)
(require 'javadoc-import)
(require 'company)
(require 'epl)
(require 'pkg-info)
(require 'flycheck)
(require 'dockerfile-mode)
(require 'websocket)
(require 'indium)

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
(load "~/.emacs.d/rc/emacs-rc-flycheck.el")

(nav-disable-overeager-window-splitting)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-fill-mode nil t)
 '(c-insert-tab-function (quote insert-tab))
 '(c-offsets-alist (quote ((inline-open . 0) (inline-close . 0))))
 '(canlock-password "647dc58dfe29df3e23118aaabef8f78aa113039e")
 '(color-theme-is-global nil)
 '(column-number-mode t)
 '(company-mode 1 t)
 '(compilation-scroll-output t)
 '(css-indent-offset 2)
 '(cssm-indent-level 1)
 '(cua-mode t nil (cua-base))
 '(current-fill-column 240 t)
 '(develock-auto-enable nil)
 '(develock-max-column-plist nil)
 '(dired-listing-switches "-al")
 '(flycheck-emacs-lisp-load-path "inherit")
 '(font-lock-mode t t)
 '(git-commit-summary-max-length 130)
 '(global-whitespace-newline-mode nil)
 '(ido-mode (quote buffer) nil (ido))
 '(initial-scratch-message (shell-command-to-string "cat ~/.scratch.el"))
 '(js-indent-level 4)
 '(js2-concat-multiline-strings nil)
 '(js2-highlight-level 3)
 '(js2-include-jslint-globals t)
 '(js2-include-node-externs t)
 '(js2-init-hook (quote (boomerang-mode auto-fill-mode)))
 '(js2-mode-assume-strict t)
 '(js2-skip-preprocessor-directives t)
 '(magit-diff-arguments
   (quote
    ("--stat" "--no-ext-diff" "--diff-algorithm=histogram")))
 '(magit-diff-mode-hook nil)
 '(magit-diff-paint-whitespace t)
 '(magit-diff-refine-hunk (quote all))
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
 '(nav-boring-file-regexps
   (quote
    ("^[.][^.].*$" "^[.]$" "~$" "[.]elc$" "[.]pyc$" "[.]o$" "[.]bak$" "^_MTN$" "^blib$" "^CVS$" "^RCS$" "^SCCS$" "^_darcs$" "^_sgbak$" "^autom4te.cache$" "^cover_db$" "^_build$" "^#.*#$")))
 '(nav-width 25)
 '(nodejs-repl-command "node")
 '(org-agenda-files (quote ("~/src/doc/todo/todo.org")))
 '(org-src-preserve-indentation t)
 '(projectile-enable-caching t)
 '(projectile-globally-ignored-directories
   (quote
    (".idea" ".eunit" ".git" ".hg" ".fslckout" ".bzr" "_darcs" ".tox" ".svn" "node_modules" "build" "*vendor*")))
 '(projectile-globally-ignored-file-suffixes (quote ("~")))
 '(ring-bell-function (quote ignore))
 '(safe-local-variable-values
   (quote
    ((bug-reference-bug-regexp . "#\\(?2:[0-9]+\\)")
     (c-file-offsets
      (substatement-open . 0))
     (prompt-to-byte-compile)
     (c-indentation-style . k&r)
     (indent-tabs-mode . 1)
     (folded-file . t)
     (TeX-open-quote . "<<")
     (TeX-close-quote . ">>"))))
 '(scroll-step 1)
 '(show-paren-mode t)
 '(size-indication-mode t)
 '(user-full-name "Andreas Marschke")
 '(web-mode-enable-auto-closing t)
 '(web-mode-enable-auto-pairing t)
 '(web-mode-indent-style 2)
 '(web-mode-markup-indent-offset 2)
 '(web-mode-script-padding 0)
 '(whitespace-global-mode nil)
 '(whitespace-line-column 120)
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
 '(magit-blame-heading ((t (:foreground "grey"))))
 '(magit-diff-added ((t (:background "black" :foreground "green"))))
 '(magit-diff-added-highlight ((t (:background "black" :foreground "green" :weight bold))))
 '(magit-diff-base ((t (:background "black" :foreground "red"))))
 '(magit-diff-base-highlight ((t (:background "black" :foreground "red" :weight bold))))
 '(magit-diff-removed ((t (:background "black" :foreground "red"))))
 '(magit-diff-removed-highlight ((t (:foreground "red" :weight bold))))
 '(magit-diffstat-added ((t (:foreground "green"))))
 '(magit-hash ((t (:foreground "blue"))))
 '(magit-item-highlight ((t (:inherit default))))
 '(magit-log-head-label-bisect-bad ((t (:background "black" :foreground "red" :box 1))))
 '(magit-log-head-label-bisect-good ((t (:background "black" :foreground "dark olive green" :box 1))))
 '(magit-log-head-label-bisect-skip ((t (:background "red" :foreground "white" :box 1))))
 '(web-mode-doctype-face ((t (:distant-foreground "#ff" :foreground "#ff"))))
 '(whitespace-empty ((t (:background "black" :foreground "white"))))
 '(whitespace-indentation ((t (:background "black" :foreground "white"))))
 '(whitespace-space-after-tab ((t (:background "black" :foreground "white"))))
 '(whitespace-space-before-tab ((t (:background "black" :foreground "blue")))))

