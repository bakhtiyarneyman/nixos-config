(setq custom-file (concat user-emacs-directory "custom.el"))
(when (file-exists-p custom-file)
  (load custom-file))

(add-hook 'org-mode-hook (lambda ()
                           (display-line-numbers-mode -1)
                           (toggle-truncate-lines)
                           (toggle-word-wrap)))

(require 'package)

(setq package-enable-at-startup nil) ; disable the packages initialization

(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)

(package-initialize) ; initalize the packages again

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(use-package gruvbox-theme
  :ensure t ; this will ensure that the package will be installed
  :config
  (load-theme 'gruvbox-dark-medium t)) ; load the theme

(use-package emojify
  :ensure t
  :hook (after-init . global-emojify-mode))

(use-package which-key
  :ensure t
  :config
  (which-key-mode))

(use-package dashboard
  :ensure t
  :init
  (progn
    (setq initial-buffer-choice (lambda () (get-buffer "*dashboard*"))) ; fix for emascclient
    (setq dashboard-startup-banner "~/.emacs.d/girl.png")
    (setq dashboard-banner-logo-title "Stop watching hentai"))
  :config
  (dashboard-setup-startup-hook))

(setq dashboard-set-heading-icons t)
(setq dashboard-set-file-icons t)

(use-package doom-modeline
  :ensure t
  :config
  (doom-modeline-mode))

(use-package all-the-icons
  :ensure t
  :if (display-graphic-p))

(use-package evil
  :ensure t
  :init
  (setq evil-want-keybinding nil)
  (setq evil-vsplit-window-right t)
  (setq evil-split-window-below t)
  (setq display-line-numbers-type 'relative)
  :config
  (evil-mode))

(use-package evil-collection
  :after evil
  :ensure t
  :config
  (evil-collection-init))

(use-package eglot
  :ensure t
  :init
  (add-hook 'eglot-server-initialized-hook #'company-mode))

;;(use-package lsp-ui
;;  :ensure t
;;  :commands lsp-ui-mode)

(use-package company
  :ensure t)

(use-package company-box
  :after company
  :ensure t)

(use-package tree-sitter
  :ensure t)

(use-package tsc
  :ensure t)

(use-package direnv
  :ensure t
  :config
  (direnv-mode))

(use-package nix-mode
  :ensure t)

(add-to-list 'eglot-server-programs '(nix-mode . ("rnix-lsp")))

(add-hook 'nix-mode-hook 'eglot-ensure)

(add-to-list 'eglot-server-programs
	     '(python-mode . ("pyright-langserver" "--stdio")))

(add-hook 'python-mode-hook #'tree-sitter-hl-mode)

(use-package rustic
  :ensure t
  :config
  (setq rustic-lsp-client 'eglot)
  (setq rustic-lsp-server 'rust-analyzer))

(add-to-list 'eglot-server-programs
	     '((or js-mode ts-mode) . ("typescript-language-server" "--stdio")))
