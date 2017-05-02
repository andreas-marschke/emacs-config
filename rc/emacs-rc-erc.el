;;; emacs-rc-erc.el --- ERC configuration

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

(custom-set-variables
 '(erc-auto-query (quote bury))
 '(erc-autojoin-channels-alist (quote (("freenode.net" ""))))
 '(erc-fill-mode t)
 '(erc-hide-list (quote ("JOIN" "PART" "QUIT")))
 '(erc-irccontrols-mode t)
 '(erc-list-mode t)
 '(erc-match-mode t)
 '(erc-menu-mode nil)
 '(erc-move-to-prompt-mode t)
 '(erc-netsplit-mode t)
 '(erc-networks-mode t)
 '(erc-nick "xxtjaxx")
 '(erc-noncommands-mode t)
 '(erc-pcomplete-mode t)
 '(erc-readonly-mode t)
 '(erc-ring-mode t)
 '(erc-stamp-mode t)
 '(erc-track-minor-mode t)
 '(erc-track-mode t)
 '(erc-interpret-mirc-color t)
 '(erc-kill-server-buffer-on-quit t)
 '(erc-kill-queries-on-quit t)
 '(erc-kill-buffer-on-part t))
