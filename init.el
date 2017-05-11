;;; init.el --- Emacs Initialization and Configuration

;; Copyright (C) 2017 Andreas Marschke

;; Author:  <emacs@andreas-marschke.name>
;; Created: 03.05.2017
;; Version: 0.1
;; Package-Requires: (())
;; Keywords: 
;; URL:
;;; Commentary:
;;; Code:

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

;;; Code:
(package-initialize)

;;;;; Load Path extensions
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
;(normal-top-level-add-to-load-path '("~/.emacs.d/elisp/swank-js/") )
(normal-top-level-add-to-load-path '("~/.emacs.d/elisp/web-mode") )
(normal-top-level-add-to-load-path '("~/.emacs.d/elisp/yaml-mode/") )
(normal-top-level-add-to-load-path '("~/.emacs.d/elisp/yasnippet/") )
(normal-top-level-add-to-load-path '("~/.emacs.d/elisp/s/") )
(normal-top-level-add-to-load-path '("~/.emacs.d/elisp/dash/") )
;(normal-top-level-add-to-load-path '("~/.emacs.d/elisp/gradle-mode/") )
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
(normal-top-level-add-to-load-path '("~/.emacs.d/elisp/memoize") )
(normal-top-level-add-to-load-path '("~/.emacs.d/elisp/outorg") )
(normal-top-level-add-to-load-path '("~/.emacs.d/elisp/outshine") )
(normal-top-level-add-to-load-path '("~/.emacs.d/elisp/async") )

;;;;; Dependencies
;; Emacs Server Utility used to setup socket for EmacsClient
(require 'server)
;; List manipulation library 
(require 'dash)
;; Package Loader
(require 'epl)
;; Emacs Package Information retrieval
(require 'pkg-info)
;; Websocket implementation for Emacs
(require 'websocket)
;; Memoization functions
(require 'memoize)
;; Utility functions for fetching maven data
(require 'maven-fetch)
;; Easy keybind definition
(require 'keydef)
;; Git interaction
(require 'git)
;; Build trees for directories
(require 'dirtree)
;; Package Library
(require 'package)
;;;;; Apps
;; Control music on console player
(require 'mocp)
;; NeoTree Directory Navigation sidebar
(require 'neotree)
;; ipcalc
(require 'ipcalc)
;; Search with ack
(require 'ack)
;; NodeJS REPL
(require 'nodejs-repl)

;;;;; Utilities
;; Window configuration
(require 'windata)
;; Tree Widget Management
(require 'tree-mode)
;; info(1) support
(require 'info)
;; Mode Sensitive Info lookup
(require 'info-look)
;; Emacs Lisp documentation
(require 'eldoc)

;;;;; Developer Productivity
;; Project Management
(require 'projectile)
;; Unify editor configuration by using editorconfig
(require 'editorconfig)
;; Access Android Logcat
(require 'logcat)
;; Import Statement utility for Java code
(require 'javadoc-import)
;; Run multiple terminals
(require 'multi-term)
;; Git Repository Management
(require 'magit)
;; Lookup Java Class documentation
(require 'javadoc-lookup)
;; Completion
(require 'company)
;; Linting
(require 'flycheck)
;; Javascript Debugging
(require 'indium)
;; Better Outline-Minor-Mode
(require 'outorg)
(require 'outshine)

;;;;; Syntax Highlighting Modes
;; Org-Mode
(require 'org-install)
;; Dockerfiles
(require 'dockerfile-mode)
;; JSX / React
(require 'jsx-mode)
;; Shader Development
(require 'glsl-mode)
;; HTML and HTML-Templates (Django/Jinja/Nunjucks)
(require 'web-mode)
;; Nagios configuration files
(require 'nagios-mode)
;; IOS Configuration
(require 'ios-config-mode)
;; Markdown
(require 'markdown-mode)
;; Powershell
(require 'powershell-mode)
;; LESS
(require 'less-css-mode)
;; CoffeeScript
(require 'coffee-mode)
;; Better JS-Mode
(require 'js2-mode)
;; JSON
(require 'json-mode)
;; Groovy/Gradle
(require 'groovy-mode)
;; Lua
(require 'lua-mode)
;; Mustache HTML Templates
(require 'mustache-mode)
;; YAML
(require 'yaml-mode)


;;; Load Configuration Files
(load "editorconfig")
(load "~/.emacs.d/rc/emacs-rc-git.el")
(load "~/.emacs.d/rc/emacs-rc-info.el")
(load "~/.emacs.d/rc/emacs-rc-gdb.el")
(load "~/.emacs.d/rc/emacs-rc-slime.el")
(load "~/.emacs.d/rc/emacs-rc-js.el")
(load "~/.emacs.d/rc/emacs-rc-erc.el")
(load "~/.emacs.d/rc/emacs-rc-keydefs.el")
(load "~/.emacs.d/rc/emacs-rc-misc-things.el")
(load "~/.emacs.d/rc/emacs-rc-org-mode.el")
(load "~/.emacs.d/rc/emacs-rc-outlinemode.el")
(load "~/.emacs.d/rc/emacs-rc-perl.el")
(load "~/.emacs.d/rc/emacs-rc-prog-misc.el")
(load "~/.emacs.d/rc/emacs-rc-python.el")
(load "~/.emacs.d/rc/emacs-rc-screen.el")
(load "~/.emacs.d/rc/emacs-rc-sh-mode.el")
(load "~/.emacs.d/rc/emacs-rc-yasnippet.el")
(load "~/.emacs.d/rc/emacs-rc-java.el")
(load "~/.emacs.d/rc/emacs-rc-melpa.el")
(load "~/.emacs.d/rc/emacs-rc-projectile.el")
(load "~/.emacs.d/rc/emacs-rc-flycheck.el")
(load "~/.emacs.d/rc/emacs-rc-common-hooks.el")
(load "~/.emacs.d/rc/emacs-rc-file-map.el")

;;; Custom Variable Settings
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-compression-mode t)
 '(auto-fill-mode nil)
 '(browse-url-browser-function (quote browse-url-default-browser))
 '(browse-url-chrome-program
   "/Applications/Google\\ Chrome.app/Contents/MacOS/Google\\ Chrome")
 '(c-insert-tab-function (quote insert-tab))
 '(c-offsets-alist (quote ((inline-open . 0) (inline-close . 0))))
 '(column-number-mode t)
 '(company-backends
   (quote
    (company-css company-semantic company-javadoc-lookup company-clang company-xcode company-cmake company-capf company-files
                 (company-dabbrev-code company-gtags company-etags company-keywords))))
 '(company-mode 1 t)
 '(compilation-scroll-output t)
 '(css-indent-offset 2)
 '(cssm-indent-level 1)
 '(cua-mode t nil (cua-base))
 '(current-fill-column 240 t)
 '(delete-selection-mode t)
 '(dired-listing-switches "-al")
 '(dired-omit-mode nil t)
 '(erc-auto-query (quote bury))
 '(erc-autojoin-channels-alist (quote (("freenode.net" ""))))
 '(erc-fill-mode t)
 '(erc-hide-list (quote ("JOIN" "PART" "QUIT")))
 '(erc-interpret-mirc-color t)
 '(erc-irccontrols-mode t)
 '(erc-kill-buffer-on-part t)
 '(erc-kill-queries-on-quit t)
 '(erc-kill-server-buffer-on-quit t)
 '(erc-list-mode t)
 '(erc-match-mode t)
 '(erc-menu-mode nil)
 '(erc-move-to-prompt-mode t)
 '(erc-netsplit-mode t)
 '(erc-networks-mode t)
 '(erc-nick "xxtjaxx")
 '(erc-noncommands-mode t)
 '(erc-pcomplete-mode t)
 '(erc-readonly-mode t)
 '(erc-ring-mode t)
 '(erc-stamp-mode t)
 '(erc-track-minor-mode t)
 '(erc-track-mode t)
 '(fill-column 240)
 '(flycheck-checkers
   (quote
    (css-csslint css-stylelint emacs-lisp emacs-lisp-checkdoc groovy javascript-eslint json-jsonlint less less-stylelint perl perl-perlcritic rpm-rpmlint markdown-mdl nix sh-bash sh-posix-dash sh-posix-bash sh-shellcheck sql-sqlint systemd-analyze tex-chktex tex-lacheck texinfo xml-xmlstarlet xml-xmllint yaml-jsyaml)))
 '(flycheck-emacs-lisp-load-path "inherit")
 '(font-lock-comment-face (quote font-lock-comment-delimiter-face) t)
 '(font-lock-mode t t)
 '(gdb-many-windows t)
 '(gdb-show-main t)
 '(git-commit-summary-max-length 130)
 '(global-company-mode t)
 '(global-whitespace-newline-mode nil)
 '(gud-chdir-before-run nil)
 '(gud-tooltip-mode t)
 '(ido-mode (quote buffer) nil (ido))
 '(indent-tabs-mode nil)
 '(initial-scratch-message (shell-command-to-string "cat ~/.scratch.el"))
 '(jdee-server-dir "~/.emacs.d/elisp/jdee-server/target")
 '(js-indent-level 4)
 '(js2-concat-multiline-strings nil)
 '(js2-highlight-level 3)
 '(js2-include-jslint-globals t)
 '(js2-include-node-externs t)
 '(js2-init-hook (quote (boomerang-mode auto-fill-mode)))
 '(js2-mode-assume-strict t)
 '(js2-skip-preprocessor-directives t)
 '(kill-whole-line t)
 '(magit-auto-revert-mode t)
 '(magit-diff-arguments
   (quote
    ("--stat" "--no-ext-diff" "--diff-algorithm=histogram")))
 '(magit-diff-mode-hook nil)
 '(magit-diff-paint-whitespace t)
 '(magit-diff-refine-hunk (quote all))
 '(magit-last-seen-setup-instructions "1.4.0" t)
 '(magit-save-some-buffers (quote dontask))
 '(message-courtesy-message nil)
 '(message-dont-reply-to-names nil)
 '(message-reply-to-function nil)
 '(mml-default-directory nil)
 '(mocp-theme "transparent-background")
 '(mouse-wheel-follow-mouse (quote t))
 '(mouse-wheel-progressive-speed nil)
 '(mouse-wheel-scroll-amount (quote (1 ((shift) . 1))))
 '(multi-term-program "/bin/bash")
 '(mumamo-background-colors nil t)
 '(nav-boring-file-regexps
   (quote
    ("^[.][^.].*$" "^[.]$" "~$" "[.]elc$" "[.]pyc$" "[.]o$" "[.]bak$" "^_MTN$" "^blib$" "^CVS$" "^RCS$" "^SCCS$" "^_darcs$" "^_sgbak$" "^autom4te.cache$" "^cover_db$" "^_build$" "^#.*#$" "^[.]DS_Store")))
 '(nav-width 25)
 '(next-line-add-newlines t)
 '(nodejs-repl-command "node")
 '(org-agenda-files (quote ("~/src/doc/todo/todo.org")))
 '(org-src-preserve-indentation t)
 '(outshine-speed-commands-user nil)
 '(outshine-use-speed-commands t)
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
 '(tab-always-indent t)
 '(tab-width 8)
 '(text-mode-hook (quote (turn-off-auto-fill text-mode-hook-identify)))
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
(menu-hide)


;;; Faces

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

