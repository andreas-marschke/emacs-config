(use-package color-theme-sanityinc-solarized
  :if (window-system)
  :functions color-theme-sanityinc-solarized
  :ensure t)

;; If we don't find a window-system for this instance we *know* it's a term emacs
;; So reset the background
(if (not window-system)
    (custom-set-faces
     '(default ((t (
                    :inherit nil
                    :extend nil
                    :stipple nil
                    :background nil
                    :foreground "#c3dde0"
                    :inverse-video nil
                    :box nil
                    :strike-through nil
                    :overline nil
                    :underline nil
                    :slant normal
                    :weight normal
                    :height 120
                    :width normal
                    :foundry nil
                    :family nil))))))
