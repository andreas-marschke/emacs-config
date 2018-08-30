(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(c-basic-offset 2)
 '(c-default-style '((java-mode . "gnu")))
 '(c-insert-tab-function 'insert-tab)
 '(c-offsets-alist
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
     (c-lineup-C-comments . 1)))
 '(company-abort-manual-when-too-short t)
 '(company-auto-complete t)
 '(company-auto-complete-chars '(32 95 40 41 119 46 34 36 39 124))
 '(company-backends
   '(company-css company-semantic company-dict company-clang company-xcode company-cmake company-files
                 (company-gtags company-etags company-keywords company-dabbrev-code)
                 company-elisp company-tempo))
 '(company-box-color-icon t)
 '(company-box-enable-icon nil)
 '(company-dict-dir "~/.emacs.d/company-dict/")
 '(company-dict-minor-mode-list '(yas-minor-mode))
 '(company-frontends
   '(company-pseudo-tooltip-unless-just-one-frontend company-echo-metadata-frontend company-preview-if-just-one-frontend))
 '(company-mode 1 t)
 '(company-posframe-mode 1 nil (company-posframe))
 '(company-show-numbers t)
 '(company-tooltip-flip-when-above t)
 '(company-tooltip-idle-delay nil)
 '(company-tooltip-margin 2)
 '(company-tooltip-offset-display 'lines)
 '(company-transformers '(company-sort-by-backend-importance))
 '(company-xcode-types
   '("Category" "Class" "Class Method" "Class Variable" "Constant" "Enum" "Field" "Instance Method" "Instance Variable" "Macro" "Modeled Class" "Modeled Method" "Modeled Property" "Property" "Protocol" "Structure" "Type" "Union" "Variable" "Function"))
 '(compilation-ask-about-save nil)
 '(compilation-buffer-name-function
   '(lambda
      (mode)
      (let
          ((buffer-tag-name ""))
        (cond
         ((and
           (projectile-mode)
           (projectile-project-p))
          (setq buffer-tag-name
                (projectile-project-name)))
         (t
          (setq buffer-tag-name
                (file-name-base
                 (directory-file-name default-directory)))))
        (concat buffer-tag-name "/compilation"))) t)
 '(compilation-scroll-output t)
 '(css-indent-offset 2)
 '(cssm-indent-level 1 t)
 '(emms-info-functions '(emms-info-libtag))
 '(emms-player-list
   '(emms-player-mpg321 emms-player-ogg123 emms-player-mplayer))
 '(emms-source-file-default-directory "~/share/audio/kemp/")
 '(erc-auto-query 'bury)
 '(erc-autojoin-channels-alist '(("freenode.net" "")) t)
 '(erc-fill-mode t t)
 '(erc-hide-list '("JOIN" "PART" "QUIT"))
 '(erc-interpret-mirc-color t)
 '(erc-irccontrols-mode t)
 '(erc-kill-buffer-on-part t)
 '(erc-kill-queries-on-quit t)
 '(erc-kill-server-buffer-on-quit t)
 '(erc-list-mode t t)
 '(erc-match-mode t t)
 '(erc-menu-mode nil t)
 '(erc-move-to-prompt-mode t)
 '(erc-netsplit-mode t t)
 '(erc-networks-mode t t)
 '(erc-nick "amarschke")
 '(erc-noncommands-mode t)
 '(erc-pcomplete-mode t t)
 '(erc-readonly-mode t)
 '(erc-ring-mode t t)
 '(erc-stamp-mode t t)
 '(erc-track-minor-mode t)
 '(erc-track-mode t t)
 '(global-company-mode t)
 '(global-hl-todo-mode t)
 '(global-semantic-decoration-mode t)
 '(global-semantic-highlight-edits-mode nil)
 '(global-semantic-highlight-func-mode t)
 '(global-semantic-idle-breadcrumbs-mode t nil (semantic/idle))
 '(global-semantic-idle-completions-mode t nil (semantic/idle))
 '(global-semantic-idle-local-symbol-highlight-mode t nil (semantic/idle))
 '(global-semantic-idle-summary-mode t)
 '(global-semantic-mru-bookmark-mode t)
 '(global-semantic-show-parser-state-mode t)
 '(global-semantic-show-unmatched-syntax-mode nil)
 '(global-semantic-stickyfunc-mode t)
 '(global-whitespace-newline-mode nil)
 '(groovy-indent-offset 2)
 '(highlight-indent-guides-character 124)
 '(highlight-indent-guides-method 'character)
 '(ido-mode 'buffer nil (ido))
 '(jdecomp-decompiler-paths
   '((cfr . "~/src/dependencies/cfr/cfr_0_132.jar")
     (procyon . "/usr/bin/procyon")) t)
 '(jdibug-connect-hosts '("127.0.0.1:6001"))
 '(js-indent-level 2 t)
 '(js2-bounce-indent-p nil t)
 '(js2-concat-multiline-strings nil t)
 '(js2-highlight-level 3 t)
 '(js2-include-jslint-globals t t)
 '(js2-include-node-externs t t)
 '(js2-indent-level 2 t)
 '(js2-mode-assume-strict t t)
 '(js2-skip-preprocessor-directives t t)
 '(kotlin-tab-width 2 t)
 '(logcat-default-fields '(time pid priority tag message))
 '(logcat-display-style 'brief)
 '(logcat-fb-adb-program "/opt/android-sdk/platform-tools/adb")
 '(multi-term-program "/bin/bash" t)
 '(neo-window-fixed-size nil)
 '(neo-window-width 35)
 '(nodejs-repl-command "node")
 '(org-agenda-files '("~/src/doc/todo.org"))
 '(org-highlight-latex-and-related '(latex script entities))
 '(org-priority-faces nil)
 '(org-src-preserve-indentation t)
 '(org-todo-keyword-faces
   '(("TODO" . "red")
     ("WORKING" . "yellow")
     ("CANCELED" . "blue")
     ("PENDING" . "orange")
     ("DONE" . "green")))
 '(package-selected-packages
   '(helm helm-dash helm-directory helm-flycheck helm-frame helm-projectile helm-ebdb etags-select sr-speedbar kotlin wanderlust jdee java pcre2el jdecompile ## logview rainbow-delimiters markdown-mode yasnippet glsl-mode outline-minor-mode use-package gitattributes-mode gitconfig-mode gitignore-mode cedit keydef less-css-mode lorem-ipsum memoize multi-term mvn nodejs-repl org-make-toc org-pdfview org-preview-html org-projectile org-radiobutton outorg outshine ox-gfm ox-ioslide powershell qml-mode tagedit ack htmlize less nav paredit cmake-mode which-key s dash f ag crux csv elquery markup-faces websocket whitespace-cleanup-mode web-mode yaml-mode adoc-mode dockerfile-mode protobuf-mode csgo-conf-mode csharp-mode json-mode markdown-mode+ markdown-toc company company-box company-dict company-flow company-lua company-posframe company-quickhelp company-shell company-statistics cask cask-mode edebug-x compact-docstrings flycheck-cask js2-mode indium mocha-snippets js2-highlight-vars js2-refactor xref-js2 json-navigator json-reformat json-snatcher web-mode-edit-element web-completion-data company-web company-glsl mustache-mode coffee-mode web-narrow-mode java-imports java-snippets javadoc-lookup jdecomp kotlin-mode groovy-imports groovy-mode flycheck-kotlin flycheck-gradle swift-mode xcode-mode xcode-project flycheck-objc-clang flycheck-swift flycheck-xcode common-lisp-snippets magit magit-filenotify magit-org-todos magit-popup magit-todos magithub projectile ibuffer-projectile projectile-speedbar ipcalc dirtree with-editor neotree emms emms-info-mediainfo flycheck flycheck-checkbashisms flycheck-css-colorguard flycheck-tip flycheck-inline flycheck-julia flycheck-package flycheck-pkg-config color-theme color-theme-modern color-theme-sanityinc-solarized color-theme-solarized color-theme-sanityinc-tomorrow))
 '(projectile-enable-caching t)
 '(projectile-indexing-method 'native)
 '(projectile-keymap-prefix "p")
 '(safe-local-variable-values
   '((java-indent-offset . 4)
     (eval progn)
     (groovy-indent-offset 2)
     (c-offsets-alist
      '((inline-open . +)
        (inline-close . 0)
        (topmost-intro . 0)
        (inclass . +)
        (member-init-intro . +)
        (substatement-open . 0)
        (statement-block-intro . +)
        (func-decl-cont . 0)
        (inline-open . 0)
        (block-open . +)
        (defun-block-intro . +)
        (c-lineup-C-comments . 1)))
     (auto-fill-mode nil)
     (hs-minor-mode t)
     (tab-width 2)
     (indent-tabs-mode nil)
     (current-fill-column 240)
     (eval progn
           (projectile-register-project-type 'boomerang-android
                                             '("test-bna" "TAGS" "aspectj-xlint.properties" "mpulse-android-gradle-plugin" "mpulse-java")
                                             :compile
                                             (concat "./gradlew " " :mpulse-java:build" " :mpulse-android:build:" " :mpulse-android-gradle-plugin:build" " :mpulse-java:install" " :mpulse-android:install" " :mpulse-android-gradle-plugin:install" " :mpulse-android-gradle-plugin:gradleTest"))
           (defun refresh-tags-project
               (&optional arg)
             (when
                 (and
                  (or
                   (eq major-mode 'jdee-mode)
                   (eq major-mode 'groovy-mode)
                   (eq major-mode 'xml-mode))
                  (string-equal
                   (projectile-project-name)
                   "boomerang-android")
                  (projectile-project-p)
                  (< -1
                     (string-match-p "^boomerang-android$"
                                     (projectile-project-name))))
               (let
                   ((-script-get-tags-bin-path
                     (expand-file-name
                      (concat
                       (projectile-project-root)
                       "get-tags"))))
                 (when
                     (file-exists-p -script-get-tags-bin-path)
                   (async-start
                    `(lambda nil
                       (let
                           ((default-directory
                              (projectile-project-root)))
                         (set 'executable ,-script-get-tags-bin-path)
                         (shell-command-to-string executable)))
                    (lambda
                      (command-output)
                      (message
                       (format "Debug: %s" command-output))
                      (message "Refreshed TAGs file")))))))
           (add-hook 'after-save-hook 'refresh-tags-project)
           (add-hook 'compilation-start-hook 'refresh-tags-project))
     (eval progn
           (projectile-register-project-type 'boomerang-android
                                             '("test-bna" "TAGS" "aspectj-xlint.properties" "mpulse-android-gradle-plugin" "mpulse-java")
                                             :compile
                                             (concat "./gradlew " " :mpulse-java:build" " :mpulse-android:build:" " :mpulse-android-gradle-plugin:build" " :mpulse-java:install" " :mpulse-android:install" " :mpulse-android-gradle-plugin:install" " :mpulse-android-gradle-plugin:gradleTest"))
           (defun refresh-tags-project nil
             (when
                 (and
                  (or
                   (eq major-mode 'jdee-mode)
                   (eq major-mode 'groovy-mode)
                   (eq major-mode 'xml-mode))
                  (string-equal
                   (projectile-project-name)
                   "boomerang-android")
                  (projectile-project-p)
                  (< -1
                     (string-match-p "^boomerang-android$"
                                     (projectile-project-name))))
               (let
                   ((-script-get-tags-bin-path
                     (expand-file-name
                      (concat
                       (projectile-project-root)
                       "get-tags"))))
                 (when
                     (file-exists-p -script-get-tags-bin-path)
                   (async-start
                    `(lambda nil
                       (let
                           ((default-directory
                              (projectile-project-root)))
                         (set 'executable ,-script-get-tags-bin-path)
                         (shell-command-to-string executable)))
                    (lambda
                      (command-output)
                      (message
                       (format "Debug: %s" command-output))
                      (message "Refreshed TAGs file")))))))
           (add-hook 'after-save-hook 'refresh-tags-project)
           (add-hook 'compilation-start-hook 'refresh-tags-project))
     (eval progn
           (projectile-register-project-type 'boomerang-android
                                             '("test-bna" "TAGS" "aspectj-xlint.properties" "mpulse-android-gradle-plugin" "mpulse-java")
                                             :compile
                                             (concat "./gradlew " " :mpulse-java:build" " :mpulse-android:build:" " :mpulse-android-gradle-plugin:build" " :mpulse-java:install" " :mpulse-android:install" " :mpulse-android-gradle-plugin:install" " :mpulse-android-gradle-plugin:gradleTest"))
           (defun refresh-tags-project
               (arg)
             (when
                 (and
                  (or
                   (eq major-mode 'jdee-mode)
                   (eq major-mode 'groovy-mode)
                   (eq major-mode 'xml-mode))
                  (projectile-project-p)
                  (< -1
                     (string-match-p "^boomerang-android$"
                                     (projectile-project-name))))
               (let
                   ((-script-get-tags-bin-path
                     (expand-file-name
                      (concat
                       (projectile-project-root)
                       "get-tags"))))
                 (when
                     (file-exists-p -script-get-tags-bin-path)
                   (async-start
                    `(lambda nil
                       (let
                           ((default-directory
                              (projectile-project-root)))
                         (set 'executable ,-script-get-tags-bin-path)
                         (shell-command-to-string executable)))
                    (lambda
                      (command-output)
                      (message
                       (format "Debug: %s" command-output))
                      (message "Refreshed TAGs file")))))))
           (add-hook 'after-save-hook 'refresh-tags-project)
           (add-hook 'compilation-start-hook 'refresh-tags-project))))
 '(semantic-analyze-summary-function 'semantic-format-tag-short-doc)
 '(semantic-complete-inline-analyzer-displayor-class 'semantic-displayor-tooltip)
 '(semantic-complete-inline-analyzer-idle-displayor-class 'semantic-displayor-tooltip)
 '(semantic-decoration-mode nil t)
 '(semantic-decoration-styles
   '(("semantic-decoration-on-includes")
     ("semantic-decoration-on-protected-members")
     ("semantic-decoration-on-private-members")
     ("semantic-tag-boundary")))
 '(semantic-default-submodes
   '(global-semantic-idle-completions-mode global-semantic-idle-scheduler-mode global-semanticdb-minor-mode global-semantic-idle-summary-mode global-semantic-idle-local-symbol-highlight-mode))
 '(semantic-displayor-tooltip-mode 'verbose)
 '(semantic-mode-line-prefix "SEM" nil (semantic/util-modes))
 '(semantic-sb-autoexpand-length 2 t)
 '(semantic-show-unmatched-syntax-mode nil t)
 '(senator-highlight-found t)
 '(senator-step-at-start-end-tag-classes nil)
 '(web-mode-attr-value-indent-offset nil t)
 '(web-mode-enable-auto-closing t t)
 '(web-mode-enable-auto-pairing t t)
 '(web-mode-enable-auto-quoting t t)
 '(web-mode-enable-current-column-highlight nil t)
 '(web-mode-enable-current-element-highlight t t)
 '(web-mode-enable-element-tag-fontification t t)
 '(web-mode-enable-html-entities-fontification t t)
 '(web-mode-indent-style 2 t)
 '(web-mode-markup-indent-offset 2 t)
 '(web-mode-script-padding 0 t)
 '(whitespace-modes '(awk-mode) t)
 '(yas-prompt-functions '(yas-dropdown-prompt yas-completing-prompt yas-no-prompt)))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:stipple nil :background "#002b36" :foreground "white" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 140 :width normal :foundry "xos4" :family "Inconsolata"))))
 '(company-preview ((t (:background "RoyalBlue4" :foreground "gray97"))))
 '(company-preview-search ((t (:inherit company-preview :foreground "light green"))))
 '(company-template-field ((t (:background "cyan4" :foreground "yellow3"))))
 '(company-tooltip ((t (:background "grey20" :foreground "white"))))
 '(jdibug-breakpoint-disabled ((t (:background "green" :foreground "black"))))
 '(jdibug-breakpoint-enabled ((t (:background "red" :foreground "white"))))
 '(jdibug-breakpoint-unresolved ((t (:background "yellow" :foreground "black"))))
 '(jdibug-current-frame ((t (:background "blue" :foreground "white"))))
 '(jdibug-current-line ((t (:background "black" :foreground "red"))))
 '(js2-function-call ((t (:underline t))))
 '(js2-object-property ((t (:foreground "LightSalmon3"))))
 '(markup-anchor-face ((t (:inherit grey :overline t))))
 '(markup-attribute-face ((t (:foreground "purple"))))
 '(markup-command-face ((t (:foreground "white" :weight bold))))
 '(markup-complex-replacement-face ((t (:background "blue" :foreground "white"))))
 '(markup-internal-reference-face ((t (:foreground "green" :weight bold))))
 '(markup-list-face ((t (:inherit markup-meta-face :foreground "plum1" :weight bold))))
 '(markup-meta-face ((t (:foreground "blue" :weight thin))))
 '(markup-table-cell-face ((t (:inherit markup-table-face :background "blue" :foreground "yellow" :weight bold))))
 '(rainbow-delimiters-depth-2-face ((t (:foreground "pink3"))))
 '(rainbow-delimiters-depth-7-face ((t (:foreground "PaleGreen3"))))
 '(web-mode-current-element-highlight-face ((t (:foreground "#ff" :underline t))))
 '(web-mode-doctype-face ((t (:distant-foreground "#ff" :foreground "#ff"))))
 '(whitespace-empty ((t (:foreground "DodgerBlue4"))))
 '(whitespace-indentation ((t (:foreground "DodgerBlue4"))))
 '(whitespace-line ((t nil)))
 '(whitespace-newline ((t (:foreground "dark slate gray"))))
 '(whitespace-space ((t (:foreground "DodgerBlue4"))))
 '(whitespace-space-after-tab ((t (:foreground "white"))))
 '(whitespace-space-before-tab ((t (:background "white" :foreground "blue")))))
