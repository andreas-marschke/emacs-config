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

;; (use-package less-css-mode
;;   :ensure t
;;   :init
;;   (add-to-list 'auto-mode-alist '("\\.\\(less\\)\\'" . less-css-mode))
;;   :after (css-mode))

;;;;; JSON
(use-package json-mode
  :ensure t
  :mode
  "\\.json\\'")

;;;;; JS2
(use-package js2-refactor
  :init
  (js2r-add-keybindings-with-prefix js2r-kbd-prefix)
  :ensure t)

(use-package js2-mode
  :mode
  ("\\.js\\'")
  :ensure t
  :hook
  ((js-mode . js2-mode)
   (js2-mode . js2-refactor-mode)
   (js2-mode . cc-mode-indentation-mode))
  :requires
  (js2-refactor-mode)
  :defines
  js2-init-hook
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
  :hook
  ((web-mode-hook . cc-mode-indentation-mode-hook)
   )
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

(use-package tagedit
  :defines tagedit-add-paredit-like-keybindings
  :hook
  ((web-mode . tagedit-mode)
   (xml-mode . tagedit-mode))
  :config
  (tagedit-add-paredit-like-keybindings))


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


(provide 'emacs-rc-web)
