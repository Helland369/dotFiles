;; -*- th-config: utf-8; lexical-binding: t; -*-
;;; code:

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

;; Font
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
;;(setq-default indent-line-function 'c-indent-line)
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

;; Syntax highlight
(setq font-lock-maximum-decoration t)

;; Backup file
(setq make-backup-files nil) ;; no more backupfile

;; Auto revert // update files when they change on disc // ex if git pull
(global-auto-revert-mode t)


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


(provide 'th-config)
;;; th-config.el ends here
