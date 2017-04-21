;; -*- Mode: Emacs-Lisp -*-

;; Don't ignore my GMail-boxes
(setq gnus-ignored-newsgroups "^to\\.\\|^[0-9. ]+\\( \\|$\\)\\|^[\"]\"[#'()]")
(setq gnus-summary-line-format "%U[ %d ]%R %I %*\"%S\"\n" )


(setq gnus-select-method '(nntp "news.gmane.org"))
;; Mail and Name
(setq user-mail-address "andres.marschke@gmail.com")
(setq user-full-name "Andreas Marschke")

;; Methods of retrieving mail
(add-to-list 'gnus-secondary-select-methods '(nntp "news.eternal-september.org"))
(add-to-list 'gnus-secondary-select-methods '(nntp "news.gmane.org"))
(add-to-list 'gnus-secondary-select-methods '(nntp "news.gnus.org"))

(setq send-mail-function 'smtpmail-send-it)
(setq message-send-mail-function 'smtpmail-send-it)
(setq smtpmail-default-smtp-server "smtp.googlemail.com")

(setq smtpmail-starttls-credentials '(("smtp.googlemail.com"
				       "465"
				       "andreas.marschke"
				       nil)))
;;; Fix pattern so gnus works with GMail
(setq gnus-ignored-newsgroups "^^to\\.\\|^[0-9. ]+\\( \\|$\\)\\|^[\”]\”[#’()]")


(setq gnus-group-line-format "%M%S%p%P%5y:%B%(%G%)\n")
