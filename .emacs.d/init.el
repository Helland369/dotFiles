;;; package --- summary
;;; commentary:
;;; code:
;; Use-Package
;;

;; use package
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(package-refresh-contents)
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(setq use-package-always-ensure t)
(require 'use-package)

;; Theme

(use-package doom-themes)
  ;;:ensure t
  ;;:config
  (setq doom-themes-enable-bold t
	doom-themes-enable-italic t)
  (load-theme 'doom-monokai-spectrum t)

;; Doom Mode line

(use-package nerd-icons
  :custom
  (nerd-icons-font-family "Symbols Nerd Font Mono"))

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode t))

;; Emacs settings

(set-face-attribute 'default nil
		    :font "NotoSansMNerdFont"
		    :height 130
		    :weight 'medium)
;; UI stuff
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
;; Line/Column numbers
(global-display-line-numbers-mode t)
(global-visual-line-mode 1)
(setq column-number-mode t)
;; Indensts
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq-default indent-line-function 'c-indent-line)
(setq indent-line-function 'insert-tab)
(setq-default c-basic-offset 4) ;; set indet for c / cpp ;; set indet for c / cpp
;; Aouto close brackets
(electric-pair-mode 1)
;; Save cursor position
(when (< emacs-major-version 25)
  (require 'saveplace)
  (setq-default save-place t))

(when (>= emacs-major-version 25)
  (save-place-mode 1))

;; Turn of emacs startup screen
(setq inhibit-startup-screen t)

;; Tab bar
(setq tab-bar-show nil)
(setq tab-bar-new-tab-choice "*dashboard*")

;; Evil Mode
(use-package evil
    :init
    (setq evil-respect-visual-line-mode t)
    (setq evil-want-integration t)
    (setq evil-want-keybinding nil)
    (setq evil-vspilt-window-right t)
    (setq evil-split-window-below t)
    :config
    (evil-mode t)
    (evil-set-initial-state 'dashboard-mode 'normal))

(use-package evil-collection
    :after evil
    :config
    (evil-collection-init))

;; Evil leader
(define-prefix-command 'my-leader-map)

(keymap-set evil-motion-state-map "SPC" 'my-leader-map)
(keymap-set evil-normal-state-map "SPC" 'my-leader-map)

(evil-define-key nil my-leader-map
    "ff" 'counsel-find-file
    "bi" 'ivy-switch-buffer
    "bb" 'counsel-bookmark
    "t2" 'tab-new
    "t0" 'tab-close
    "tm" 'tab-move
    "tu" 'tab-bar-undo-close-tab
    "tt" 'tab-bar-select-tab-by-name
    "wv" 'evil-window-vsplit
    "ws" 'evil-window-split
    "wl" 'evil-window-right
    "wh" 'evil-window-left)


;; Dashboard
(use-package dashboard
    :config
    (dashboard-setup-startup-hook)
    :custom
    (dashboard-set-heading-icons t)
    (dashboard-set-file-icons t)
    (dashboard-startup-banner 'logo)
    (dashboard-center-content nil)
    (dashboard-icon-type 'nerd-icons)
    (dashboard-items '((recents . 5)
                            (bookmarks . 5)
                            (projects . 5)
                            (registers . 5))))

;; Ivy
(use-package counsel
  :after ivy
  :config (counsel-mode))

(use-package ivy
  :defer 0.1
  :diminish
  :bind
  (("C-c C-r" . ivy-resume)
   ("C-x B" . ivy-switch-buffer-other-window))
  :custom
  (setq ivy-count-format "(%d/%d) ")
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t)
  :config
  (global-set-key (kbd "C-s") 'swiper-isearch)
  (global-set-key (kbd "M-x") 'counsel-M-x)
  (global-set-key (kbd "C-x C-f") 'counsel-find-file)
  (global-set-key (kbd "C-x b") 'ivy-switch-buffer)
  (global-set-key (kbd "C-c b") 'counsel-bookmark)
  (global-set-key (kbd "C-c d") 'counsel-descbinds)
  (ivy-mode))

;;(gloabal-set-key (kbd "C-M-j") 'counsel-switch-buffer)

(use-package swiper
  :after ivy
  :bind
  (("C-s" . swiper)
   ("C-r" . swiper)))

(use-package nerd-icons-ivy-rich
  :ensure t
  :init
  (nerd-icons-ivy-rich-mode 1)
  (ivy-rich-mode 1))

(use-package ivy-rich
    :after ivy
    :custom
    (ivy-virtual-abbreviate 'full
    ivy-rich-switch-buffer-align-virtual-buffer t
    ivy-rich-path-style 'abbrev)
    :config
    (ivy-rich-mode 1))

;; Projectile
(use-package projectile
  :diminish projectile-mode
  :config (projectile-mode)
  :bind-keymap
  ("C-c p" . projectile-command-map)
  ;;:init
  ;;(when (file-directory-p "~/project")
  ;;(setq projectile-project-search-path '("~/project")))
  ;;(setq projectile-switch-project-action #'projectile-dired)
  )
;; C-c p-p then M-o for extended menu.
(use-package counsel-projectile
    :config
    (counsel-projectile-mode))

;; LSP Mode
(use-package lsp-mode
    :init
    (setq lsp-keymap-prefix "C-c l")
    :hook
    ((html-mode . lsp)
    (css-mode . lsp)
    (js-mode . lsp)
    (c-mode . lsp)
    (c++-mode . lsp)
    (csharp-mode . lsp)
    (rst-mode . lsp)
    (web-mode . lsp)
    (lsp-mode . lsp-enable-which-key-integration))
    :commands lsp)

(use-package lsp-ui
    :after lsp-mode
    :hook (lsp-mode . lsp-ui-mode)
    :commands lsp-ui-mode
    :config
    (define-key lsp-ui-mode-map [remap xref-find-definitions] #'lsp-ui-peek-find-definitions)
    (define-key lsp-ui-mode-map [remap xref-find-references] #'lsp-ui-peek-find-references)
    (setq lsp-ui-sideline-show-diagnostics nil)
    (setq lsp-ui-sideline-show-hover nil)
    (setq lsp-ui-doc-enable t)
    (setq lsp-ui-doc-position 'bottom))

(use-package lsp-ivy)

(use-package lsp-treemacs)
(lsp-treemacs-sync-mode 1)

;; Dap Mode
(use-package dap-mode)

;; Indent Guide
(use-package highlight-indent-guides)
(add-hook 'prog-mode-hook 'highlight-indent-guides-mode)

;; Company
(use-package company
    :after lsp-mode
    :hook (prog-mode . company-mode)
    :bind
    (:map company-active-map
    ("<tab>" . company-complete-selection))
    (:map lsp-mode-map
    ("<tab>" . company-indent-or-complete-common))
    :custom
    (company-minimum-prefix-length 1)
    (company-idle-delay 0.2))

(use-package company-box
    :hook(company-mode . company-box-mode))

;; Flycheck
(use-package flycheck
    :diminish flycheck-mode
    :init
    (global-flycheck-mode))

;; Web Mode
(use-package web-mode
    :custom-face
    (css-selector ((t (:inherit default :foreground "#66CCFF"))))
    (font-lock-comment-face ((t (:foreground "#828282"))))
    :mode
    ("\\.phtml\\'" "\\.tpl\\.php\\'" "\\.[agj]sp\\'" "\\.as[cp]x\\'"
    "\\.erb\\'" "\\.mustache\\'" "\\.djhtml\\'" "\\.[t]?html?\\'"))

;; Wich Key
(use-package which-key
  :config
  (which-key-mode))

;; Treemacs
(use-package treemacs
  :ensure t
  :defer t
  :init
  (with-eval-after-load 'winum
    (define-key winum-keymap (kbd "M-0") #'treemacs-select-window))
  :config
  (progn
    (setq treemacs-collapse-dirs                   (if treemacs-python-executable 3 0)
          treemacs-deferred-git-apply-delay        0.5
          treemacs-directory-name-transformer      #'identity
          treemacs-display-in-side-window          t
          treemacs-eldoc-display                   'simple
          treemacs-file-event-delay                2000
          treemacs-file-extension-regex            treemacs-last-period-regex-value
          treemacs-file-follow-delay               0.2
          treemacs-file-name-transformer           #'identity
          treemacs-follow-after-init               t
          treemacs-expand-after-init               t
          treemacs-find-workspace-method           'find-for-file-or-pick-first
          treemacs-git-command-pipe                ""
          treemacs-goto-tag-strategy               'refetch-index
          treemacs-header-scroll-indicators        '(nil . "^^^^^^")
          treemacs-hide-dot-git-directory          t
          treemacs-indentation                     2
          treemacs-indentation-string              " "
          treemacs-is-never-other-window           nil
          treemacs-max-git-entries                 5000
          treemacs-missing-project-action          'ask
          treemacs-move-files-by-mouse-dragging    t
          treemacs-move-forward-on-expand          nil
          treemacs-no-png-images                   nil
          treemacs-no-delete-other-windows         t
          treemacs-project-follow-cleanup          nil
          treemacs-persist-file                    (expand-file-name ".cache/treemacs-persist" user-emacs-directory)
          treemacs-position                        'left
          treemacs-read-string-input               'from-child-frame
          treemacs-recenter-distance               0.1
          treemacs-recenter-after-file-follow      nil
          treemacs-recenter-after-tag-follow       nil
          treemacs-recenter-after-project-jump     'always
          treemacs-recenter-after-project-expand   'on-distance
          treemacs-litter-directories              '("/node_modules" "/.venv" "/.cask")
          treemacs-project-follow-into-home        nil
          treemacs-show-cursor                     nil
          treemacs-show-hidden-files               t
          treemacs-silent-filewatch                nil
          treemacs-silent-refresh                  nil
          treemacs-sorting                         'alphabetic-asc
          treemacs-select-when-already-in-treemacs 'move-back
          treemacs-space-between-root-nodes        t
          treemacs-tag-follow-cleanup              t
          treemacs-tag-follow-delay                1.5
          treemacs-text-scale                      nil
          treemacs-user-mode-line-format           nil
          treemacs-user-header-line-format         nil
          treemacs-wide-toggle-width               70
          treemacs-width                           35
          treemacs-width-increment                 1
          treemacs-width-is-initially-locked       t
          treemacs-workspace-switch-cleanup        nil)

    ;; The default width and height of the icons is 22 pixels. If you are
    ;; using a Hi-DPI display, uncomment this to double the icon size.
    ;;(treemacs-resize-icons 44)

    (treemacs-follow-mode t)
    (treemacs-filewatch-mode t)
    (treemacs-fringe-indicator-mode 'always)
    (when treemacs-python-executable
      (treemacs-git-commit-diff-mode t))

    (pcase (cons (not (null (executable-find "git")))
                 (not (null treemacs-python-executable)))
      (`(t . t)
       (treemacs-git-mode 'deferred))
      (`(t . _)
       (treemacs-git-mode 'simple)))

    (treemacs-hide-gitignored-files-mode nil))
  :bind
  (:map global-map
        ("M-0"       . treemacs-select-window)
        ("C-x t 1"   . treemacs-delete-other-windows)
        ("C-x t t"   . treemacs)
        ("C-x t d"   . treemacs-select-directory)
        ("C-x t B"   . treemacs-bookmark)
        ("C-x t C-t" . treemacs-find-file)
        ("C-x t M-t" . treemacs-find-tag)))

(use-package treemacs-evil
  :after (treemacs evil)
  :ensure t)

(use-package treemacs-tab-bar ;;treemacs-tab-bar if you use tab-bar-mode
  :after (treemacs)
  :ensure t
  :config (treemacs-set-scope-type 'Tabs))

(use-package treemacs-nerd-icons
  :config
  (treemacs-load-theme "nerd-icons"))

(use-package treemacs-projectile
  :after (treemacs projectile)
  :ensure t)

;; Helpful
(use-package helpful
    :ensure t
    :custom
    (counsel-describe-function-function #'helpful-callable)
    (counsel-describe-variable-function #'helpful-variable)
    :bind
    ([remap describe-function] . counsel-describe-function)
    ([remap describe-command] . helpful-command)
    ([remap describe-variable] . counsel-describe-variable)
    ([remap describe-key] . helpful-key))


;; No touchy

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
    '(helpful counsel-projectile general treemacs-projectile projectile treemacs-nerd-icons treemacs-tab-bar treemacs-evil highlight-indent-guides dap-mode which-key web-mode nerd-icons-ivy-rich lsp-ui lsp-ivy flycheck evil-collection doom-themes doom-modeline dashboard counsel company-box)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;;; init.el ends here
