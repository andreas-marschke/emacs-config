;;; emacs-rc-jvm.el --- Configuration of JVM-related language support

;; Copyright (C) 2019 Andreas Marschke

;; Author: Andreas Marschke <emacs@andreas-marschke.name>
;; Created: 21.04.2019
;; Version: 0.1
;; Package-Requires: (())
;; Keywords: 
;; URL:
;;; Commentary:
;; This module describes all of the packages used for development in jvm-based languages and environments.
;; This includes documentation, codehighlighting and completion.
;;; Code:

(use-package memoize
  :ensure t)

;;; Hightlighting

(use-package jdee
  :requires
  (memoize)
  :mode (("\\.java\\'" . jdee-mode)
         ("\\.aj\\'" . jdee-mode))
  :custom
  (bsh-jar "/usr/share/java/bsh.jar")
  (jdee-flycheck-enable-p nil)
  (jdee-server-dir  "~/.emacs.d/elisp/jdee-server/target")
  :config
  
  (add-to-list 'compilation-error-regexp-alist-alist '(ant-checkstyle-line-only . ("\\[ant:checkstyle\\] \\[[A-Z]*\\] \\(.*\\):\\([0-9]*\\): .*" 1 2 nil)) t)
  (add-to-list 'compilation-error-regexp-alist-alist '(ant-checkstyle-line-column . ("\\[ant:checkstyle\\] \\[[A-Z]*\\] \\(.*\\):\\([0-9]*\\):\\([0-9]*\\): .*" 1 2 3)) t)
  (add-to-list 'compilation-error-regexp-alist-alist '(aspectj-ajc-line-error . ("\\(/.*\\.aj\\):\\([0-9]*\\)\s*\\[[a-z]*\\].*" 1 2 nil)) t)
  (add-to-list 'compilation-error-regexp-alist-alist '(gp-javac-line-col . ("^\\(?:\s+\\)?\\(?:[a-zA-Z-:]+\\)? \\[\\(WARN\\|ERROR\\|INFO\\)] \\(.*\\):\\([0-9]*\\):\\([0-9]*\\): .*" 2 3)) t)
  (add-to-list 'compilation-error-regexp-alist-alist '(android-manifest-merger . ("^Merging result:\s*\\(.*\\)$" 1 nil nil 0)) t)
  (add-to-list 'compilation-error-regexp-alist-alist '(junit-test-path . ("^[0-9]*\s*\\(-->\\(.*\\):\\([0-9]*\\):\\([0-9]*\\)-\\([0-9]*\\).*\\|\\)$" 2 3 4 0)) t)

  (add-to-list 'compilation-error-regexp-alist-alist '(file-url-path . ("\\(file://.*\\)" 1 nil nil 1)) t)
  (add-to-list 'compilation-error-regexp-alist 'file-url-path t)
  
  (add-to-list 'compilation-error-regexp-alist 'android-manifest-merger t)
  (add-to-list 'compilation-error-regexp-alist 'aspectj-ajc-line-error t)
  ;; Add col first or it will pick the line version and that will make no one happy
  (add-to-list 'compilation-error-regexp-alist 'ant-checkstyle-line-column t)
  (add-to-list 'compilation-error-regexp-alist 'ant-checkstyle-line-only t)
  (add-to-list 'compilation-error-regexp-alist 'gp-javac-line-col t)
  (add-to-list 'compilation-error-regexp-alist 'junit-test-path t)
  
  :requires
  projectile
  :ensure t)

(use-package kotlin-mode
  :config
  (add-to-list 'compilation-error-regexp-alist-alist '(kotlin-compiler-error-single-line . ("^\\(:?\\w+\\)?\\(e\\|w\\|i\\|d\\):\s+\\([a-z/\s-.]+\\):\s+(\\([0-9]*\\),\s+\\([0-9]*\\)):\s+\\(.*\\)\\'" 2 3 4 1)) t)
  (add-to-list 'compilation-error-regexp-alist 'kotlin-compiler-error-single-line t)
  :custom
  (kotlin-tab-width 2)
  :mode
  "\\.kt\\'"
  "\\.kts\\'"
  :ensure t)

(use-package groovy-mode
  :ensure t
  :config
  (add-to-list 'compilation-error-regexp-alist-alist '(groovy-script-compiler-error . ("^Script '\\(.*\\)' line: \\([0-9]*\\)$" 1 2)) t)
  (add-to-list 'compilation-error-regexp-alist-alist '(gradle-compiler-build-file-line-error '("^Build file '\\(.*\\)' line: \\([0-9]*\\)$" 1 2)) t)
  (add-to-list 'compilation-error-regexp-alist 'groovy-script-compiler-error t)
  (add-to-list 'compilation-error-regexp-alist 'gradle-compiler-build-file-line-error t)
  :mode
  ("\\.gradle\\'"
   "\\.groovy\\'")
  :custom
  (groovy-indent-offset 2))

;;; Code Validation

(use-package flycheck-gradle
  :ensure t
  :commands (flycheck-gradle-setup)
  :hook
  (groovy-mode . flycheck-gradle-setup)
  (jde-mode . flycheck-gradle-setup)
  (java-mode . flycheck-gradle-setup))

(use-package flycheck-kotlin
  :ensure t
  :requires (kotlin-mode)
  :hook
  (kotlin-mode . flycheck-kotlin-setup))

;;; Documentation
(use-package javadoc-lookup
  :config
  :bind ("C-h j" . javadoc-lookup)
  :ensure t)

(use-package javadoc-lookup-x
  :requires
  (javadoc-lookup)
  :load-path
  "~/.emacs.d/site-lisp"
  :config
  (javadoc-add-artifacts [com.android.tools.build builder-test-api "0.13.2"])
  (javadoc-add-artifacts [com.puppycrawl.tools checkstyle "6.19"])
  (javadoc-add-artifacts [junit junit "4.12"])
  (javadoc-add-artifacts [com.squareup.okhttp3 okhttp "3.9.0"])
  (javadoc-add-artifacts [com.squareup.retrofit2 retrofit "2.3.0"])
  (javadoc-add-artifacts [com.squareup.okhttp3 okhttp  "3.6.0"])
  (javadoc-add-artifacts [org.apache.httpcomponents httpclient-android "4.3.5.1"])

  ;; XXX: Add this conditionally based on `${rootProject.rootDir}/gradle/wrapper/gradle-wrapper.properties'
  ;;      Should be pointing to the API Docs based on the gradle version found.
  (javadoc-lookup-x/add-web-root "https://docs.gradle.org/current/javadoc")
  (javadoc-lookup-x/add-web-root "https://docs.aws.amazon.com/AWSJavaSDK/latest/javadoc/")
  (javadoc-lookup-x/add-web-root "http://docs.groovy-lang.org/latest/html/api/")
  (javadoc-add-roots (concat (getenv "ANDROID_HOME") "/docs/reference")))

;;; Decompilation

;; FIXME: How do we handle platform configuration for decompiler-paths?
(use-package jdecomp
  :ensure t
  :mode
  ("\\.class\\'" . jdecomp-mode)
  :custom
  (jdecomp-decompiler-paths
   '((cfr . "/usr/local/Cellar/cfr-decompiler/0.132/libexec/cfr_0_132.jar"))))

(provide 'emacs-rc-jvm)
