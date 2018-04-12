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
(add-to-list 'compilation-error-regexp-alist '("^:[a-zA-Z-.]*:.*Javac\\(/.*\\.java\\):\\([0-9]*\\): \\(error\\):.*" 1 2 3))
;;; Javadoc Roots
(javadoc-add-roots "/Users/amarschke/src/java/undertow-javadoc")
(javadoc-add-roots "/Users/amarschke/src/java/gradle/gradle-3.5/docs/javadoc")

(javadoc-add-artifacts [org.json json "20160212"]
                       [org.apache.httpcomponents httpclient "4.3.3"]
                       [junit junit "4.12"]
                       [com.android.tools.build gradle "2.3.0"]
                       [io.netty netty-all "4.1.8.Final"]
                       [commons-logging commons-logging "1.0.4"]
                       [com.google.android android "4.1.1.4"]
                       [com.squareup.retrofit2 retrofit "2.0.2"]
                       [com.squareup.retrofit2 converter-gson "2.0.2"]
                       [com.squareup.okhttp3 okhttp "3.4.1"]
                       [com.squareup.okio okio "1.14.0"])

;;; Hooks for java-mode
;;;; Annotations
(add-hook 'java-mode-hook
          (lambda ()
            "Treat annotations properly"
            (setq c-comment-start-regexp "(@|/(/|[*][*]?))")
            (modify-syntax-entry ?@ "< b" java-mode-syntax-table)))


;; Handle FIXME/TODO/XXX properly in java-mode 
(custom-set-faces
 '(java-annotation-todo-face ((t (:foreground "blue")))))

(add-hook 'java-mode-hook
          (lambda ()
            (font-lock-add-keywords
             'java-mode
             '(("\\<\\(FIXME\\|TODO\\|XXX\\):" 1 java-annotation-todo-face t)))
            ))
;; (add-hook 'java-mode-hook
;;           (lambda ()
;;             (add-to-list (make-local-variable 'company-backends)
;;                          'company-javadoc-lookup)))


(custom-set-variables
 '(jdee-server-dir "~/.emacs.d/elisp/jdee-server/target")
 '(jdibug-source-paths
   (quote
    ("~/src/soasta/source/WebApplications/Concerto/src/"))))
(setq jdibug-source-paths
      (list "/Users/amarschke/src/soasta/source/WebApplications/Concerto/src"
            "/Library/Java/JavaVirtualMachines/jdk1.8.0_71.jdk/Contents/Home/src"))

(custom-set-faces
 '(jdibug-breakpoint-disabled ((t (:background "green" :foreground "black"))))
 '(jdibug-breakpoint-enabled ((t (:background "red" :foreground "white"))))
 '(jdibug-breakpoint-unresolved ((t (:background "yellow" :foreground "black"))))
 '(jdibug-current-frame ((t (:background "blue" :foreground "white"))))
 '(jdibug-current-line ((t (:background "black" :foreground "red")))))
