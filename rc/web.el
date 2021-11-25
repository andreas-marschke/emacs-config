;;; emacs-rc-web.el --- Web Development Support

;; Copyright (C) 2019 Andreas Marschke

;; Author: Andreas Marschke <emacs@andreas-marschke.name>
;; Created: 21.04.2019
;; Version: 0.1
;; Package-Requires: (())
;; Keywords: 
;; URL:
;;; Commentary:
;; This module concerns code highlighting, completion and all the other tools for development with web technologies.
;;
;;; Code:

;;;; Code Highlighting

;;;;; Stylesheets
(use-package css-mode
  :custom
  (css-indent-offset 2)
  (cssm-indent-level 1))

(use-package less-css-mode
  :ensure t
  :init
  (add-to-list 'auto-mode-alist '("\\.\\(less\\)\\'" . less-css-mode))
  :after (css-mode))

(use-package restclient
  :mode
  ("\\.http\\'" . restclient-mode)
  :ensure t)

;;;;; JSON
(use-package json-mode
  :ensure t
  :mode
  "\\.json\\'")

;;;;; JS2
(use-package js2-refactor
  :after js2-mode
  :init
  (js2r-add-keybindings-with-prefix js2r-kbd-prefix)
  :ensure t)

(use-package js2-mode
  :ensure t
  :mode
  "\\.js\\'"
  :hook
  ((js2-mode . js2-refactor-mode)
   (js2-mode . cc-mode-indentation-mode))
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
  (js2r-kbd-prefix "C-c C-n")
  :config
  (js2r-add-keybindings-with-prefix js2r-kbd-prefix)
  :custom-face
  (js2-object-property ((t (:foreground "LightSalmon3"))))
  (js2-function-call ((t (:underline t))))
  :ensure t)

;;;;; HTML

(use-package web-mode
  :ensure t
  :mode
  ("\\.html\\'"
   "\\.nunjucks\\'"
   "\\.php\\'"
   "\\.jsx\\'"
   "\\.jsp\\'"
   "\\.njk\\'")
  :custom
  (web-mode-attr-value-indent-offset t)
  (web-mode-enable-auto-closing t)
  (web-mode-enable-auto-pairing t)
  (web-mode-enable-auto-quoting t)
  (web-mode-enable-current-column-highlight t)
  (web-mode-enable-current-element-highlight t)
  (web-mode-enable-element-tag-fontification t)
  (web-mode-enable-html-entities-fontification nil)
  (web-mode-indent-style 1)
  (web-mode-markup-indent-offset 2)
  (web-mode-script-padding 0)
  (web-mode-attr-value-indent-offset nil))

;;;; REPL
(use-package nodejs-repl
  :ensure t
  :custom
  (nodejs-repl-command "node"))

;;;;; Debugging
(use-package indium
  :ensure  t)

;;;; Code Validation
(use-package flycheck-css-colorguard
  :ensure t
  :hook
  (flycheck-mode . flycheck-css-colorguard-setup))

(use-package glsl-mode
  :ensure t)

(add-to-list 'compilation-error-regexp-alist-alist '(node . ("at [^ ]+ (\\(.+?\\):\\([[:digit:]]+\\):\\([[:digit:]]+\\)" 1 2 3)) t)
(add-to-list 'compilation-error-regexp-alist 'node)

;; (use-package typescript-mode
;;   :ensure t
;;   :mode
;;   ("\\.ts\\'"))
