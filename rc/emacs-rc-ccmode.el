;;; emacs-rc-ccmode.el ---

;; Copyright (C) 2003 Alex Ott
;;
;; Author: alexott@gmail.com
;; Keywords:
;; Requirements:
;; Status: not intended to be distributed yet

(require 'cc-mode)

;;(load "c-eldoc")
;;(setq c-eldoc-includes "-I~/exp/include -I./ -I../ ")

;; customisation of cc-mode
(defun xxtjaxx/c-mode-common-hook ()
  (c-add-style "qt-gnu"
	       '("gnu"
		 (c-access-key ."\\<\\(signals\\|public\\|protected\\|private\\|public slots\\|protected slots\\|private slots\\):")
		 (c-basic-offset . 4)))
  ;; style customization
  (c-set-offset 'member-init-intro '++)
  (setq tab-width 4)
  (setq   indent-tabs-mode t)
  (c-set-offset 'substatement-open 0)
  (c-set-style "k&r")
  (setq c-basic-offset 4)
  (c-toggle-auto-hungry-state 0)
  ;; minor modes
  (auto-fill-mode 1)
  ;; (c-turn-on-eldoc-mode)
  ;; (gtags-mode 1)
  (hs-minor-mode 1)
  ;; local keys
  (local-set-key [return] 'newline-and-indent)
  ;;        (local-set-key [delete]  'delete-char)
  )
(add-hook 'c-mode-common-hook 'xxtjaxx/c-mode-common-hook)
(add-hook 'c-mode-common-hook 'xxtjaxx/common-hook)

(require 'info-look)
(info-lookup-add-help
 :mode 'c-mode
 :regexp "[^][()'\" \t\n]+"
 :ignore-case t
 :doc-spec '(("(libc)Symbol Index" nil nil nil)))

(defun fp-c-mode-routine ()
  (local-set-key "\M-q" 'rebox-comment))
(add-hook 'c-mode-hook 'fp-c-mode-routine)

(setq-default c-default-style (quote ((java-mode . "java") (other . "gnu"))))

(add-to-list 'auto-mode-alist '("\\.ipp?$" . c++-mode))

;;; emacs-rc-cmode.el ends here
