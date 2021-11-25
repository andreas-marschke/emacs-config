;;; emacs-rc.el --- Anything that's not a package or dependency but still relevant to setting up emacs

;; Copyright (C) 2019-2021 Andreas Marschke

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

;; (defun set-exec-path-from-shell-PATH ()
;;   (interactive)
;;   (let ((path-from-shell (replace-regexp-in-string
;; 			  "[ \t\n]*$" "" (shell-command-to-string
;; 					          "$SHELL --login -c '. ~/.bash_export && echo $PATH'"
;; 					          ))))
;;     (setenv "PATH" path-from-shell)
;;     (setq exec-path (split-string path-from-shell path-separator))))

;; Allow emacs to know the full path I export from my $SHELL
;; This is super useful and allows desktop and shell emacs to
;; resolve all the binaries and executables I have in my
;; $PATH that aren't in the default PATH for emacs when started.
;; Also adds all the other global paths so any spawned shells and commands
;; such as those set for say Java and Postgres will be found and known to the
;; emacs env I'm spawning them from.
(defun amarschke/set-env-from (envvars)
  "Allows consuming a list of strings containing variable value assignments separated by
equal-signs and assigning it to the env in Emacs.

Example value for envvars: 
(\"PATH=/bin:/sbin:/usr/bin:...\"
 \"JAVA_HOME=/...\")
"
  (dolist (envvar envvars)
    (let* ((var-token (split-string envvar "=" t nil)) ;; ("PATH" ("/bin:/usr/bin:/sbin:..."))
           (varname (car var-token))                   ;; "PATH"
           (varval (car (cdr var-token))))             ;; "/bin:/usr/bin:/sbin:..."
          (setenv varname varval))))

(defun amarschke/set-global-env-vars (from-shell-command)
    "Set up Emacs' `exec-path' and environment variables to match
that used by the user's shell.

This is particularly useful under Mac OS X and macOS, where GUI
apps are not started from a shell.

`from-shell-command' parameter allows you to set the source for the shell value"
  (let* ((envvar-output (shell-command-to-string from-shell-command))
         (envvars (split-string envvar-output "\n" t nil)))
    (amarschke/set-env-from envvars)))

(amarschke/set-global-env-vars ". ~/.bash_export; printenv")
(setq exec-path (split-string (getenv "PATH") path-separator))

(use-package amarschke-util
  :commands
  ;; Navigate one window back (see: `C-h k C-x o')
  other-window-back
  menu-hide
  :load-path "~/.emacs.d/site-lisp/"
  :bind
  (("C-x o" . 'other-window)
   ("C-x p" . 'other-window-back)))
