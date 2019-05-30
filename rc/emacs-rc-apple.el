;;; emacs-rc-apple.el --- Objective C Development and Apple (/i/)OS related Development

;; Copyright (C) 2019 Andreas Marschke

;; Author: Andreas Marschke <emacs@andreas-marschke.name>
;; Created: 21.04.2019
;; Version: 0.1
;; Package-Requires: (())
;; Keywords: 
;; URL:
;;; Commentary:
;; 
;;
;;; Code:

(add-to-list 'auto-mode-alist '("*\\.\\(mm\\|m\\)" . objc-mode))

(use-package swift-mode
  :ensure t)

(use-package flycheck-swift
  :ensure t
  :requires (swift-mode)
  :hook
  (swift-mode . flycheck-swift-setup))

(use-package flycheck-objc-clang
  :ensure t
  :hook
  (objc-mode . flycheck-objc-clang-setup))

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
;;(require 'find-file) ;; for the "cc-other-file-alist" variable
;;(nconc (cadr (assoc "\\.h\\'" cc-other-file-alist)) '(".m" ".mm"))

;; The bigger problem is that the header-search algorithm doesn’t
;; understand frameworks. So, <sys/types> properly finds /usr/include/sys/types,
;; but <Foundation/Foundation.h> fails.
;; To fix that:
;; (defadvice ff-get-file-name (around ff-get-file-name-framework
;;                     (search-dirs
;;                      fname-stub
;;                      &optional suffix-list))
;;   "Search for Mac framework headers as well as POSIX headers."
;;   (or
;;    (if (string-match "\\(.*?\\)/\\(.*\\)" fname-stub)
;;        (let* ((framework (match-string 1 fname-stub))
;;               (header (match-string 2 fname-stub))
;;               (fname-stub (concat framework ".framework/Headers/" header)))
;;          ad-do-it))
;;    ad-do-it))

;; (ad-enable-advice 'ff-get-file-name 'around 'ff-get-file-name-framework)
;; (ad-activate 'ff-get-file-name)

;; (add-to-list cc-search-directories
;;              '("."
;;                "../include"
;;                "/usr/include"
;;                "/usr/local/include/*"
;;                "/System/Library/Frameworks"
;;                "/Library/Frameworks"))

(provide 'emacs-rc-apple)
