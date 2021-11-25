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

(defvar java-stack-trace-dir "src/")
(defun java-stack-trace-regexp-to-filename ()
  "Generates a relative filename from java-stack-trace regexp match data."
  (concat java-stack-trace-dir
          (replace-regexp-in-string "\\." "/" (match-string 1))
          (match-string 2)))

;; (add-to-list 'compilation-error-regexp-alist-alist '(java-stack-trace . ("^[[:space:]]*at \\(\\(?:[[:lower:]]+\\.\\)+\\)[^(]+(\\([[:alnum:]]+\\.java\\):\\([[:digit:]]+\\))" java-stack-trace-regexp-to-filename 3)) t)
;; (add-to-list 'compilation-error-regexp-alist 'java-stack-trace)

;; (add-to-list 'compilation-error-regexp-alist-alist '(aspectj-ajc-line-error  . ("^\\(/.*\\.aj\\):\\([0-9]*\\)\s*\\[[a-z]*\\]" 1 2)) t)
;; (add-to-list 'compilation-error-regexp-alist-alist '(gp-javac-line-col       . ("^\\(?:\s+\\)?\\(?:[a-zA-Z-:]+\\)? \\[\\(WARN\\|ERROR\\|INFO\\)] \\(.*\\):\\([0-9]*\\):\\([0-9]*\\): " 2 3 1 1)) t)
;; (add-to-list 'compilation-error-regexp-alist-alist '(android-manifest-merger . ("^Merging result:\s*\\(.*\\)" 1 nil nil 0)) t)
;; (add-to-list 'compilation-error-regexp-alist-alist '(junit-test-path         . ("^[0-9]*\s*\\(\\-\\->\\(.*\\):\\([0-9]*\\):\\([0-9]*\\)\\-\\([0-9]*\\).*\\|\\)" 2 nil nil 0)) t)
;; (add-to-list 'compilation-error-regexp-alist-alist '(file-url-path           . ("\\(file://.*\\)" 1 nil nil 1)) t)
;; (add-to-list 'compilation-error-regexp-alist-alist '(groovy-script-compiler-error . ("^Script '\\(.*\\)' line: \\([0-9]*\\)" 1 2)) t)
;; (add-to-list 'compilation-error-regexp-alist-alist '(gradle-build-file-line-error . ("^Build file '\\(.*\\)' line: \\([0-9]*\\)" 1 2)) t)
;; (add-to-list 'compilation-error-regexp-alist-alist '(kotlin-compiler-single-line . ("^\\(:?\\w+\\)?\\(e\\|w\\|i\\|d\\):\s+\\([a-z/\s-.]+\\):\s+(\\([0-9]*\\),\s+\\([0-9]*\\)):\s+\\(.*\\)'" 2 3 4 1)) t)

;; (add-to-list 'compilation-error-regexp-alist-alist '(java-checkstyle-line-warn-error . ("\\(?:\\[ant:checkstyle\\] \\[\\w*\\] \\)\\(.*\\(\.java\\|\.kt\\)\\):\\([0-9]+\\): \\(.*\\)" 1 2 3 1)) t)
;; (add-to-list 'compilation-error-regexp-alist-alist '(java-checkstyle-linecol-warn-error . ("\\(?:\\[ant:checkstyle\\] \\[\\w*\\] \\)\\(.*\\):\\([0-9]+\\):\\([0-9]+\\)?: \\(.*\\)" 1 2 3 1)) t)

;; (add-to-list 'compilation-error-regexp-alist 'java-checkstyle-linecol-warn-error t)
;; (add-to-list 'compilation-error-regexp-alist 'java-checkstyle-line-warn-error t)

;; (add-to-list 'compilation-error-regexp-alist 'java-checkstyle-line-warn-error t)

;; (add-to-list 'compilation-error-regexp-alist 'file-url-path t)
;; (add-to-list 'compilation-error-regexp-alist 'android-manifest-merger t)
;; (add-to-list 'compilation-error-regexp-alist 'aspectj-ajc-line-error t)

;; ;; Add col first or it will pick the line version and that will make no one happy
;; (add-to-list 'compilation-error-regexp-alist 'gp-javac-line-col t)
;; (add-to-list 'compilation-error-regexp-alist 'junit-test-path t)

;; (add-to-list 'compilation-error-regexp-alist 'groovy-script-compiler-error t)
;; (add-to-list 'compilation-error-regexp-alist 'gradle-build-file-line-error t)
;; (add-to-list 'compilation-error-regexp-alist 'kotlin-compiler-single-line t)

(use-package scala-mode
  :ensure t)

(use-package kotlin-mode
  :config
  :custom
  (kotlin-tab-width 2)
  :mode
  "\\.kt\\'"
  "\\.kts\\'"
  :ensure t)

(use-package groovy-mode
  :ensure t
  :config
  :mode
  ("\\.gradle\\'"
   "\\.groovy\\'")
  :custom
  (groovy-indent-offset 2))

;;; Language Server Mode

(use-package spinner
  :load-path "~/.emacs.d/elisp/spinner-el/"
  :defines spinner-current)

