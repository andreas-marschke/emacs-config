(setq
 ;;; Mime stuff ("attachments") and browser tie-in.
 vm-auto-displayed-mime-content-types
 '("multipart/mixed" "multipart/alternative"
   "text/plain" "multipart/signed")
 ;; vm-mime-base64-encoder-program "/opt/local/bin/base64-encode"
 ;; vm-mime-base64-decoder-program "/opt/local/bin/base64-decode"
 ;; vm-mime-qp-encoder-program "/opt/local/bin/qp-encode"
 ;; vm-mime-qp-decoder-program "/opt/local/bin/qp-decode"
 vm-send-using-mime t
 ;; vm-url-browser
 ;; 'vm-mouse-send-url-to-netscape ;;; ok w/mozilla too
 vm-mime-external-content-types-alist
 '(
   ("text/html" "mozilla") ;;; Will launch new browser.
   ("image/gif" "feh")
   ("image/jpeg" "feh")
   ("image/png" "feh")
   ("application/pdf" "evince")
   ("application/postscript" "evince")
   ("video" "vlc")
   ("audio/x-pn-realaudio" "vlc")
   ("audio" "vlc")
   )

;;; Folders, etc.

 vm-primary-inbox "~/Mail/Inbox"
 vm-folder-directory "~/Mail/"
 vm-crash-box "~/Mail/INBOX.CRASH"
; vm-auto-get-new-mail t
 vm-circular-folders t
 vm-confirm-new-folders t
 vm-convert-folder-types t

;;; forwarding, replying, etc.

 vm-forwarding-subject-format "[forwarded from %F] %s"
 vm-forwarding-digest-type "rfc934"
 vm-in-reply-to-format nil
 vm-included-text-attribution-format
 "On %w, %m %d, %y at %h (%z), %F wrote:\n"
 vm-reply-subject-prefix "Re: "

;;; Misc
 vm-pop-expunge-after-retrieving nil
 vm-imap-messages-per-session 10000

 vm-mail-header-from "Andreas Marschke <xxtjaxx@gmail.com>"
 vm-move-after-deleting t
 vm-delete-after-saving t
 vm-edit-message-mode 'indented-text-mode
 vm-follow-summary-cursor t

 vm-default-folder-type 'From_-with-Content-Length
 vm-trust-From_-with-Content-Length t
;;; emacs frames (windows)

 vm-frame-per-composition nil
 vm-frame-per-folder nil
 vm-frame-per-edit nil

;;; appearance

 vm-highlighted-header-regexp
 "^From\\|^Subject\\|^Date\\|^CC\\|^Cc\\|To"
 vm-preview-lines t
 vm-startup-with-summary t
 vm-summary-format "%3n %*%A %-17.17F %-3.3m %2d (%4l) %I%s\n"
 vm-summary-highlight-face "region"
 vm-summary-show-threads t

 vm-visible-headers '("From:" "Sender:" "To:" "Apparently-To:"
                      "Cc:" "Subject:" "Date:" "Resent-From:"
                      "Message-Id:" "Message-ID:" "Message-id:"
                      "Resent-Sender:" "X-Zippy")
 )

 ;;; Multiple VM spool files.  ONLY use this if you use procmail to put
 ;;; EVERYTHING into one or more spool files on your local disk!!!
 ;;; Note that it's commented out here.
 ;;; misc: zap deleted messages when you quit a folder:

(add-hook 'vm-quit-hook 'vm-expunge-folder)

 ;;; From Bill Cotton: the "l" key prints.  My way!

