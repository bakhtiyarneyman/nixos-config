(scroll-bar-mode -1)
(menu-bar-mode -1)
(tool-bar-mode -1)

;; disable default startup screen
(setq inhibit-startup-screen t)
(setq initial-scratch-message nil)

(global-display-line-numbers-mode t)

(defun my-after-frame (frame)
  (if (display-graphic-p frame)
      (progn
        (add-to-list 'default-frame-alist '(font . "Cascadia Code-11"))
        (set-face-attribute 'default nil :font "Cascadia Code-11" :height 100)
        (set-frame-font "Cascadia Code-11" (frame-list)))))

(mapc 'my-after-frame (frame-list))
(add-hook 'after-make-frame-functions 'my-after-frame)
