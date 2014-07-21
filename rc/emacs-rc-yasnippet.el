;;; emacs-rc-yasnippet.el ---

;; Copyright (C) Alex Ott
;;
;; Author: Alex Ott <alexott@gmail.com>
;; Keywords:
;; Requirements:
;; Status: not intended to be distributed yet

(require 'yasnippet)

(setq yas/root-directory '("~/.emacs.d/snippets"))
(yas/load-directory "~/.emacs.d/snippets")
(mapc 'yas/load-directory yas/root-directory)
(yas-global-mode 1)