;; (define-key vm-mode-map "l" 'print-messages)
(setq print-command "/users/pmurphy/bin/a2ps-mail -2")
(defun print-messages ()
  "Print the selected messages using command in print-command"
  (interactive)
  (vm-pipe-message-to-command print-command nil)
  )

 ;;; Switching between summary and mail content like in gnus!
;; (define-key vm-mode-map "h" 'toggle-mail-summary)
(defun toggle-mail-summary ()
  (interactive)
  (other-window 1)
  )


(setq vm-primary-inbox "~/Mail/INBOX")
(setq vm-crash-box "~/Mail/INBOX.crash")
(setq vm-spool-files `((,vm-primary-inbox
                        "imap-ssl:imap.googlemail.com:993:INBOX:login:xxtjaxx:*"
                        ,vm-crash-box)))

(setq vm-stunnel-program "stunnel4")

;; ;; *FILTERS*
;;  I have a whole bunch of mailinglists that I am subscribed to and
;;  I like my mails to be organized by where they cam from or in which
;;  context I got them such as kde-devel emails go into KDE-Devel
(setq vm-virtual-folder-alist
      '(
        ("kde.bindings" ( ("INBOX") (author "kde-bindings@kde.org") )
         )
        ("debian.kde" ( ("INBOX")
                        (or (author "debian-qt-kde@lists.debian.org")
                            (author "pkg-kde-extras@lists.alioth.debian.org")
                            (author "pkg-kde-talk@lists.alioth.debian.org")
                            (author "debian-kde@lists.debian.org")
                            (recipient "debian-qt-kde@lists.debian.org")
                            (recipient "pkg-kde-extras@lists.alioth.debian.org")
                            (recipient "pkg-kde-talk@lists.alioth.debian.org")
                            (recipient "debian-kde@lists.debian.org") ) )
         )
        ("debian.perl" ( ("INBOX")
                         (or (author "debian-perl@lists.debian.org")
                             (recipient "debian-perl@lists.debian.org") ) )
         )
        ("debian.bugs" ( ("INBOX")
                         (or (author "bugs@debian.org")
                             (author "bts-link-upstream@lists.alioth.debian.org")
                             (recipient "bugs@debian.org")
                             (recipient "bts-link-upstream@lists.alioth.debian.org") ) )
         )
        ("identi.ca" ( ("INBOX") (author "noreply@identi.ca") )
         )
        ("gitorious" ( ("INBOX") (or (author "no-reply@gitorious.org")
                                     (recipient "no-reply@gitorious.org") ) )
         )
        ("kde.devel" ( ("INBOX") (or (author "kde-devel@kde.org")
                                     (recipient "kde-devel@kde.org") ) )
         )
        ("Blog" ( ("INBOX")
                  (or (author "comment-reply@wordpress.com")
                      (author "donotreply@wordpress.com") ) )
         )
        ("debian.release" ( ("INBOX") (or (author "debian-release@lists.debian.org")
                                          (author "noreply@release.debian.org")
                                          (recipient "debian-release@lists.debian.org")
                                          (recipient "noreply@release.debian.org") ) )
         )
        ("sent" ( ("INBOX") (or (author "xxtjaxx@googlemail.com")
                                (author "xxtjaxx@gmail.com") ) )
         )
        ("bangarang" ( ("INBOX") (author "bangarangissuetracking@googlecode.com") )
         )
        ("debian.multimedia" ( ("INBOX")
                               (or (author "debian-multimedia@lists.debian.org")
                                   (recipient "debian-multimedia@lists.debian.org") ) )
         )
        ("debian.announce" ( ("INBOX") (or (author "debian-devel-announce@lists.debian.org")
                                           (recipient "debian-devel-announce@lists.debian.org") ) )
         )
        ("kde.bugs" ( ("INBOX") (author "bug-control@bugs.kde.org") )
         )
        ("debian.changes" ( ("INBOX") (author "debian-changes@lists.debian.org") )
         )
        ("debian.qa" ( ("INBOX") (or (author "debian-qa@lists.debian.org")
                                     (author "debian-qa-packages@lists.debian.org")
                                     (recipient "debian-qa@lists.debian.org")
                                     (recipient "debian-qa-packages@lists.debian.org") ) )
         )
        ("kde.plasma" ( ("INBOX") (or (author "plasma-devel.kde.org")
                                      (recipient "plasma-devel.kde.org") ) )
         )
        ("debian.kde.commits" (  ("INBOX") (or (author "pkg-kde-commits@lists.alioth.debian.org")
                                               (recipient "pkg-kde-commits@lists.alioth.debian.org") ) )
         )
        ("debian.devel" ( ("INBOX") (or (author "debian-devel@lists.debian.org")
                                      (recipient "debian-devel@lists.debian.org") ) )
         )
        ("" ( ("INBOX") (author "") )
         )
        )
      )








