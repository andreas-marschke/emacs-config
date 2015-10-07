;; Interpret mIRC-style color commands in IRC chats
(setq erc-interpret-mirc-color t)

;; The following are commented out by default, but users of other
;; non-Emacs IRC clients might find them useful.
;; Kill buffers for channels after /part
(setq erc-kill-buffer-on-part t)
;; Kill buffers for private queries after quitting the server
(setq erc-kill-queries-on-quit t)
;; Kill buffers for server messages after quitting the server
(setq erc-kill-server-buffer-on-quit t)

(setq erc-auto-query (quote bury))
(setq erc-autojoin-channels-alist (quote (("freenode.net" ""))))
(setq erc-fill-mode t)
(setq erc-hide-list (quote ("JOIN" "PART" "QUIT")))
(setq erc-irccontrols-mode t)
(setq erc-list-mode t)
(setq erc-match-mode t)
(setq erc-menu-mode nil)
(setq erc-move-to-prompt-mode t)
(setq erc-netsplit-mode t)
(setq erc-networks-mode t)
(setq erc-nick "xxtjaxx")
(setq erc-noncommands-mode t)
(setq erc-pcomplete-mode t)
(setq erc-readonly-mode t)
(setq erc-ring-mode t)
(setq erc-stamp-mode t)
(setq erc-track-minor-mode t)
(setq erc-track-mode t)
