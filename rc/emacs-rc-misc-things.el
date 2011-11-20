;;; emacs-rc-misc-things.el ---

;; Copyright (C) 2003 Alex Ott
;;
;; Author: alexott@gmail.com
;; Keywords:
;; Requirements:
;; Status: not intended to be distributed yet

;; misc variables
(setq auto-compression-mode t)
(setq text-mode-hook (quote (turn-on-auto-fill text-mode-hook-identify)))
(setq user-full-name "Andreas Marschke")

(setq delete-selection-mode t)
(setq fill-column 90)
(setq kill-whole-line t)
(setq tab-always-indent t)
(setq indent-tabs-mode nil)
(setq tab-width 8)
(setq next-line-add-newlines t)

;; unmark some function
(put 'upcase-region 'disabled nil)

;; set safe-local varaibles
(setq safe-local-variable-values (quote (
				      (c-file-offsets (substatement-open . 0))
				      (prompt-to-byte-compile)
				      (c-indentation-style . k&r)
				      (indent-tabs-mode . 1)
				      (folded-file . t)
				      (TeX-open-quote . "<<")
				      (TeX-close-quote . ">>")
				      )))

;; htmlize
(require 'htmlize)
(setq htmlize-output-type 'inline-css)
(defun xxtjaxx/add-google-analytics ()
  (while (search-forward "</body>" nil t)
    (replace-match "\n<script src=\"http://www.google-analytics.com/urchin.js\" type=\"text/javascript\">\n</script>\n<script type=\"text/javascript\">\n _uacct = \"UA-78697-3\";\n  urchinTracker();\n</script>\n</body>" nil t))
  )
(add-hook 'htmlize-after-hook 'xxtjaxx/add-google-analytics)

;; untabify
;; (defun untabify-file ()
;;   (save-excursion
;;     (delete-trailing-whitespace)
;;     (untabify (point-min) (point-max))))

;; footnote mode
(autoload 'footnote-mode "footnote" nil t)
;; (require 'footnote-init)
;; (defun my-fn-hook ()
;;  (footnote-init)
;;  )
;; (add-hook 'footnote-mode-hook 'my-fn-hook)

;; chm viewer
(require 'chm-view)

;;
(add-to-list 'auto-mode-alist '("\\.log$" . auto-revert-mode))

;;
(defun uniq ()
  "Trying to leave only unique strings from selection"
  (interactive)
  (let ((beg (point))
	(end (mark))
	(hash (make-hash-table :test 'equal))
	)
    (if (not end)
	(error "Please, mark text to uniquify")
      (save-excursion
	(narrow-to-region beg end)
	(goto-char (point-min))

	;; store strings in hash
	(while (not (eobp))
	  (beginning-of-line)
	  (puthash (buffer-substring (point) (point-at-eol)) 0 hash)
	  (forward-line 1))
	(delete-region beg end)
	;; insert strings from hash
	(maphash (lambda (key val)
		   (insert key "\n")
		   (message "%s" key)
		   )
		 hash)
	(widen)))))

(defun string-join (joiner strings)
  (string-join-accum joiner strings ""))

(defun string-join-accum (joiner strings accum)
  (cond ((not strings) accum)
	((not (cdr strings)) (concat accum (car strings)))
	(t (string-join-accum joiner (cdr strings)
			      (concat accum (car strings) joiner)))))
(defun find-deb-package ()
  (interactive)
  (w3m-search "debian-pkg" (read-from-minibuffer "deb: ")))

(defun byte-compile-current-file ()
  (interactive)
  (if (eq major-mode 'emacs-lisp-mode )
      (byte-compile-file (buffer-name (current-buffer)))
    )
  (if (eq major-mode 'c-mode)
      (compile "make " t))
  (if (eq major-mode 'c++-mode)
      (compile "make " t))
  )

(defun development ()
  (interactive)
  (split-window-horizontally)
  (other-window 1)
  (split-window-vertically)
  (multi-term)
  (other-window 1)
  (mocp)
  (other-window 1)
  (find-file "~/devel")
  )

;; Make EMACS fullscreen :D
(defun toggle-fullscreen (&optional f)
  (interactive)
  (let ((current-value (frame-parameter nil 'fullscreen)))
    (set-frame-parameter nil 'fullscreen
			 (if (equal 'fullboth current-value)
			     (if (boundp 'old-fullscreen)
				 old-fullscreen nil)
			   (progn (setq old-fullscreen current-value)
				  'fullboth)))))
;;; emacs-rc-misc-things.el ends here





