;; -*- lexical-binding: t; -*-
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


;; startup
(setq initial-scratch-message
"\"An idiot admires complexity. A genius admires simplicity.
A physicist tries to make it simple, anyway. An idiot- anything,
the more complicated it is, the more he will admire it.
If you make something so clusterfucked he can't understand it,
he's gonna think you're a god cause' you made it so complicated
nobody can understand it.\" - Terry A. Davis")

;; org mode

(use-package org-superstar
  :ensure t)
(add-hook 'org-mode-hook (lambda () (org-superstar-mode 1)))

(setq org-log-done t)
(setq org-agenda-files '("~/agenda.org"))
(global-set-key (kbd "C-c a") 'org-agenda)

;; Vim bindings
(use-package evil
  :demand t
  :bind (("<escape>" . keyboard-escape-quit))
  :init
  ;; allows for using cgn
  ;; (setq evil-search-module 'evil-search)
  (setq evil-want-keybinding nil)
  :config
  (evil-mode 1))

;;; Vim Bindings Everywhere else
(use-package evil-collection
  :after evil
  :config
  (setq evil-want-integration t)
  (evil-collection-init))

;; visual stuff

;;(set-frame-parameter (selected-frame) 'alpha-background '(95 . 90))
;;(add-to-list 'default-frame-alist '(alpha-background . (95. 90)))

(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
(add-to-list 'comint-output-filter-functions 'ansi-color-process-output)


(setq fill-column 80)
(global-display-fill-column-indicator-mode)

;; solarized, dracula, darcula, gruvbox otherwise

(use-package solo-jazz-theme
  :ensure t
  :config
  (load-theme 'solo-jazz t))

(use-package rainbow-mode
  :ensure t)

;;works well with solo-jazz
(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))

(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)
(display-time-mode 1)
(setq display-time-24hr-format t)

(setq inhibit-startup-screen t)

;; stolen tabs config
;; Create a variable for our preferred tab width
(setq custom-tab-width 4)

;; Two callable functions for enabling/disabling tabs in Emacs
(defun disable-tabs () (setq indent-tabs-mode nil))
(defun enable-tabs  ()
  (local-set-key (kbd "TAB") 'tab-to-tab-stop)
  (setq indent-tabs-mode t)
  (setq tab-width custom-tab-width))

;; Hooks to Enable Tabs

(add-hook 'prog-mode-hook 'enable-tabs)
;; Hooks to Disable Tabs
(add-hook 'lisp-mode-hook 'disable-tabs)
(add-hook 'emacs-lisp-mode-hook 'disable-tabs)
;; Language-Specific Tweaks
(setq-default python-indent-offset custom-tab-width) ;; Python
(setq-default js-indent-level custom-tab-width);; Javascript
(setq-default rust-indent-offset custom-tab-width) ;; rust

;; Making electric-indent behave sanely
(setq-default electric-indent-inhibit t)

;; Make the backspace properly erase the tab instead of
;; removing 1 space at a time.
(setq backward-delete-char-untabify-method 'hungry)

;; (OPTIONAL) Shift width for evil-mode users
;; For the vim-like motions of ">>" and "<<".
(setq-default evil-shift-width custom-tab-width)

;; WARNING: This will change your life
;; (OPTIONAL) Visualize tabs as a pipe character - "|"
;; This will also show trailing characters as they are useful to spot.

(setq whitespace-style '(face tabs tab-mark trailing))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(whitespace-tab ((t (:background "#fafafa" :foreground "#ccc")))))
(setq whitespace-display-mappings
  '((tab-mark 9 [124 9] [92 9]))) ; 124 is the ascii ID for '\|'
(global-whitespace-mode) ; Enable whitespace mode everywhere

(set-face-attribute 'default nil :font "FiraCode Retina" :height 120)
(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode)


(dolist (mode '(org-mode-hook
                term-mode-hook
                vterm-mode-hook
                shell-mode-hook
                treemacs-mode-hook
                eshell-mode-hook))
  (add-hook mode (lambda() (display-line-numbers-mode 0))))

(dolist (mode '(org-mode-hook
                term-mode-hook
                vterm-mode-hook
                shell-mode-hook
                treemacs-mode-hook
                eshell-mode-hook))
  (add-hook mode (lambda() (display-fill-column-indicator-mode 0))))

;; completion stuff

(use-package company
  :ensure t
  :config
  (setq company-idle-delay 0)
  (setq company-minimum-prefix-length 2)
  (global-company-mode t))

(use-package yasnippet
  :ensure t
  :config
  (yas-global-mode 1))

(use-package eglot
  :ensure t
  :config
  (add-hook 'foo-mode-hook 'eglot-ensure))

;; language specific configuration

;; rust
(use-package rust-mode
  :ensure t)

(add-hook 'rust-mode-hook
          (lambda () (prettify-symbols-mode)))

(setq rust-format-on-save t)
(define-key rust-mode-map (kbd "C-c C-r") 'rust-run) ;; ooh fancy!
(add-to-list 'eglot-server-programs '(rust-mode-hook "rust-analyzer"))
(add-hook 'rust-mode-hook 'eglot-ensure)

;; c/c++
(add-to-list 'eglot-server-programs '((c++-mode c-mode) "clangd"))
(add-hook 'c-mode-hook 'eglot-ensure)
(add-hook 'c++-mode-hook 'eglot-ensure)

;; python
(add-hook 'python-mode-hook 'eglot-ensure) ;; pip install python-lsp-server

(use-package vertico
  :init
  (vertico-mode)

  ;; Different scroll margin
  ;; (setq vertico-scroll-margin 0)

  ;; Show more candidates
  ;; (setq vertico-count 20)

  ;; Grow and shrink the Vertico minibuffer
  (setq vertico-resize t)

  ;; Optionally enable cycling for `vertico-next' and `vertico-previous'.
  ;; (setq vertico-cycle t)
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

  ;; Enable recursive minibuffers
  (setq enable-recursive-minibuffers t))


;; programming things

(use-package tree-sitter-langs
  :ensure t)

(use-package tree-sitter
  :config
  (require 'tree-sitter-langs)
  (global-tree-sitter-mode)
  (add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode))

(global-set-key (kbd "C-c l") 'compile)

(add-hook 'before-save-hook
          'delete-trailing-whitespace)

(use-package magit
  :ensure t)

(use-package vterm
  :ensure t)

(use-package emmet-mode
  :ensure t)



(use-package fzf ;; requires fzf package on system
  :config
  (setq fzf/args "-x --color bw --print-query --margin=1,0 --no-hscroll"
        fzf/executable "fzf"
        fzf/git-grep-args "-i --line-number %s"
        ;; command used for `fzf-grep-*` functions
        ;; example usage for ripgrep:
        ;; fzf/grep-command "rg --no-heading -nH"
        fzf/grep-command "grep -nrH"
        ;; If nil, the fzf buffer will appear at the top of the window
        fzf/position-bottom t
        fzf/window-height 15))

(global-set-key (kbd "C-c s") 'fzf-find-file)

;; workspaces
(use-package perspective
  :custom
  (persp-mode-prefix-key (kbd "C-x x"))  ; pick your own prefix key here
  :init
  (persp-mode))


(use-package smartparens
  :ensure t
  :config
  (smartparens-mode 1))

;; for emacs keybindings
(use-package which-key
  :ensure t
  :config
  (which-key-mode 1))

(use-package expand-region
  :bind ("C-=" . er/expand-region))



;; backups and autosaves which I hate and never want to see ever again thanks

(setq backup-inhibited t)
(setq auto-save-default nil)

(set-keyboard-coding-system nil)


;; keycasting
(use-package command-log-mode
  :ensure t)

;;  M-x global-command-log-mode
;; clm/open-command-log-buffer

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(c-basic-offset 4)
 '(c-default-style
   '((c-mode . "stroustrup")
     (java-mode . "java")
     (awk-mode . "awk")
     (other . "stroustrup")))
 '(package-selected-packages
   '(lsp-java smartparens smartparens-config paredit solo-jazz-theme tomorrow-theme solarized-theme modus-operandi-theme fzf command-log-mode command-log tree-sitter-langs tree-sitter which-key dracula-theme yasnippet powerline rainbow-mode perspective expand-region emmet-mode vterm magit maggit eglot company vertico use-package undo-fu evil-collection)))
