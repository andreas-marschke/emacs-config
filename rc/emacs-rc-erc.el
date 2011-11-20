;;; emacs-rc-erc.el ---

;; Copyright (C) 2010 Andreas Marschke
;;
;; Author: xxtjaxx@gmail.com
;; Keywords: IRC
;; Requirements:
;; Status: not intended to be distributed yet

(require 'erc)

(require 'erc-join)
(erc-autojoin-mode t)
(setq erc-modules
   (quote
    (autojoin
     button
     completion
     fill
     irccontrols
     list
     match
     menu
     move-to-prompt
     track
     log
     netsplit
     readonly
     scrolltobottom
     smiley
     stamp)
    ))
(erc-update-modules)
(require 'erc-lang)

(require 'erc-fill)
(erc-fill-mode t)

(setq erc-user-full-name "Andreas Marschke")
(setq erc-email-userid "xxtjaxx@gmail.com")

(require 'erc-log)
(setq erc-log-insert-log-on-open nil)
(setq erc-log-channels t)
(setq erc-log-channels-directory "~/.irclogs/")
(setq erc-save-buffer-on-part t)
(setq erc-hide-timestamps nil)

(setq erc-max-buffer-size 20000)

(require 'erc-autoaway)
(setq erc-autoaway-idle-seconds 1200)
(setq erc-autoaway-message "I'm gone (autoaway after %i seconds)")
(setq erc-auto-discard-away t)

(setq erc-auto-query 'buffer)

(setq erc-track-exclude-types '("QUIT"))

(require 'erc-services)
(erc-nickserv-mode 1)
(setq erc-prompt-for-nickserv-password t)

(require 'erc-menu)

(defun erc-connect ()
  "Connect to IRC."
  (interactive)
  (progn
    (erc-select :server "irc.mibbit.com" :port 6667 :nick "andreas_m")
    ))

(setq erc-nick "xxtjaxx")
(setq erc-nick-uniquifier "_")
(setq erc-prompt-for-password t)
(setq erc-kill-queries-on-quit t)
(setq erc-autojoin-channels-alist
      '(("irc.mibbit.com" "#citizenradio")))

;;; emacs-rc-erc.el ends here


