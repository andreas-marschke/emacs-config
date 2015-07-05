(add-hook
 'java-mode-hook
 (lambda ()
   "Treat annotations properly"
   (setq c-comment-start-regexp "(@|/(/|[*][*]?))")
   (modify-syntax-entry ?@ "< b" java-mode-syntax-table)))

(add-hook
 'java-mode-hook
 (lambda ()
   "Use proper style and indent"
   (c-set-style "stroustrup")
   (setq c-basic-offset 2
	 tab-width 2
	 indent-tabs-mode nil)))
