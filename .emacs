;;my emacs config

(setq package-archives
      '(("melpa" . "https://melpa.org/packages/")
        ("elpa" . "https://elpa.gnu.org/packages/")))

;;; BOOTSTRAP USE-PACKAGE
(package-initialize)
(setq use-package-always-ensure t)
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile (require 'use-package))

;; Adjust indentation settings
(setq c-default-style "linux"
      c-basic-offset 4
      tab-width 4)
(setq tab-stop-list '(4 8 12 16 20 24 28 32 36 40 44 48 52 56 60 64 68 72 76 80))
(setq-default indent-tabs-mode nil)



(use-package avy
  :ensure t
  :bind ("M-s" . avy-goto-char))

;; prompts and stuff

(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook))
(setq dashboard-center-content t)
(setq dashboard-init-info "Got addicted to Emacs, can't go back")
(setq dashboard-set-heading-icons t)
(setq dashboard-set-file-icons t)
(setq dashboard-banner-logo-title "Write once, debug everywhere")
(setq dashboard-startup-banner "/home/koneko/Pictures/EmacsDashboard.png")
(setq dashboard-footer-messages '("Life is way to short to be programming in Java man!"))
(setq dashboard-center-content t)

(use-package which-key
  :ensure t
  :config
  (which-key-mode))

;; visual stuff

(set-frame-parameter (selected-frame) 'alpha-background '(95 . 90))
(add-to-list 'default-frame-alist '(alpha-background . (95. 90)))
(set-face-attribute 'default nil :font "FiraCode Retina" :height 110)

(use-package dracula-theme
  :ensure t
  :config
  (add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
  (load-theme 'dracula t))

(use-package beacon
  :ensure t
  :config
  (beacon-mode 1))

(use-package vterm-toggle
  :ensure t
  :config
  (global-set-key [f2] 'vterm-toggle))

(setq vterm-toggle-fullscreen-p nil)
(add-to-list 'display-buffer-alist
             '((lambda (buffer-or-name _)
                   (let ((buffer (get-buffer buffer-or-name)))
                     (with-current-buffer buffer
                       (or (equal major-mode 'vterm-mode)
                           (string-prefix-p vterm-buffer-name (buffer-name buffer))))))
                (display-buffer-reuse-window display-buffer-at-bottom)
                ;;(display-buffer-reuse-window display-buffer-in-direction)
                ;;display-buffer-in-direction/direction/dedicated is added in emacs27
                ;;(direction . bottom)
                ;;(dedicated . t) ;dedicated is supported in emacs27
                (reusable-frames . visible)
                (window-height . 0.3)))

(use-package org-superstar
  :ensure t)
(add-hook 'org-mode-hook (lambda () (org-superstar-mode 1)))

(global-display-line-numbers-mode)
(add-hook 'vterm-mode-hook (lambda() (display-line-numbers-mode -1)))
(dolist (mode '(org-mode-hook
                    term-mode-hook
                    vterm-mode-hook
                    shell-mode-hook
                   treemacs-mode-hook
                    eshell-mode-hook))
  (add-hook mode (lambda() (display-line-numbers-mode 0))))

(blink-cursor-mode 0)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)
(display-time-mode 1)
(setq display-time-24hr-format t)

;; ide-like plugins

(use-package centaur-tabs
  :ensure t
  :config
  (setq centaur-tabs-set-bar 'left
        centaur-tabs-style "bar"
	centaur-tabs-set-icons nil
	centaur-tabs-height 24
	centaur-tabs-set-modified-marker t
	centaur-tabs-modifier-marker "●")
  (centaur-tabs-mode t))

(use-package emmet-mode
  :ensure t)

(use-package vterm
  :ensure t)
(add-hook 'vterm-mode-hook 'centaur-tabs-local-mode)

(use-package neotree
  :ensure t
  :config
  (setq neo-window-fixed-size nil))
(global-set-key [f8] 'neotree-toggle)

(use-package minimap
  :ensure t
  :config
  (setq minimap-window-location 'right)
  (minimap-create))

;; auto completion

(use-package company
  :ensure t
  :init
  (add-hook 'after-init-hook 'global-company-mode))

(setq company-minimum-prefix-length 2)
(setq company-idle-delay 0.15)

(use-package yasnippet
  :ensure t
  :config
  (yas-global-mode 1))

(use-package eglot
  :ensure t)

(add-to-list 'eglot-server-programs '((c++-mode c-mode) "clangd"))
(add-hook 'c++-mode-hook 'eglot-ensure)
(add-hook 'c-mode-hook 'eglot-ensure)
(add-hook 'rust-mode-hook 'eglot-ensure)
(add-hook 'javascript-mode-hook 'eglot-ensure)
(add-hook 'python-mode-hook 'eglot-ensure) ;; pip install 'python-language-server[all]' scrapy

(use-package lsp-java
  :ensure t)
(add-hook 'java-mode-hook #'lsp)


;; minibuffer completion
(use-package vertico
  :init
  (vertico-mode)

  ;; Different scroll margin
  ;; (setq vertico-scroll-margin 0)

  ;; Show more candidates
  ;; (setq vertico-count 20)
  
   (setq vertico-resize nil)

  ;; Optionally enable cycling for `vertico-next' and `vertico-previous'.
  ;;(setq vertico-cycle t)
)
;; Persist history over Emacs restarts. Vertico sorts by history position.
(use-package savehist
  :init
  (savehist-mode))

;; A few more useful configurations...
(use-package emacs
  :init
  ;; Add prompt indicator to `completing-read-multiple'.
  ;; We display [CRM<separator>], e.g., [CRM,] if the separator is a comma.
  (defun crm-indicator (args)
    (cons (format "[CRM%s] %s"
                  (replace-regexp-in-string
                   "\\`\\[.*?]\\*\\|\\[.*?]\\*\\'" ""
                   crm-separator)
                  (car args))
          (cdr args)))
  (advice-add #'completing-read-multiple :filter-args #'crm-indicator)

  ;; Do not allow the cursor in the minibuffer prompt
  (setq minibuffer-prompt-properties
        '(read-only t cursor-intangible t face minibuffer-prompt))
  (add-hook 'minibuffer-setup-hook #'cursor-intangible-mode)

  ;; Emacs 28: Hide commands in M-x which do not work in the current mode.
  ;; Vertico commands are hidden in normal buffers.
  ;; (setq read-extended-command-predicate
  ;;       #'command-completion-default-include-p)

  ;; Enable recursive minibuffers
  (setq enable-recursive-minibuffers t))


;; faster editing
(use-package expand-region
  :bind ("C-=" . er/expand-region))

(use-package multiple-cursors
  :ensure t
  :config
  (global-set-key (kbd "C->") 'mc/mark-next-like-this)
  (global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
  (global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this))

;; annoying backups and '#bullshit.crap#'
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

(set-keyboard-coding-system nil)




(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(multiple-cursors expand-region yasnippet which-key vterm-toggle vertico use-package org-superstar neotree minimap lsp-java emmet-mode eglot dracula-theme dashboard company centaur-tabs beacon)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
