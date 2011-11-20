;;; emacs-rc-cmake.el ---

;; Copyright (C) Alex Ott
;;
;; Author: Alex Ott <alexott@gmail.com>
;; Keywords:
;; Requirements:
;; Status: not intended to be distributed yet

;; support for CMake
(autoload 'cmake-mode "cmake-mode" t)
(add-to-list 'auto-mode-alist '("CMakeLists\\.txt\\'" . cmake-mode))
(add-to-list 'auto-mode-alist '("\\.cmake\\'" . cmake-mode))


(defun xxtjaxx/cmake-mode-hook()
  (setq compile-command  "mkdir build && cd build && cmake -DCMAKE_BUILD_TYPE=Debugfull -DCMAKE_INSTALL_PREFIX=/usr .. && make -j3 && cd ..")
  )
(add-hook 'cmake-mode-hook 'xxtjaxx/cmake-mode-hook)
;;; emacs-rc-cmake.el ends here

