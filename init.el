;;; init.el --- Emacs Initialization Configuration

;; Copyright (C) 2018 Andreas Marschke

;; Author: Andreas Marschke <emacs@andreas-marschke.name>
;; Created: 24.07.2018
;; Version: 0.1
;; Package-Requires: ((use-package "20180715"))
;; Keywords:
;; URL: https://github.com/andreas-marschke/emacs-config
;;
;;; Commentary:
;; This is my personal Emacs initialization file.
;; It contains most if not all of what I need to work on:
;;  - Java Projects
;;  - Android Projects
;;  - Javascript Projects
;;
;;; Code:

;;; Package Initialization


;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;(package-initialize)

(require 'package)

;;;; Archives

(add-to-list 'package-archives '("elpa" . "http://tromey.com/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))

;;;; Use-Package
(setq use-package-always-ensure t)
(setq use-package-compute-statistics t)
(setq package-selected-packages
      '(outline-minor-mode
        use-package
        gitattributes-mode
        gitconfig-mode
        gitignore-mode
        cedit
        keydef
        less-css-mode
        lorem-ipsum
        memoize
        multi-term
        mvn
        nodejs-repl
        org-make-toc
        org-pdfview
        org-preview-html
        org-projectile
        org-radiobutton
        outorg
        outshine
        ox-gfm
        ox-ioslide
        powershell
        qml-mode
        tagedit
        ack
        htmlize
        less nav paredit cmake-mode which-key s dash f ag crux csv elquery markup-faces websocket whitespace-cleanup-mode web-mode yaml-mode adoc-mode dockerfile-mode protobuf-mode csgo-conf-mode csharp-mode json-mode markdown-mode+ markdown-toc company company-box company-dict company-flow company-lua company-posframe company-quickhelp company-shell company-statistics cask cask-mode edebug-x compact-docstrings flycheck-cask js2-mode indium mocha-snippets js2-highlight-vars js2-refactor xref-js2 json-navigator json-reformat json-snatcher web-mode-edit-element web-completion-data company-web company-glsl mustache-mode coffee-mode web-narrow-mode java-imports java-snippets javadoc-lookup jdecomp kotlin-mode groovy-imports groovy-mode flycheck-kotlin flycheck-gradle swift-mode xcode-mode xcode-project flycheck-objc-clang flycheck-swift flycheck-xcode common-lisp-snippets magit magit-filenotify magit-org-todos magit-popup magit-todos magithub projectile ibuffer-projectile projectile-speedbar ipcalc dirtree with-editor neotree emms emms-info-mediainfo flycheck flycheck-checkbashisms flycheck-css-colorguard flycheck-tip flycheck-inline flycheck-julia flycheck-package flycheck-pkg-config color-theme color-theme-modern color-theme-sanityinc-solarized color-theme-solarized color-theme-sanityinc-tomorrow))

(unless package-archive-contents
  (package-refresh-contents))
;;; Basics
;;;; Emacs Startup/Runtime Configuration

;; Always load newest byte code
(setq load-prefer-newer t)

;; reduce the frequency of garbage collection by making it happen on
;; each 50MB of allocated data (the default is on every 0.76MB)
(setq gc-cons-threshold 50000000)

;; warn when opening files bigger than 100MB
(setq large-file-warning-threshold 100000000)

;;;; Personal Stuff

(setq user-full-name "Andreas Marschke"
      user-mail-address "emacs@andreas-marschke.name")

;; disable the annoying bell ring
(setq ring-bell-function 'ignore)

;; disable startup screen
(setq inhibit-startup-screen t)

;; Static Cursor
(blink-cursor-mode -1)

;; Custom-Set-Variables are Stored here
(setq custom-file "~/.emacs.d/custom-vars.el")
(load custom-file)

;; NO more ~ files
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;;;; UI

;; nice scrolling
(setq scroll-margin 0
      scroll-conservatively 100000
      scroll-preserve-screen-position 1)

;; mode line settings
(line-number-mode t)
(column-number-mode t)
(size-indication-mode t)

;; enable y/n answers
(fset 'yes-or-no-p 'y-or-n-p)

;;;; Editing

;; don't use tabs to indent
(setq-default indent-tabs-mode nil)

;; but maintain correct appearance
(setq-default tab-width 4)

;; delete the selection with a keypress
(delete-selection-mode t)

(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)

;;; Use Packages!

(require 'use-package)

;; (use-package wanderlust
;;   :ensure t
;;   :defines wanderlust
;;   :config
;;   (add-hook 'mime-view-mode-hook #'(lambda () (setq show-trailing-whitespace nil)))
;;   :init
;;   (autoload 'wl "wl" "Wanderlust" t)
;;   :custom
;;   (elmo-imap4-default-server "imap.gmail.com")
;;   (elmo-imap4-default-user "andreas.marschke@gmail.com")
;;   (elmo-imap4-default-authenticate-type 'clear)
;;   (elmo-imap4-default-port '993)
;;   (elmo-imap4-default-stream-type 'ssl)
;;   ;; For non ascii-characters in folder-names
;;   (elmo-imap4-use-modified-utf7 t)

;;   (wl-smtp-connection-type 'starttls)
;;   (wl-smtp-posting-port 587)
;;   (wl-smtp-authenticate-type "plain")
;;   (wl-smtp-posting-user "andreas.marschke")
;;   (wl-smtp-posting-server "smtp.gmail.com")
;;   (wl-local-domain "gmail.coml")
;;   (wl-message-id-domain "smtp.gmail.com")

;;   (wl-from "Andreas Marschke <andreas.marschke@gmail.com>")
;;   (wl-stay-folder-window t)
;;   (wl-message-visible-field-list
;;    '("^\\(To\\|Cc\\):"
;;      "^Subject:"
;;      "^\\(From\\|Reply-To\\):"
;;      "^Organization:"
;;      "^Message-Id:"
;;      "^\\(Posted\\|Date\\):"
;;      ))
;;   (wl-message-sort-field-list
;;    '("^From"
;;      "^Organization:"
;;      "^X-Attribution:"
;;      "^Subject"
;;      "^Date"
;;      "^To"
;;      "^Cc"))
;;   (wl-folder-window-width 25)
;;   ;; All system folders (draft, trash, spam, etc) are placed in the
;;   ;; [Gmail]-folder, except inbox. "%" means it's an IMAP-folder
;;   (wl-default-folder "%inbox")
;;   (wl-draft-folder   "%[Gmail]/Drafts")
;;   (wl-trash-folder   "%[Gmail]/Trash")
;;   ;; The below is not necessary when you send mail through Gmail's SMTP server,
;;   ;; see https://support.google.com/mail/answer/78892?hl=en&rd=1
;;   ;; wl-fcc            "%[Gmail]/Sent"

;;   ;; Mark sent messages as read (sent messages get sent back to you and
;;   ;; placed in the folder specified by wl-fcc)
;;   (wl-fcc-force-as-read t)

;;   ;; For auto-completing foldernames
;;   (wl-default-spec "%"))

;;;; Keyboarding
;; Easy keybind definition
(use-package keydef
  :requires amarschke-util
  :init
  (dolist (key '("\M-k" "\M-l" "\M-j" "\M-i"))
    (global-unset-key key))
  (global-unset-key (kbd "C-x i"))
  :ensure t)

(use-package jdecomp
  :ensure t
  :mode
  ("\\.class\\'" . jdecomp-mode)
  :custom
  (jdecomp-decompiler-paths
   '((cfr . "~/src/dependencies/cfr/cfr_0_132.jar")
    ;;(fernflower . "~/idea-IC-162.1628.40/plugins/java-decompiler/lib/java-decompiler.jar")
    (procyon . "/usr/bin/procyon"))))

;; XXX: If there's more to configure for speedbar then move it out of here.
(use-package speedbar
  :config
  (define-key speedbar-mode-map [(tab)] 'speedbar-toggle-line-expansion))

;;;; Utility Package
(use-package amarschke-util
  :commands
  ;; Navigate one window back (see: `C-h k C-x o')
  other-window-back
  :load-path "~/.emacs.d/site-lisp/")

;; Cool tree UI utility
;; XXX: Should this be replaced by speedbar or helm?
(use-package neotree)

;;;; Libraries

;; Emacs Server Utility used to setup socket for EmacsClient
(require 'server)

;; Directory Utils
(require 'dired-x)

;;;; Documentation Utilities

;;;;; Java
(use-package javadoc-lookup
  :requires
  keydef
  :config
  (keydef "C-h j" 'javadoc-lookup)
  ;; XXX: This may want to be separated if we find an android project? 
  (javadoc-add-roots (concat (getenv "ANDROID_HOME")"/docs/reference")) 
  :ensure t)

(use-package javadoc-lookup-x
  :requires
  javadoc-lookup
  :load-path
  "~/.emacs.d/site-lisp"
  :config
  (javadoc-add-artifacts [com.android.tools.build builder-test-api "0.13.2"])
  ;; XXX: Add this conditionally based on `${rootProject.rootDir}/gradle/wrapper/gradle-wrapper.properties'
  ;;      Should be pointing to the API Docs based on the gradle version found.
  (javadoc-lookup-x/add-web-root "https://docs.gradle.org/current/javadoc")
  (javadoc-lookup-x/add-web-root "https://docs.aws.amazon.com/AWSJavaSDK/latest/javadoc/")
  (javadoc-lookup-x/add-web-root "http://docs.groovy-lang.org/latest/html/api/"))

;;;; Source Control

;; Git interaction
(use-package git
  :ensure t)
;; Build trees for directories
(use-package dirtree
  :ensure t)
;; Ag searching
(use-package ag
  :ensure t)
;; Markup Faces
(use-package markup-faces
  :ensure t
  :after (markdown-mode)
  :custom-face
  (markup-anchor-face ((t (:inherit grey :overline t))))
  (markup-attribute-face ((t (:foreground "purple"))))
  (markup-command-face ((t (:foreground "white" :weight bold))))
  (markup-complex-replacement-face ((t (:background "blue" :foreground "white"))))
  (markup-internal-reference-face ((t (:foreground "green" :weight bold))))
  (markup-list-face ((t (:inherit markup-meta-face :foreground "plum1" :weight bold))))
  (markup-meta-face ((t (:foreground "blue" :weight thin))))
  (markup-table-cell-face ((t (:inherit markup-table-face :background "blue" :foreground "yellow" :weight bold)))))

(use-package cperl-mode
  :ensure t
  :mode
  ("\\.t\\'"
  "\\.pl\\'"))

;;;;; Apps
;; NeoTree Directory Navigation sidebar
(use-package neotree
  :after (dirtree)
  :ensure t)
;; ipcalc
(use-package ipcalc)
;; Search with ack
(use-package ack
  :ensure t)
;; NodeJS REPL
(use-package nodejs-repl
  :ensure t
  :custom
  (nodejs-repl-command "node"))

(use-package outline
  :ensure t
  :bind
  (
   :map outline-minor-mode-map
        ("M-RET" . outshine-insert-heading)
        ("<backtab>" . outshine-cycle-buffer))
  :config
  :requires
  outshine
  :hook
  ((emacs-lisp-mode . outline-minor-mode)
   (outline-minor-mode . outline-easy-bindings-load)
   (outline-minor-mode . outshine-hook-function)))

(use-package compile
  :custom
  (compilation-ask-about-save nil)
  (compilation-buffer-name-function
   (lambda (mode)
      (let ((buffer-tag-name ""))
        (cond
         ((and (projectile-mode) (projectile-project-p))
          (setq buffer-tag-name (projectile-project-name)))
         (t
          (setq buffer-tag-name (file-name-base (directory-file-name default-directory)))))
        (concat buffer-tag-name "/compilation")))))

(defun projectile-neotree-project-dir ()
  "Open NeoTree using the git root."
  (interactive)
  (let ((project-dir (projectile-project-root))
        (file-name (buffer-file-name)))
    (neotree-toggle)
    (if project-dir
        (if (neo-global--window-exists-p)
            (progn
              (neotree-dir project-dir)
              (neotree-find file-name)))
      (message "Could not find git project root."))))

(use-package etags-select
  :ensure t)

(use-package projectile
  :ensure t
  :load-path "~/src/elisp/projectile/"
  :functions projectile-register-project-type
  :custom
  (projectile-globally-ignored-files '(".gradle" "*~" "*/build/" "TAGS" "todo.org" "notes.org" "*.class"))
  (projectile-indexing-method 'native)
  (projectile-enable-caching t)
  (projectile-keymap-prefix (kbd "C-c p"))
  :config
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  (projectile-mode)
  (projectile-register-project-type 'boomerang '("boomerang.js")
                                    :compile "grunt --no-color lint"
                                    :test "grunt --no-color lint"
                                    :run "grunt --no-color test:debug")

  (projectile-register-project-type 'boomerang-express '("package.json" "index.js" "Gruntfile.js" ".eslintrc" "tests" "TODO.org")
                                    :run "grunt run"
                                    :test "grunt test"
                                    :compile "grunt lint")
  (global-set-key [f8] 'projectile-neotree-project-dir))

(use-package outshine
  :ensure t)

(use-package highlight-indent-guides
  :ensure t
  :custom
  (highlight-indent-guides-method 'character)
  (highlight-indent-guides-character ?\|)
  :config
  (highlight-indent-guides-mode)
  :hook
  (prog-mode . highlight-indent-guides-mode))

;;;;; Utilities
;; Window configuration
(use-package windata)
;; Tree Widget Management
(use-package tree-mode)
;; info(1) support
(use-package info)
;; Mode Sensitive Info lookup
(use-package info-look
  :after (info))
;; Emacs Lisp documentation
(use-package eldoc
  :ensure t
  :requires (info info-look))

(use-package multi-term
  :ensure t
  :bind ("C-x t" . multi-term)
  :custom
  (multi-term-program "/bin/bash"))
;;;;; Developer Productivity
;;


(use-package flycheck-inline
  :config
  (flycheck-inline-mode)
  :ensure t)

(use-package flycheck-cask
  :ensure t
  :hook
  (flycheck-mode . flycheck-cask-setup))

(use-package flycheck-checkbashisms
  :ensure t
  :hook
  (flycheck-mode . flycheck-checkbashisms-setup))

(use-package flycheck-css-colorguard
  :ensure t
  :hook
  (flycheck-mode . flycheck-css-colorguard-setup))

(use-package flycheck-swift
  :ensure t
  :hook
  (flycheck-mode . flycheck-swift-setup))

(use-package flycheck-gradle
  :ensure t
  :hook
  (flycheck-mode . flycheck-gradle-setup))

(use-package flycheck-kotlin
  :ensure t
  :hook
  (flycheck-mode . flycheck-kotlin-setup))

(use-package flycheck-objc-clang
  :ensure t
  :hook
  (flycheck-mode . flycheck-objc-clang-setup))

(use-package flycheck
  :requires
  flycheck-inline
  flycheck-posframe
  flycheck-cask
  flycheck-gradle
  flycheck-checkbashisms
  flycheck-css-colorguard
  flycheck-gradle
  flycheck-kotlin
  flycheck-objc-clang
  flycheck-swift
  :hook
  (prog-mode . flycheck-mode)
  (lisp-mode . flycheck-mode)
  (emacs-lisp-mode . flycheck-mode)
  (xml-mode . flycheck-mode)
  (groovy-mode . flycheck-mode)
  :custom-face
  (flycheck-android-lint-severity-fatal-face ((t (:underline "DarkOrange2"))))
  (flycheck-android-lint-severity-information-face ((t (:stipple nil :underline "DarkOliveGreen2"))))
  :custom
  (flycheck-checkers
   '(cask
     checkbashisms
     css-colorguard
     css-stylelint
     emacs-lisp
     emacs-lisp-checkdoc
     gradle
     groovy
     javascript-eslint
     json-jsonlint
     kotlin
     less
     less-stylelint
     markdown-mdl
     nix
     objc-clang
     perl
     perl-perlcritic
     rpm-rpmlint
     sh-bash
     sh-posix-bash
     sh-posix-dash
     sh-shellcheck
     sql-sqlint
     swift
     systemd-analyze
     tex-chktex
     tex-lacheck
     texinfo
     xml-xmllint
     xml-xmlstarlet
     yaml-jsyaml
     css-csslint))
  (flycheck-emacs-lisp-load-path "inherit"))

;; TODO: Can you use eldoc?
(require 'eldoc)
(add-hook 'emacs-lisp-mode-hook #'eldoc-mode)

(use-package hl-line
  :config
  (global-hl-line-mode)
  :ensure t)

(use-package hl-todo
  :custom
  (global-hl-todo-mode t)
  :ensure t
  :hook
  (groovy-mode . hl-todo-mode))

(use-package highlight-numbers
  :ensure t
  :hook
  (prog-mode . highlight-numbers-mode))

;; Access Android Logcat
(use-package logcat
  :load-path "~/src/elisp/logcat-mode"
  :config
  (defun emacs-rc/logcat-mode-clear-logcat ()
    "Calls logcats clear option to clear the logcat buffer and restarts collection of logs in a new buffer"
    (interactive)
    (let ((buffer-read-only nil)
          (logcat-clear-command (concat logcat-fb-adb-program logcat-fb-adb-arguments "logcat" " " "-c")))
      (logcat-stop)
      (erase-buffer)
      (let ((logcat-clear-call-return (shell-command-to-string logcat-clear-command)))
        (if (not (string-equal logcat-clear-call-return ""))
            (error (format "An Error occured clearing logcats buffer: %s" logcat-clear-call-return))))
      (logcat)
      (setq buffer-read-only t)))
  ;; Add C-x C-g as clearing console
  (define-key logcat-mode-map [(control x) (control g)] 'emacs-rc/logcat-mode-clear-logcat)
  :custom
  ;;(logcat-default-fields '(time pid priority tag message))
 ;; (logcat-display-style 'brief)
  (logcat-fb-adb-program "/opt/android-sdk/platform-tools/adb"))

;; Java Process Debugging
(use-package jdibug
  :load-path "~/.emacs.d/elisp/jdibug/build/jdibug-0.7/"
  :custom-face
  (jdibug-breakpoint-disabled ((t (:background "green" :foreground "black"))))
  (jdibug-breakpoint-enabled ((t (:background "red" :foreground "white"))))
  (jdibug-breakpoint-unresolved ((t (:background "yellow" :foreground "black"))))
  (jdibug-current-frame ((t (:background "blue" :foreground "white"))))
  (jdibug-current-line ((t (:background "black" :foreground "red"))))
  :custom
  (jdibug-connect-hosts '("127.0.0.1:6001")))

(use-package kotlin-mode
  :config
  (add-to-list 'compilation-error-regexp-alist '("^\\(:?\\w+\\)?\\(e\\|w\\|i\\|d\\):\s+\\([a-z/\s-.]+\\):\s+(\\([0-9]*\\),\s+\\([0-9]*\\)):\s+\\(.*\\)\\'" 2 3 4 1))
  :custom
  (kotlin-tab-width 2)
  :mode
  "\\.kt\\'"
  :ensure t)

;; JDEE
(use-package jdee
  :requires memoize
  :init
  :custom
  (bsh-jar "/usr/share/java/bsh.jar")
  (jdee-flycheck-enable-p nil)
  (jdee-server-dir "~/.emacs.d/elisp/jdee-server/target")
  :config
  ;; Adds some highlighting for compile-mode lines that designate an exception or compilation issue
  ;; We can use this to navigate our code for errornous lines if the compiler fails.

  ;; ^\\(?:\s+\\)?\\(?:[:a-zA-Z]+\\)? == Standard Prefix for gradle Builds:
  ;; eg:
  ;; ```
  ;; :compileDebugKotline: ...
  ;; e: ...
  ;; Each element is :
  ;;(REGEXP FILE [LINE COLUMN TYPE HYPERLINK HIGHLIGHT...])
  (add-to-list 'compilation-error-regexp-alist '("^\\(?:\s+\\)?\\(?:[:a-zA-Z]+\\)? \\[\\(WARN\\|ERROR\\|INFO\\)] \\(.*\\):\\([0-9]*\\):\\([0-9]*\\): .*" 2 3))
  (add-to-list 'compilation-error-regexp-alist '("^\\(?:\s+\\)?\\(?:[:a-zA-Z]+\\)? \\[\\(WARN\\|ERROR\\|INFO\\)] \\(.*\.java\\):\\([0-9]*\\): .*" 2 3))
  (add-to-list 'compilation-error-regexp-alist '("^\\(?:\s+\\)?\\(?:[:a-zA-Z]+\\)?\\(.*\\.aj\\|.*\\.java\\): line \\([0-9]*\\), col \\([0-9]*\\), \\(Error\\|Warning\\) - \\(.*\\)\\'" 1 2 3))
  (add-to-list 'compilation-error-regexp-alist '("^\\(?:\s+\\)?\\(?:[:a-zA-Z]+\\)?\\(/.*\\.aj\\|/.*\\.java\\):\\([0-9]*\\): \\(error\\):\\(.*\\)" 1 2 3))
  (add-to-list 'compilation-error-regexp-alist '("^\\(?:\s+\\)?\\(?:[:a-zA-Z]+\\)?\\(/.*\\.aj\\|/.*\\.java\\):\\([0-9]*\\): \\(error\\):.*" 1 2 3))
  (add-to-list 'compilation-error-regexp-alist '("^\\(?:\s+\\)?\\(?:[:a-zA-Z]+\\)?\\(?:\\w*:\s*\\|\\)\\(.*\\):\\([0-9]+\\)\s+\\[\\(\\w*\\)\\]\s+.*\s*\\(?:\\([.*]\\)\\|\\)\\'" 1 2 3))
  ;; This is here because javac STDERR isn't \n'ed on output in Gradle :(
  (add-to-list 'compilation-error-regexp-alist '("^\\(?:[:a-zA-Z0-9-]*\\)\\(/.*\\):\\([0-9]*\\):\\(.*\\)" 1 2 nil))
  (add-to-list 'compilation-error-regexp-alist '("^\\(?:[a-zA-Z0-9-:]*\\)?\\[ant:checkstyle\\] \\[\\(WARN\\|ERROR\\)\\] \\(.*\\):\\([0-9]*\\):\\([0-9]*\\):.*\\[.*\\]$" 2 3 4))
  ;;; Link to currently running test JUnit
  ;;(add-to-list 'compilation-error-regexp-alist '())
  (add-to-list 'compilation-error-regexp-alist '("^Merging result:\s*\\(.*\\)$" 1 nil nil 0))
  (add-to-list 'compilation-error-regexp-alist '("^[0-9]*\s*\\(-->\\(.*\\):\\([0-9]*\\):\\([0-9]*\\)-\\([0-9]*\\).*\\|\\)$" 2 3 4 0))
  :requires
  projectile
  :ensure t)
(add-to-list 'auto-mode-alist '("\\.aj\\'" . jdee-mode))
(use-package memoize
  :ensure t)

;;; Completion
(use-package company
  :ensure t
  :config
  (global-company-mode t)
  :custom-face
  (company-preview ((t (:background "RoyalBlue4" :foreground "gray97"))))
  (company-preview-search ((t (:inherit company-preview :foreground "light green"))))
  (company-template-field ((t (:background "cyan4" :foreground "yellow3"))))
  (company-tooltip ((t (:background "grey20" :foreground "white"))))
  :custom
  (global-company-mode t)
  (company-abort-manual-when-too-short t)
  (company-auto-complete t)
  (company-auto-complete-chars '(32 95 40 41 119 46 34 36 39 124))
  (company-backends
   '(company-css
     company-semantic
     company-dict
     company-clang
     company-xcode
     company-cmake
     
     ;;company-capf
     company-files
     (company-gtags
      company-etags
      company-keywords
      company-dabbrev-code)
     company-elisp
     company-tempo))
  (company-frontends
    '(company-pseudo-tooltip-unless-just-one-frontend
      company-echo-metadata-frontend
      company-preview-if-just-one-frontend))
  (company-mode 1 t)
  (company-show-numbers t)
  (company-tooltip-flip-when-above t)
  (company-tooltip-idle-delay nil)
  (company-tooltip-margin 2)
  (company-tooltip-offset-display 'lines)
  (company-transformers '(company-sort-by-backend-importance))
  (company-xcode-types
   '("Category"
     "Class"
     "Class Method"
     "Class Variable"
     "Constant"
     "Enum"
     "Field"
     "Instance Method"
     "Instance Variable"
     "Macro"
     "Modeled Class"
     "Modeled Method"
     "Modeled Property"
     "Property"
     "Protocol"
     "Structure"
     "Type"
     "Union"
     "Variable"
     "Function")))

(use-package company-posframe
  :ensure t
  :custom
  (company-posframe-mode 1))

(use-package company-dict
  :ensure t
  :custom
  (company-dict-minor-mode-list '(yas-minor-mode))
  (company-dict-dir (concat user-emacs-directory "company-dict/"))
  :config
  (add-to-list 'company-backends 'company-dict))

(use-package company-quickhelp
  :ensure t
  :after company
  :hook
  (after-init-hook . company-quickhelp-mode))

(use-package company-box
  :custom
  (company-box-enable-icon nil)
  (company-box-color-icon t)
  :hook (company-mode . company-box-mode)
  :ensure t)

(use-package company-statistics
  :ensure t
  :functions company-statistics--init
  :hook
  (after-init . company-statistics-mode)
  :after (company))

;;;; Source Control

(use-package magithub
  :ensure t
  :after magit)

(use-package magit
  :ensure t
  :requires keydef
  :config
  (keydef "C-c m" 'magit-status))

(use-package magit-filenotify
  :ensure t
  :after (magit)
  :commands
  magit-after-save-refresh-status
  :hook
  (after-save . magit-after-save-refresh-status))

(use-package magit-org-todos
  :ensure t
  :after magit
  :config
  (magit-org-todos-autoinsert))

;; TODO: Implement scanner reducing to source only
;; (use-package magit-todos
;;   :after magit
;;   :ensure t
;;   :custom
;;   (magit-todos-scanner "git grep"))

;;;; Javascript

(use-package json-mode
  :ensure t
  :mode
  "\\.json\\'")

;; TODO: check `interpreter-mode-alist'
(use-package js2-mode
  :ensure t
  :defines js2-init-hook
  :custom
  (js-indent-level 2)
  (js2-bounce-indent-p nil)
  (js2-concat-multiline-strings nil)
  (js2-highlight-level 3)
  (js2-include-jslint-globals t)
  (js2-include-node-externs t)
  (js2-indent-level 2 t)
  (js2-mode-assume-strict t)
  (js2-skip-preprocessor-directives t)
  :config
  (add-to-list 'compilation-error-regexp-alist '("^\s*[exec]\s*at\s\\(.*\\):\\(\d*\\):\\(\d*\\)" 1 2 3))
  (add-to-list 'compilation-error-regexp-alist '("^\\(.*\\): line \\([0-9]*\\), col \\([0-9]*\\), \\(Error\\|Warning\\) - \\(.*\\)\\'" 1 2 3))
  (add-to-list 'compilation-error-regexp-alist '("^\s*at\s+\\([[:alnum:]<>. _]+\\)(\\([[:alnum:]/._-]+\\):\\([[:digit:]]+\\):\\([[:digit:]]+\\))" nil 1 2 3))
  (add-to-list 'compilation-error-regexp-alist '("^(\w+)$\n^\s*\\([0-9]*\\):\\([0-9]*\\)\s*error\s*\\(.*\\)" 1 2 3))
  (define-key js2-mode-map (kbd "TAB")
    (lambda()
      (interactive)
      (let ((yas/fallback-behavior 'return-nil))
        (unless (yas/expand)
          (indent-for-tab-command)
          (if (looking-back "^\s*" nil)
              (back-to-indentation))))))
  :custom-face
  (js2-object-property ((t (:foreground "LightSalmon3"))))
  (js2-function-call ((t (:underline t))))
  :mode
  "\\.js\\'"
  :ensure t)

(use-package web-mode
  :ensure t
  :mode
  ("\\.html\\'"
   "\\.nunjucks\\'"
   "\\.php\\'"
   "\\.jsx\\'")
  :custom-face
  (web-mode-doctype-face ((t (:distant-foreground "#ff" :foreground "#ff"))))
  (web-mode-current-element-highlight-face ((t (:foreground "#ff" :underline t))))
  :custom
  (web-mode-attr-value-indent-offset nil)
  (web-mode-enable-auto-closing t)
  (web-mode-enable-auto-pairing t)
  (web-mode-enable-auto-quoting t)
  (web-mode-enable-current-column-highlight nil)
  (web-mode-enable-current-element-highlight t)
  (web-mode-enable-element-tag-fontification t)
  (web-mode-enable-html-entities-fontification t)
  (web-mode-indent-style 2)
  (web-mode-markup-indent-offset 2)
  (web-mode-script-padding 0)
  (web-mode-attr-value-indent-offset nil))

(use-package glsl-mode
  :ensure t)

(use-package emms
  :custom
  (emms-info-functions '(emms-info-libtag))
  (emms-source-file-default-directory "~/share/audio/kemp/")
  (emms-player-list '(emms-player-mpg321
                     emms-player-ogg123
                     emms-player-mplayer))
  :config
  (require 'emms-setup)
  (require 'emms-player-mplayer)
  (require 'emms-info-libtag)
  (define-emms-simple-player mplayer '(file url)
    (regexp-opt '(".ogg" ".mp3" ".wav" ".mpg" ".mpeg" ".wmv" ".wma"
                  ".mov" ".avi" ".divx" ".ogm" ".asf" ".mkv" "http://" "mms://"
                  ".rm" ".rmvb" ".mp4" ".flac" ".vob" ".m4a" ".flv" ".ogv" ".pls"))
    "mplayer" "-slave" "-quiet" "-really-quiet" "-fullscreen")
  (emms-all)
  (emms-default-players))

(use-package css-mode
  :custom
  (css-indent-offset 2)
  (cssm-indent-level 1))

(use-package less-css-mode
  :ensure t
  :init
  (add-to-list 'auto-mode-alist '("\\.\\(less\\)\\'" . less-css-mode))
  :after (css-mode))

(use-package semantic
  :hook
  (prog-mode . semantic-mode)
  :custom
  (senator-highlight-found t)
  (senator-step-at-start-end-tag-classes nil)
  (global-semantic-decoration-mode t)
  (global-semantic-highlight-edits-mode nil)
  (global-semantic-highlight-func-mode t)
  (global-semantic-idle-breadcrumbs-mode t nil (semantic/idle))
  (global-semantic-idle-completions-mode t nil (semantic/idle))
  (global-semantic-idle-local-symbol-highlight-mode t nil (semantic/idle))
  (global-semantic-idle-summary-mode t)
  (global-semantic-mru-bookmark-mode t)
  (global-semantic-show-parser-state-mode t)
  (global-semantic-show-unmatched-syntax-mode nil)
  (global-semantic-stickyfunc-mode t)
  (semantic-analyze-summary-function 'semantic-format-tag-short-doc)
  (semantic-complete-inline-analyzer-displayor-class 'semantic-displayor-tooltip)
  (semantic-complete-inline-analyzer-idle-displayor-class 'semantic-displayor-tooltip)
  ;; TODO: nil, necessary or bad face vals?
  (semantic-decoration-mode nil)
  (semantic-decoration-styles
    '(("semantic-decoration-on-includes")
      ("semantic-decoration-on-protected-members")
      ("semantic-decoration-on-private-members")
      ("semantic-tag-boundary")))
  (semantic-default-submodes
   '(global-semantic-idle-completions-mode
     global-semantic-idle-scheduler-mode
     global-semanticdb-minor-mode
     global-semantic-idle-summary-mode
     global-semantic-idle-local-symbol-highlight-mode))
  (semantic-displayor-tooltip-mode 'verbose)
  (semantic-mode-line-prefix "SEM" nil (semantic/util-modes))
  (semantic-sb-autoexpand-length 2)
  (semantic-show-unmatched-syntax-mode nil t))

;;;; Snippets
(use-package yasnippet
  :ensure t
  :hook
  (prog-mode . yas-minor-mode)
  :custom
  ;; XXX: Are there inline overlays for what's being attempted here?
  (yas-prompt-functions '(yas-dropdown-prompt yas-completing-prompt yas-no-prompt))
  :config
  (add-to-list 'yas-snippet-dirs "~/.emacs.d/snippets/")
  (yas-reload-all))

;;;;; Syntax Highlighting Modes

;; Nagios configuration files
(use-package nagios-mode
  :load-path "~/.emacs.d/elisp/nagios-mode/")

;; IOS Configuration
(use-package ios-config-mode
  :mode
  "\\.ios-cfg\\'"
  :load-path "~/.emacs.d/elisp/ios-config-mode")

;; edebug-extensions
(use-package edebug-x
  :requires edebug
  :functions edebug-x-mode
  :load-path "~/src/elisp/edebug-x/"
  :ensure t
  :hook
  (edebug-mode . edebug-x-mode))

;; cask project file highlighting
(use-package cask-mode
  :ensure t
  :mode
  "Cask\\'")

;; Proguard Android files
(use-package proguard-mode
  :load-path "~/.emacs.d/elisp/proguard-mode"
  :mode
  ("proguard-.*\\.txt\\'"
   "proguard-rules\\.pro\\'"
   "\\.pro\\'"))

(use-package groovy-mode
  :ensure t
  :config
  (add-to-list 'compilation-error-regexp-alist '("^Script '\\(.*\\)' line: \\([0-9]*\\)$" 1 2))
  (add-to-list 'compilation-error-regexp-alist '("^Build file '\\(.*\\)' line: \\([0-9]*\\)$" 1 2))
  :mode
  ("\\.gradle\\'"
   "\\.groovy\\'")
  :custom
  (groovy-indent-offset 2))

(use-package adoc-mode
  :ensure t
  :mode "\\.adoc\\'")

(use-package markdown-mode
  :ensure t
  :init
  :mode
  "\\.\\(mdwn\\|markdown\\|md\\)\\'")

(use-package whitespace
  :functions
  whitespace-mode
  whitespace-cleanup
  :custom
  (global-whitespace-newline-mode nil)
  ;;(whitespace-modes '(awk-mode))
  ;;:hook(prog-mode . whitespace-mode)
  :custom-face
  (whitespace-empty ((t (:foreground "DodgerBlue4"))))
  (whitespace-indentation ((t (:foreground "DodgerBlue4"))))
  (whitespace-line ((t nil)))
  (whitespace-space ((t (:foreground "DodgerBlue4"))))
  (whitespace-newline ((t (:foreground "dark slate gray"))))
  (whitespace-space-after-tab ((t (:foreground "DodgerBlue2"))))
  (whitespace-space-before-tab ((t (:background "DodgerBlue2" :foreground "blue")))))

(use-package compile
  :custom
  (compilation-scroll-output t))

(add-to-list 'auto-mode-alist '("\\(\\.\\|\\)bashrc\\'" . sh-mode))
(add-to-list 'auto-mode-alist '("\\(\\.\\|\\)bash_.*\\'" . sh-mode))
(add-to-list 'auto-mode-alist '("\\.sh\\'" . sh-mode))
(add-hook 'sh-set-shell-hook 'sh-learn-buffer-indent)

(use-package conf-mode
  :ensure t
  :functions conf-unix-mode
  :mode
  (("\\.screenrc\\'" . conf-mode)
  ("Doxyfile\\'" . conf-mode)
  ("\\.editorconfig\\'" . conf-unix-mode)))

(use-package gitignore-mode
  :mode
  ("\\.?gitignore\\'"
   "\\.?gitignore_global\\'"))

(use-package cc-mode
  :custom
  (c-basic-offset '2)
  (c-default-style '((java-mode . "gnu")))
  (c-insert-tab-function 'insert-tab)
  (c-offsets-alist
   '((inline-open . 0)
     (inline-close . 0)
     (block-open . 0)
     (block-close . 0)
     (topmost-intro . 0)
     (inclass . +)
     (member-init-intro . +)
     (substatement-open . 0)
     (statement-block-intro . +)
     (func-decl-cont . 0)
     (defun-block-intro . +)
     (c-lineup-C-comments . 1))))

(use-package tagedit
  :defines tagedit-add-paredit-like-keybindings
  :hook
  ((web-mode . tagedit-mode)
   (xml-mode . tagedit-mode))
  :config
  (tagedit-add-paredit-like-keybindings))

(use-package org
  :functions org-mode
  :mode
  ("\\.org\\'" . org-mode)
  :custom
  (org-agenda-files nil)
  (org-highlight-latex-and-related '(latex script entities))
  (org-priority-faces nil)
  (org-agenda-files '("~/src/doc/todo.org"))
  (org-src-preserve-indentation t)
  (org-todo-keyword-faces
    '(("TODO" . "red")
      ("WORKING" . "yellow")
      ("CANCELED" . "blue")
      ("PENDING" . "orange")
      ("DONE" . "green"))))

(use-package erc
  :ensure t
  :custom
  (erc-auto-query 'bury)
  (erc-autojoin-channels-alist '(("freenode.net" "")))
  (erc-fill-mode t)
  (erc-hide-list '("JOIN" "PART" "QUIT"))
  (erc-interpret-mirc-color t)
  (erc-irccontrols-mode t)
  (erc-kill-buffer-on-part t)
  (erc-kill-queries-on-quit t)
  (erc-kill-server-buffer-on-quit t)
  (erc-list-mode t)
  (erc-match-mode t)
  (erc-menu-mode nil)
  (erc-move-to-prompt-mode t)
  (erc-netsplit-mode t)
  (erc-networks-mode t)
  (erc-nick "amarschke")
  (erc-noncommands-mode t)
  (erc-pcomplete-mode t)
  (erc-readonly-mode t)
  (erc-ring-mode t)
  (erc-stamp-mode t)
  (erc-track-minor-mode t)
  (erc-track-mode t))

(use-package rainbow-delimiters
  :custom-face
  (rainbow-delimiters-depth-2-face ((t (:foreground "pink3"))))
  (rainbow-delimiters-depth-7-face ((t (:foreground "PaleGreen3"))))
  :config
  (show-paren-mode)
  :hook
  (emacs-lisp-mode . rainbow-delimiters-mode)
  :ensure t)

(use-package helm
  :ensure t)

(use-package helm-projectile
  :ensure t)

(setq auto-compression-mode t)
(setq auto-fill-mode nil)
(setq browse-url-browser-function 'browse-url-default-browser)

(setq column-number-mode t)

(use-package cua-base
  :init (cua-mode 1)
  :config
  (progn
    (setq cua-enable-cua-keys t)
    (setq cua-toggle-set-mark t)))

(use-package ido
  :functions ido-mode
  :ensure t
  :custom
  (ido-mode 'buffer nil (ido)))

(setq current-fill-column 240)

(add-to-list  'Info-directory-list "~/.emacs.d/info")
(add-to-list  'Info-directory-list "/usr/share/info")

(use-package color-theme-sanityinc-solarized
  :functions color-theme-sanityinc-solarized
  :ensure t)

(use-package color-theme
  :ensure t
  :requires
   color-theme-sanityinc-solarized
  :init
  (progn
    (defun menu-hide()
      "Called from init.el to hide menu when in termninal"
      (interactive)
      (dolist (m '(menu-bar-mode scroll-bar-mode blink-cursor-mode tool-bar-mode))
        (if (boundp m)
            (funcall m -1))))
    (menu-hide))
  :custom
  ;;(custom-enabled-themes '(color-theme-sanityinc-solarized-dark))
  (custom-safe-themes
   '("4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" default)))

(when (not (eq window-system nil))
  (load-theme 'sanityinc-solarized-dark))

(require 'ansi-color)
(defun my/ansi-colorize-buffer ()
  "Try to work around issues with node term coloring."
  (let ((buffer-read-only nil))
    (ansi-color-apply-on-region (point-min) (point-max))))
(add-hook 'compilation-filter-hook 'my/ansi-colorize-buffer)

;; Objc
;; Any .h file that defines an @interface is objc-mode instead of c-mode.
(add-to-list 'magic-mode-alist
             `(,(lambda ()
                  (unless (not buffer-file-name)
                    (and (string= (file-name-extension buffer-file-name) "h")
                       (re-search-forward "@\\<interface\\>"
                                          magic-mode-regexp-match-limit t))))
               . objc-mode))

;; The problem is that cc-other-file-alist doesn’t know about Obj-C++ (.mm)
;; files, and doesn’t know that .h files can be headers for .m and .mm files.
;; To fix that:
(require 'find-file) ;; for the "cc-other-file-alist" variable
(nconc (cadr (assoc "\\.h\\'" cc-other-file-alist)) '(".m" ".mm"))

;; The bigger problem is that the header-search algorithm doesn’t
;; understand frameworks. So, <sys/types> properly finds /usr/include/sys/types,
;; but <Foundation/Foundation.h> fails.
;; To fix that:
(defadvice ff-get-file-name (around ff-get-file-name-framework
                    (search-dirs
                     fname-stub
                     &optional suffix-list))
  "Search for Mac framework headers as well as POSIX headers."
  (or
   (if (string-match "\\(.*?\\)/\\(.*\\)" fname-stub)
       (let* ((framework (match-string 1 fname-stub))
              (header (match-string 2 fname-stub))
              (fname-stub (concat framework ".framework/Headers/" header)))
         ad-do-it))
   ad-do-it))
(ad-enable-advice 'ff-get-file-name 'around 'ff-get-file-name-framework)
(ad-activate 'ff-get-file-name)

(setq cc-search-directories
      '("."
        "../include"
        "/usr/include"
       "/usr/local/include/*"
        "/System/Library/Frameworks"
        "/Library/Frameworks"))


(server-start)

(require 'keydef)
(require 'flycheck)

(defun init-file ()
  "Find-file `~/.emacs.d/init.el'."
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(defun describe-face-under-hl ()
  "Describe font at point under hl-line.

This fixes a common problem with hl-line minor mode where
it will be detected as the face of the current point by
default instead of the face of the text under the `(point)'.

This function resolves that problem."
  (interactive)
  (let ((properties (text-properties-at (point)))
        (prop-face (get-text-property (point) 'face)))
    (message (format "Properties: %s , car: %s, fontified: %s" properties (car properties) (get-text-property (point) 'face)))
    (if (facep prop-face)
        (describe-face prop-face)
      (describe-face 'default))))

(keydef "C-c C-f" 'describe-face-under-hl)
(keydef "C-x t" (multi-term))
(keydef "C-c <up>" (enlarge-window 5))
(keydef "C-c <down>" (enlarge-window -5))
(keydef "C-c <left>" (enlarge-window 5 t))
(keydef "C-c <right>" (enlarge-window -5 t))
(keydef "C-x o" 'other-window)
(keydef "C-x p" 'other-window-back)
(keydef "M-i" 'indent-region)
(keydef "C-c C-o" 'browse-url-at-point)
;;(keydef "F9" 'sr-speedbar-open)
(use-package sr-speedbar
  :custom
  (sr-speedbar-right-side nil)
  :ensure t)

(global-set-key [f9] 'sr-speedbar-toggle)

(setq font-lock-maximum-decoration
      '((js-mode . t)
        (compilation-mode . 1)
        (prog-mode . t)))

;;; Font-locking in compile-mode is not performing well with large outputs
(add-hook 'compilation-mode-hook (lambda() (font-lock-mode 1)))
(add-hook 'ag-mode-hook (lambda() (font-lock-mode 1)))
(add-hook 'compilation-finish-functions (lambda (buffer msg) (font-lock-mode 1)))
(provide 'init)

;;; this file ends here ---
