(defvar outline-hook-alist
  '(c++-mode-hook
    c-mode-hook
    cperl-mode-hook
    emacs-lisp-mode-hook
    lisp-mode-hook
    perl-mode-hook
    sh-mode-hook
    ;;;java-mode
    js2-mode
    perl-mode-hook
    cperl-mode-hook )
  "alist of hooks to add outline-minor-mode to."
)

(defun xxtjaxx/outline-add-hooks ()
  (dolist (hook outline-hook-alist)
    (add-hook hook 'outline-minor-mode))
  )

(xxtjaxx/outline-add-hooks)
