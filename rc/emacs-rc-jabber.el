(require 'jabber)

(add-to-list 'jabber-account-list '("xxtjaxx@jabber.snow-crash.org/MyJaber"))
(add-hook 'jabber-chat-mode-hook 'goto-address)
(jabber-jid-resource "Jabber.el" )

;; (setq jabber-chat-header-line-format
;;       '(" " (:eval (jabber-jid-displayname jabber-chatting-with))
;;         " " (:eval (jabber-jid-resource jabber-chatting-with)) "\t";
;;         (:eval (let ((buddy (jabber-jid-symbol jabber-chatting-with)))
;;                  (propertize
;;                   (or
;;                    (cdr (assoc (get buddy 'show) jabber-presence-strings))
;;                    (get buddy 'show))
;;                   'face
;;                   (or (cdr (assoc (get buddy 'show) jabber-presence-faces))
;;                       'jabber-roster-user-online))))
;;         "\t" (:eval (get (jabber-jid-symbol jabber-chatting-with) 'status))
;;         (:eval (unless (equal "" *jabber-current-show*)
;;                  (concat "\t You're " *jabber-current-show*
;;                          " (" *jabber-current-status* ")")))))

;(setq jabber-xosd-display-time 5)

;; (defun jabber-xosd-display-message (message)
;;   "Displays MESSAGE through the xosd"
;;   (let ((process-connection-type nil))
;;     (start-process "jabber-xosd" nil "osd_cat" "-p" "bottom" "-A" "center" "-f" "-*-courier-*-*-*-*-30" "-d" (number-to-string jabber-xosd-display-time))
;;     (process-send-string "jabber-xosd" message)
;;     (process-send-eof "jabber-xosd")))

;; (defun jabber-message-xosd (from buffer text propsed-alert)
;;   (jabber-xosd-display-message "New message."))

;; (add-to-list 'jabber-alert-message-hooks 'jabber-message-xosd)