;; (use-package lsp-mode
;;   :ensure lsp-java
;;   :init
;;   (setq lsp-keymap-prefix "C-c l")
;;   :commands
;;   lsp
;;   :hook
;;   ((java-mode . lsp)
;;    (js2-mode . lsp)
;;    ;; if you want which-key integration
;;    (lsp-mode . lsp-enable-which-key-integration))
  
;;   :custom
;;   ((lsp-java-vmargs '("-XX:+UseParallelGC"
;;                       "-XX:GCTimeRatio=4"
;;                       "-XX:AdaptiveSizePolicyWeight=90"
;;                       "-Dsun.zip.disableMemoryMapping=true"
;;                       "-Xmx2G"
;;                       "-Xms100m"
;;                       "--add-opens java.base/java.net=ALL-UNNAMED"))
;;    (lsp-java-java-path (concat (getenv "JAVA_HOME") "/bin/java"))
;;    (lsp-java-jdt-download-url "https://download.eclipse.org/jdtls/milestones/1.4.0/jdt-language-server-1.4.0-202109161824.tar.gz")
;;    (lsp-client-packages '(ccls
;;                          ;; lsp-actionscript
;;                          ;; lsp-ada lsp-angular
;;                          lsp-bash
;;                          lsp-clangd
;;                          ;; lsp-clojure
;;                          lsp-cmake
;;                          ;; lsp-crystal
;;                          ;; lsp-csharp
;;                          lsp-css
;;                          lsp-java
;;                          ;; lsp-d
;;                          ;; lsp-dart
;;                          ;; lsp-dhall
;;                          lsp-dockerfile
;;                          ;; lsp-elm lsp-elixir lsp-erlang
;;                          lsp-eslint
;;                          ;; lsp-fortran lsp-fsharp lsp-gdscript lsp-go lsp-hack lsp-grammarly
;;                          lsp-groovy
;;                          ;;lsp-haskell lsp-haxe
;;                          lsp-javascript
;;                          lsp-json
;;                          lsp-kotlin
;;                          lsp-lua
;;                          ;; lsp-nim lsp-nix lsp-metals lsp-ocaml
;;                          lsp-perl
;;                          ;; lsp-php lsp-pwsh lsp-pyls lsp-python-ms lsp-purescript lsp-r lsp-rf lsp-rust lsp-solargraph lsp-sorbet
;;                          lsp-tex
;;                          ;; lsp-terraform lsp-vala lsp-verilog lsp-vetur lsp-vhdl lsp-vimscript lsp-xml
;;                          lsp-yaml
;;                          lsp-sqls
;;                          ;;lsp-svelte lsp-steep lsp-zig
;;                          ))))

;; (use-package lsp-java
;;   :custom
;;   :ensure t
;;   :after lsp)

;; (use-package helm-lsp
;;   :ensure t
;;   :commands helm-lsp-workspace-symbol)

;;; Code Validation

(use-package flycheck-gradle
  :ensure t
  :commands (flycheck-gradle-setup)
  :hook
  ((groovy-mode . flycheck-gradle-setup)
  (jde-mode . flycheck-gradle-setup)
  (java-mode . flycheck-gradle-setup)))

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
  (javadoc-add-artifacts [com.amazonaws aws-java-sdk-bundle "1.12.40"])
  (javadoc-add-artifacts [com.puppycrawl.tools checkstyle "6.19"])
  (javadoc-add-artifacts [junit junit "4.12"])
  (javadoc-add-artifacts [com.squareup.okhttp3 okhttp "3.9.0"])
  (javadoc-add-artifacts [com.squareup.retrofit2 retrofit "2.3.0"])
  (javadoc-add-artifacts [com.squareup.okhttp3 okhttp  "3.6.0"])
  (javadoc-add-artifacts [org.apache.httpcomponents httpclient-android "4.3.5.1"])
  (javadoc-add-artifacts [com.squareup.retrofit2 adapter-rxjava2 "2.3.0"])
  (javadoc-add-artifacts [org.aspectj aspectjtools "1.9.1"])
  (javadoc-add-artifacts [org.apache.spark spark-core_2.12 "2.4.3"])
  
  (javadoc-add-artifacts [org.scala-lang scala-library "2.12.6"])
  ;;(javadoc-add-artifacts [com.android.tools.build gradle-api "2.3.3"])
  
  ;; XXX: Add this conditionally based on `${rootProject.rootDir}/gradle/wrapper/gradle-wrapper.properties'
  ;;      Should be pointing to the API Docs based on the gradle version found.
  (javadoc-lookup-x/add-web-root "https://docs.gradle.org/current/javadoc")
  (javadoc-lookup-x/add-web-root "https://docs.aws.amazon.com/AWSJavaSDK/latest/javadoc/")
  (javadoc-lookup-x/add-web-root "http://docs.groovy-lang.org/latest/html/api/")
  (javadoc-lookup-x/add-web-root "https://static.javadoc.io/io.reactivex/rxandroid/1.2.1")
  (javadoc-lookup-x/add-web-root "http://google.github.io/android-gradle-dsl/javadoc/3.2/")
  (javadoc-lookup-x/add-web-root "https://spark.apache.org/docs/latest/api/java/")
  (javadoc-add-roots (concat (getenv "ANDROID_HOME") "/docs/reference")))

;;; Decompilation

;; FIXME: How do we handle platform configuration for decompiler-paths?
(use-package jdecomp
  :ensure t
  :mode
  ("\\.class\\'" . jdecomp-mode)
  :custom
  (jdecomp-decompiler-paths
   '((cfr . "/Users/amarschk/src/java/cfr/cfr-0.150.jar"))))

(provide 'emacs-rc-jvm)
