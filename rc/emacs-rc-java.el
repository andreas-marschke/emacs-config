;;; emacs-rc-java.el --- Java Development configuration

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

;;; Compilation Error RegExp - Checkstyle matching from gradle
(add-to-list 'compilation-error-regexp-alist '("\\[ant:checkstyle] \\[\\(WARN\\|ERROR\\|INFO\\)] \\(.*\\):\\([0-9]*\\):\\([0-9]*\\): .*" 2 3))
(add-to-list 'compilation-error-regexp-alist '("\\[ant:checkstyle] \\[\\(WARN\\|ERROR\\|INFO\\)] \\(.*\.java\\):\\([0-9]*\\): .*" 2 3))

(add-to-list 'compilation-error-regexp-alist '("^:\w+:[a-zA-Z]*\\([\w/]\\):\\([0-9]*\\):\\(\w+\\)" 1 2 4))
(add-to-list 'compilation-error-regexp-alist '("^\\(.*\\)\\.java: line \\([0-9]*\\), col \\([0-9]*\\), \\(Error\\|Warning\\) - \\(.*\\)$" 1 2 3))
(add-to-list 'compilation-error-regexp-alist '("^:[a-zA-Z-.]*:[a-zA-Z-.]*:[a-zA-Z-.]*\\(/.*\\.java\\):\\([0-9]*\\): \\(error\\):\\(.*\\)" 1 2 3))

;;; Javadoc Roots
(javadoc-add-roots (expand-file-name "~/src/java/undertow-javadoc"))
(javadoc-add-roots (expand-file-name "~/src/java/gradle/gradle-3.5/docs/javadoc"))

(javadoc-add-artifacts [org.json json "20160212"]
                       [org.apache.httpcomponents httpclient "4.3.3"]
                       [junit junit "4.12"]
                       [com.android.tools.build gradle "2.3.0"]
		       [io.netty netty-all "4.1.8.Final"])

;;; Hooks for java-mode
;;;; Annotations
(add-hook 'java-mode-hook
	  (lambda ()
	    "Treat annotations properly"
	    (setq c-comment-start-regexp "(@|/(/|[*][*]?))")
	    (modify-syntax-entry ?@ "< b" java-mode-syntax-table)))

