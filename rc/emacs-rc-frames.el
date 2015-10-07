;;; via: http://www.emacswiki.org/emacs/SettingFrameColorsForEmacsClient

;; Using emacs --daemon and emacsclient I have often had cause to use emacs at the terminal,
;; but I like to have a colour scheme in my graphical frames that is unreadable in the console.
;; This code lives in my .emacs file and allows me to setup color and font settings for
;; graphical frames, but leave the console frames to use the default colour scheme.
;; I've found this very useful.  Tested with Emacs 24.0.50.1 @ 2010-20-07 -- Geoff Teale

(defun setup-window-system-frame-colours (&rest frame)
  (if window-system
      (let ((f (if (car frame)
		   (car frame)
		 (selected-frame))))
	(progn
	  (set-frame-font "Terminus-9")
	  (require 'color-theme)

	  (let ((color-theme-is-global nil))
	    (select-frame (selected-frame))
	    (color-theme-euphoria)
	    )
	  ))))
(defadvice server-create-window-system-frame
    (after set-window-system-frame-colours ())
  "Set custom frame colours when creating the first frame on a display"
  (setup-window-system-frame-colours))


(ad-activate 'server-create-window-system-frame)

(add-hook 'after-make-frame-functions 'setup-window-system-frame-colours t)
