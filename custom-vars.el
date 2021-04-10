(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(c-basic-offset '2)
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
 '(company-auto-commit nil)
 '(company-box-color-icon t)
 '(company-box-enable-icon nil)
 '(company-dict-dir "~/.emacs.d/company-dict/")
 '(company-dict-minor-mode-list '(yas-minor-mode))
 '(company-mode 1 t)
 '(company-show-numbers t)
 '(company-tooltip-flip-when-above t)
 '(company-tooltip-idle-delay nil)
 '(company-tooltip-margin 2)
 '(company-tooltip-offset-display 'lines)
 '(compilation-ask-about-save nil)
 '(compilation-buffer-name-function
   (lambda
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
       (concat buffer-tag-name "/" mode))) t)
 '(compilation-scroll-output t)
 '(css-indent-offset 2)
 '(cssm-indent-level 1 t)
 '(cua-enable-cua-keys t)
 '(cua-mode 1 nil (cua-base))
 '(cua-toggle-set-mark t)
 '(font-lock-maximum-decoration '((js-mode . t) (compilation-mode . t) (prog-mode . t)))
 '(global-company-mode t)
 '(global-hl-todo-mode t)
 '(global-semantic-decoration-mode nil)
 '(global-semantic-highlight-edits-mode t)
 '(global-semantic-highlight-func-mode t)
 '(global-semantic-idle-breadcrumbs-mode t nil (semantic/idle))
 '(global-semantic-idle-completions-mode t nil (semantic/idle))
 '(global-semantic-idle-local-symbol-highlight-mode t nil (semantic/idle))
 '(global-semantic-idle-summary-mode t)
 '(global-semantic-mru-bookmark-mode nil)
 '(global-semantic-show-parser-state-mode t)
 '(global-semantic-show-unmatched-syntax-mode nil)
 '(global-semantic-stickyfunc-mode t)
 '(global-whitespace-newline-mode t)
 '(groovy-indent-offset 2 t)
 '(highlight-indent-guides-character 124)
 '(highlight-indent-guides-method 'character)
 '(jdibug-connect-hosts '("127.0.0.1:6001"))
 '(js-indent-level 2)
 '(js2-bounce-indent-p nil)
 '(js2-concat-multiline-strings nil)
 '(js2-highlight-level 3)
 '(js2-include-jslint-globals t)
 '(js2-include-node-externs t)
 '(js2-mode-assume-strict t)
 '(js2-skip-preprocessor-directives t)
 '(kotlin-tab-width 2 t)
 '(lsp-java-theme "emacs")
 '(multi-term-program "/bin/bash" t)
 '(neo-window-fixed-size nil)
 '(neo-window-width 35)
 '(nodejs-repl-command "node")
 '(org-agenda-files '("~/src/doc/todo.org") t)
 '(org-highlight-latex-and-related '(latex script entities) t)
 '(org-priority-faces nil t)
 '(org-src-preserve-indentation t t)
 '(package-check-signature nil)
 '(package-selected-packages
   '(editorconfig org-contrib "use-package" scala-mode ts-comint typescript-mode typescript neotree company-flow dockerfile-mode docker-compose-mode vue-html-mode yaml-mode vue-mode vue-html lsp-js ## exec-path-from-shell elogcat elquery emamux spinner company-statistics company-box company-quickhelp glsl-mode flycheck-css-colorguard indium nodejs-repl tagedit web-mode js2-refactor json-mode jdecomp javadoc-lookup flycheck-kotlin flycheck-gradle helm-lsp company-lsp lsp-java lsp-ui lsp-mode groovy-mode kotlin-mode jdee memoize magithub git helm-projectile helm-c-yasnippet helm-flycheck helm-gtags helm-etags-plus helm-directory helm-ag helm-company helm flycheck-checkbashisms flycheck-cask flycheck-inline yasnippet ggtags etags-select outshine rainbow-delimiters whitespace-cleanup-mode highlight-numbers hl-todo rpm-spec-mode gitignore-mode multi-term markdown-mode adoc-mode csv-mode ipcalc ag ack tree-mode windata flycheck-objc-clang flycheck-swift swift-mode delight diminish))
 '(projectile-auto-update-cache nil)
 '(projectile-enable-caching nil nil nil "Customized with use-package projectile")
 '(projectile-file-exists-local-cache-expire 64000)
 '(projectile-files-cache-expire 64000)
 '(projectile-indexing-method 'native)
 '(projectile-keymap-prefix "p" nil nil "Customized with use-package projectile")
 '(safe-local-variable-values
   '((js2-basic-offset . 4)
     (indent-tabs-mode nil)
     (indent-tabs-mode t)))
 '(semantic-analyze-summary-function 'semantic-format-tag-short-doc)
 '(semantic-complete-inline-analyzer-displayor-class 'semantic-displayor-tooltip)
 '(semantic-complete-inline-analyzer-idle-displayor-class 'semantic-displayor-tooltip)
 '(semantic-decoration-mode t t)
 '(semantic-decoration-styles 'nil)
 '(semantic-default-submodes
   '(global-semantic-idle-completions-mode global-semantic-idle-scheduler-mode global-semanticdb-minor-mode global-semantic-idle-summary-mode global-semantic-idle-local-symbol-highlight-mode))
 '(semantic-displayor-tooltip-mode 'verbose)
 '(semantic-mode t)
 '(semantic-mode-line-prefix "SEM" nil (semantic/util-modes))
 '(semantic-sb-autoexpand-length 2)
 '(semantic-show-unmatched-syntax-mode nil t)
 '(senator-highlight-found nil)
 '(senator-step-at-start-end-tag-classes nil)
 '(tags-revert-without-query 1)
 '(web-mode-attr-value-indent-offset nil t nil "Customized with use-package web-mode")
 '(web-mode-enable-auto-closing t t nil "Customized with use-package web-mode")
 '(web-mode-enable-auto-pairing t t nil "Customized with use-package web-mode")
 '(web-mode-enable-auto-quoting t t nil "Customized with use-package web-mode")
 '(web-mode-enable-current-column-highlight nil t nil "Customized with use-package web-mode")
 '(web-mode-enable-current-element-highlight t t nil "Customized with use-package web-mode")
 '(web-mode-enable-element-tag-fontification t t nil "Customized with use-package web-mode")
 '(web-mode-enable-html-entities-fontification t t nil "Customized with use-package web-mode")
 '(web-mode-indent-style 2 t nil "Customized with use-package web-mode")
 '(web-mode-markup-indent-offset 2 t nil "Customized with use-package web-mode")
 '(web-mode-script-padding 4 t nil "Customized with use-package web-mode")
 '(whitespace-modes '(awk-mode) t)
 '(yas-prompt-functions '(yas-dropdown-prompt yas-completing-prompt yas-no-prompt)))

















(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
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
 '(lsp-face-highlight-read ((t (:background "yellow" :foreground "black"))))
 '(lsp-face-highlight-textual ((t nil)))
 '(lsp-face-highlight-write ((t nil)))
 '(magit-blame-date ((t (:foreground "white"))) t)
 '(magit-diff-added ((t (:foreground "#335533"))))
 '(magit-diff-added-highlight ((t (:foreground "#336633"))))
 '(magit-diff-base ((t (:foreground "#ffffcc"))))
 '(magit-diff-base-highlight ((t (:foreground "#eeeebb"))))
 '(magit-diff-removed ((t (:foreground "#553333"))))
 '(magit-diff-removed-highlight ((t (:foreground "#553333"))))
 '(magit-hash ((t (:foreground "lightgreen"))))
 '(magit-section-highlight ((t (:foreground "default"))))
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
