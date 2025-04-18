(setq inhibit-startup-message t)
(scroll-bar-mode  -1) ;disable visible scroll
(tool-bar-mode  -1) ;disable the toolbar
(tooltip-mode  -1) ;disable tooltips
(set-fringe-mode 10) ;give some breathing room
(menu-bar-mode -1) ;disable the menu bar

(global-set-key (kbd "<escape>") 'keyboard-escape-quit)
(require 'package)
(package-initialize)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			 ("melpa-stable" . "https://stable.melpa.org/packages/") 
			 ("org" . "https://orgmode.org/elpa/")
			 ("elpa" . "https://elpa.gnu.org/packages/")))
(unless (boundp 'package-archive-contents)
  (package-refresh-contents))
; initialize use package on non-linux
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)
(set-face-attribute 'default nil :height 130)
;;themes
(use-package kanagawa-themes
  :ensure t
  :config
  (load-theme 'kanagawa-wave t))

;;(global-font-lock-mode 1)

(column-number-mode)
(global-display-line-numbers-mode t)
(dolist (mode '(org-mode-hook
                term-mode-hook
		eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))
(use-package swiper :ensure t)
(use-package eglot
  :ensure t
  :hook ((c++-mode . eglot-ensure)
	 (c-mode . eglot-ensure)))

(setq eglot-server-programs '((c++-mode . ("clangd"))
                              (c-mode . ("clangd"))))
(use-package ivy
  :diminish
  :bind (("C-f" . swiper)
	 :map ivy-minibuffer-map
	 ("TAB" . ivy-alt-done)
	 :map ivy-switch-buffer-map
	 ("C-l" . ivy-done)
	 ("C-d" . ivy-switch-buffer-kill)
	 :map ivy-reverse-i-search-map
	 ("C-d" . ivy-reverse-i-search-kill))
  :config
  (ivy-mode 1))
(use-package counsel
  :ensure t
  :bind (("C-x C-f" . counsel-find-file)
	 ("M-x" . counsel-M-x)
	 ("C-x C-b" . counsel-ibuffer)
	 :map minibuffer-local-map
	 ("C-r" . 'counsel-minibuffer-history))
  :config
  (setq ivy-initial-inputs-alist nil))
;;hotkeys


(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
  :custom ((doom-modeline-height 15)))
 
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(go-complete eglot go-mode ivy)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
