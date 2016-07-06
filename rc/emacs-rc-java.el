(add-hook
 'java-mode-hook
 (lambda ()
   "Treat annotations properly"
   (setq c-comment-start-regexp "(@|/(/|[*][*]?))")
   (modify-syntax-entry ?@ "< b" java-mode-syntax-table)))

(add-to-list 'compilation-error-regexp-alist '("^:\w+:[a-zA-Z]*\\([\w/]\\):\\([0-9]*\\):\\(\w+\\)" 1 2 4))

(add-to-list 'compilation-error-regexp-alist '("^\\(.*\\)\\.java: line \\([0-9]*\\), col \\([0-9]*\\), \\(Error\\|Warning\\) - \\(.*\\)$" 1 2 3))
