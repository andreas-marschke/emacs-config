;;; emacs-rc-file-map.el --- Maps files to emacs major modes

;; Copyright (C) 2017 Andreas Marschke

;; Author:  <emacs@andreas-marschke.name>
;; Created: 03.05.2017
;; Version: 0.1
;; Package-Requires: (())
;; Keywords: 
;; URL:
;;; Commentary:
;; 
;;
;;; Code:

;;;; Auto Mode List Hooks - Use for file to major-mode mapping

(add-to-list 'auto-mode-alist '("\\.\\(pl\\)$" . cperl-mode))
(add-to-list 'auto-mode-alist '("\\.\\(less\\)$" . less-css-mode))
(add-to-list 'auto-mode-alist '("\\.\\(mdwn\\|md\\)$" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.\\(screenrc\\)$" . conf-mode))
(add-to-list 'auto-mode-alist '("\\.\\(js\\|javascript\\|js\\.es6\\)$" . js2-mode))
(add-to-list 'auto-mode-alist '("emacs$" . emacs-lisp-mode))
(add-to-list 'auto-mode-alist '("\\.\\(emacs\\)$" . lisp-mode))
(add-to-list 'auto-mode-alist '("mutt\-andreas-.*" . mail-mode))
(add-to-list 'auto-mode-alist '("\\.\\(latex\\|texi\\|tex\\)$" . latex-mode))
(add-to-list 'auto-mode-alist '("\\(Doxygfile\\)$" . conf-mode))
(add-to-list 'auto-mode-alist '("\\(bashrc\\)$" . sh-mode))
(add-to-list 'auto-mode-alist '("\\(bash_alias\\)$" . sh-mode))
(add-to-list 'auto-mode-alist '("\\.\\(nse\\)$" . lua-mode))
(add-to-list 'auto-mode-alist '("\\.\\(t\\)$" . cperl-mode))
(add-to-list 'auto-mode-alist '("\\.editorconfig$" . conf-unix-mode))
(add-to-list 'auto-mode-alist '("\\.\\(html\\)$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.\\(yml\\|yaml\\)$" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.\\(gradle\\|groovy\\)$" . groovy-mode))
(add-to-list 'auto-mode-alist '("\\.\\(aj\\|java\\)$" . java-mode))
(add-to-list 'auto-mode-alist '("\\.\\(nunjucks\\)$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsx$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.glsl\\'" . glsl-mode))
(add-to-list 'auto-mode-alist '("\\.vert\\'" . glsl-mode))
(add-to-list 'auto-mode-alist '("\\.frag\\'" . glsl-mode))
(add-to-list 'auto-mode-alist '("\\.geom\\'" . glsl-mode))
(add-to-list 'auto-mode-alist '("\\.pro$" . proguard-mode))
(add-to-list 'auto-mode-alist '("\\.java$" . java-mode))
(add-to-list 'auto-mode-alist '("CMakeLists\\.txt\\'" . cmake-mode))
(add-to-list 'auto-mode-alist '("\\.cmake\\'" . cmake-mode))
(add-to-list 'auto-mode-alist '("\\.el" . emacs-lisp-mode))
(add-to-list 'auto-mode-alist '("\\.gnus$" . emacs-lisp-mode))
(add-to-list 'auto-mode-alist '("\\.emacs$" . emacs-lisp-mode))
