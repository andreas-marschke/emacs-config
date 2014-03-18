;;; emacs-rc-yasnippet.el ---

;; Copyright (C) Alex Ott
;;
;; Author: Alex Ott <alexott@gmail.com>
;; Keywords:
;; Requirements:
;; Status: not intended to be distributed yet

;;(add-to-list 'load-path "~/emacs/yasnippet")
(require 'yasnippet) ;; not yasnippet-bundle
;; (yas/initialize)
;;(setq alexott/yasnippet-dir "~/emacs/yasnippet/snippets")

(setq yas/root-directory '("~/.emacs.d/snippets"))
(yas/load-directory "~/.emacs.d/snippets")
(mapc 'yas/load-directory yas/root-directory)
