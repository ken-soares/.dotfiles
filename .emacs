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

;; org mode

(use-package epresent
  :ensure t)

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

(setq evil-default-cursor (quote (t "#bd93f9"))
    evil-visual-state-cursor '("#8be9fd" box)
    evil-normal-state-cursor '("#bd93f9" box)
    evil-insert-state-cursor '("#f1fa8c" box))

;; Vim Bindings Everywhere else
(use-package evil-collection
  :after evil
  :config
  (setq evil-want-integration t)
  (evil-collection-init))

(setq fill-column 80)
(global-display-fill-column-indicator-mode)


;; visual stuff

;; https://rubjo.github.io/victor-mono/
(add-to-list 'default-frame-alist '(font . "VictorMono SemiBold" ))
(set-face-attribute 'default t :font "VictorMono SemiBold")
(set-face-attribute 'default nil :height 150)


;; ligatures

(dolist (char/ligature-re
         `((?-  . ,(rx (or (or "-->" "-<<" "->>" "-|" "-~" "-<" "->") (+ "-"))))
           (?/  . ,(rx (or (or "/==" "/=" "/>" "/**" "/*") (+ "/"))))
           (?*  . ,(rx (or (or "*>" "*/") (+ "*"))))
           (?<  . ,(rx (or (or "<<=" "<<-" "<|||" "<==>" "<!--" "<=>" "<||" "<|>" "<-<"
                               "<==" "<=<" "<-|" "<~>" "<=|" "<~~" "<$>" "<+>" "</>"
                               "<*>" "<->" "<=" "<|" "<:" "<>"  "<$" "<-" "<~" "<+"
                               "</" "<*")
                           (+ "<"))))
           (?:  . ,(rx (or (or ":?>" "::=" ":>" ":<" ":?" ":=") (+ ":"))))
           (?=  . ,(rx (or (or "=>>" "==>" "=/=" "=!=" "=>" "=:=") (+ "="))))
           (?!  . ,(rx (or (or "!==" "!=") (+ "!"))))
           (?>  . ,(rx (or (or ">>-" ">>=" ">=>" ">]" ">:" ">-" ">=") (+ ">"))))
           (?&  . ,(rx (+ "&")))
           (?|  . ,(rx (or (or "|->" "|||>" "||>" "|=>" "||-" "||=" "|-" "|>"
                               "|]" "|}" "|=")
                           (+ "|"))))
           (?.  . ,(rx (or (or ".?" ".=" ".-" "..<") (+ "."))))
           (?+  . ,(rx (or "+>" (+ "+"))))
           (?\[ . ,(rx (or "[<" "[|")))
           (?\{ . ,(rx "{|"))
           (?\? . ,(rx (or (or "?." "?=" "?:") (+ "?"))))
           (?#  . ,(rx (or (or "#_(" "#[" "#{" "#=" "#!" "#:" "#_" "#?" "#(")
                           (+ "#"))))
           (?\; . ,(rx (+ ";")))
           (?_  . ,(rx (or "_|_" "__")))
           (?~  . ,(rx (or "~~>" "~~" "~>" "~-" "~@")))
           (?$  . ,(rx "$>"))
           (?^  . ,(rx "^="))
           (?\] . ,(rx "]#"))))
  (let ((char (car char/ligature-re))
        (ligature-re (cdr char/ligature-re)))
    (set-char-table-range composition-function-table char
                          `([,ligature-re 0 font-shape-gstring]))))

(use-package doom-themes
  :ensure t
  :config
  (load-theme 'doom-palenight t))

(use-package rainbow-mode
  :ensure t)

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))

;; dashboard
(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook))

(setq initial-buffer-choice (lambda () (get-buffer-create "*dashboard*")))
(setq dashboard-filter-agenda-entry 'dashboard-no-filter-agenda)

(setq dashboard-items '((recents  . 5)
                        (agenda . 5)))

(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)
(display-time-mode 1)
(setq display-time-24hr-format t)

(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
(add-to-list 'comint-output-filter-functions 'ansi-color-process-output)

;; random shit

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
;;(setq-default python-indent-offset custom-tab-width) ;; Python
;;(setq-default js-indent-level custom-tab-width);; Javascript
;;(setq-default rust-indent-offset custom-tab-width) ;; rust

(setq-default electric-indent-inhibit t)

(setq backward-delete-char-untabify-method 'hungry)

(setq-default evil-shift-width custom-tab-width)

(setq whitespace-style '(face tabs tab-mark trailing))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(whitespace-tab ((t (:foreground "#ccc")))))
(setq whitespace-display-mappings
  '((tab-mark 9 [124 9] [92 9]))) ; 124 is the ascii ID for '\|'
(global-whitespace-mode) ; Enable whitespace mode everywhere


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


;; golang
;; (go install golang.org/x/tools/gopls@latest
;;  go install golang.org/x/tools/cmd/goimports@latest
;;  optional: install godoc)

(require 'project)

(use-package go-mode
  :ensure t)

(defun project-find-go-module (dir)
  (when-let ((root (locate-dominating-file dir "go.mod")))
    (cons 'go-module root)))

(cl-defmethod project-root ((project (head go-module)))
  (cdr project))

(add-hook 'project-find-functions #'project-find-go-module)

(add-hook 'go-mode-hook 'eglot-ensure)

(defun eglot-format-buffer-on-save ()
  (add-hook 'before-save-hook #'eglot-format-buffer -10 t))
(add-hook 'go-mode-hook #'eglot-format-buffer-on-save)


(setq-default eglot-workspace-configuration
    '((:gopls .
        ((staticcheck . t)
         (matcher . "CaseSensitive")))))

  (add-to-list 'exec-path "~/go/bin/")

(use-package go-mode
  :ensure t
  :hook ((go-mode . lsp-deferred)
         (go-mode . company-mode))
  :bind (:map go-mode-map
              ("C-c 6" . gofmt)))

(setq gofmt-command "goimports")
(global-set-key (kbd "C-c r") #'recompile)

;; c/c++
(add-to-list 'eglot-server-programs '((c++-mode c-mode) "clangd"))
(add-hook 'c-mode-hook 'eglot-ensure)
(add-hook 'c++-mode-hook 'eglot-ensure)

;; python
(add-hook 'python-mode-hook 'eglot-ensure) ;; pip install python-lsp-server


;; managing popups

(use-package popper
  :ensure t ; or :straight t
  :bind (("C-`"   . popper-toggle-latest)
         ("M-`"   . popper-cycle)
         ("C-M-`" . popper-toggle-type))
  :init
  (setq popper-reference-buffers
        '("\\*Messages\\*"
          "Output\\*$"
          "\\*Async Shell Command\\*"
          help-mode
          compilation-mode))
  (popper-mode +1)
  (popper-echo-mode +1))

;; programming things

(use-package evil-surround
  :ensure t
  :config
  (global-evil-surround-mode 1))

;; makes emacs snappier
(add-function :after after-focus-change-function
  (defun me/garbage-collect-maybe ()
    (unless (frame-focus-state)
      (garbage-collect))))

(use-package evil-multiedit
  :ensure t
  :config
  (evil-multiedit-default-keybinds))

(use-package vertico
  :init
  (vertico-mode)

  ;; Show more candidates
  (setq vertico-count 8)

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

(global-set-key (kbd "C-c l") 'compile)

(add-hook 'before-save-hook
          'delete-trailing-whitespace)

(electric-pair-mode 1)
(setq electric-pair-pairs
      '(
        (?\" . ?\")
        (?\{ . ?\})))

(use-package magit
  :ensure t)

(use-package vterm
  :ensure t)

(use-package emmet-mode
  :ensure t)

(use-package which-key
  :ensure t
  :config
  (which-key-mode 1))

(use-package fold-this
  :ensure t
  :config
    (global-set-key (kbd "C-c f") 'fold-this)
    (global-set-key (kbd "C-c u") 'fold-this-unfold-all))

(setq backup-inhibited t)
(setq auto-save-default nil)

(set-keyboard-coding-system nil)


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
   '(epresent popper evil-surround evil-multiedit go-mode xterm-color which-key vterm vertico use-package undo-fu tree-sitter-langs solo-jazz-theme solarized-theme smartparens rust-mode rainbow-mode powerline perspective paredit org-superstar magit lsp-java gruvbox-theme fzf fold-this expand-region evil-collection emmet-mode eglot eclim dracula-theme doom-themes doom-modeline dashboard darcula-theme company command-log-mode)))
