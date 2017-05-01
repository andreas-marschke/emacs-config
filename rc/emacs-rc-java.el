(add-hook
 'java-mode-hook
 (lambda ()
   "Treat annotations properly"
   (setq c-comment-start-regexp "(@|/(/|[*][*]?))")
   (modify-syntax-entry ?@ "< b" java-mode-syntax-table)))

(add-to-list 'compilation-error-regexp-alist '("^:\w+:[a-zA-Z]*\\([\w/]\\):\\([0-9]*\\):\\(\w+\\)" 1 2 4))

(add-to-list 'compilation-error-regexp-alist '("^\\(.*\\)\\.java: line \\([0-9]*\\), col \\([0-9]*\\), \\(Error\\|Warning\\) - \\(.*\\)$" 1 2 3))

;; Checkstyle matching from gradle
(add-to-list 'compilation-error-regexp-alist '("\\[ant:checkstyle] \\[\\(WARN\\|ERROR\\)] \\(.*\\):\\([0-9]*\\):\\([0-9]*\\): .*" 2 3))
(add-to-list 'compilation-error-regexp-alist '("\\[ant:checkstyle] \\[\\(WARN\\|ERROR\\)] \\(.*\.java\\):\\([0-9]*\\): .*" 2 3))
(javadoc-add-roots "/Users/amarschke/src/java/undertow-javadoc")
(javadoc-add-roots "/Users/amarschke/src/java/gradle/gradle-3.5/docs/javadoc")
(javadoc-add-artifacts [org.json json "20160212"]
                       [org.apache.httpcomponents httpclient "4.3.3"]
                       [junit junit "4.12"]
                       [com.android.tools.build gradle "2.3.0"])
