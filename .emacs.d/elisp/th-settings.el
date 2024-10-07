;; -*- lexical-binding: t; -*-

;;; Code:

;; Line / colum numbers
(global-display-line-numbers-mode t)
(global-visual-line-mode 1)
(setq column-number-mode t)

;; Indent
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
;;(setq-default indent-line-function 'c-indent-line)
(setq indent-line-function 'insert-tab)
;; c / cpp indent
(setq-default c-basic-offser 4)

;; Auto pari / close brackets etc
(electric-pair-mode 1)

;; Save cursor possition
(when (< emacs-major-version 25)
    (require 'saveplace)
    (setq-default save-place t))

(when (> emacs-major-version 25)
    (save-place-mode 1))

;; No more startup screen
(setq inhibit-startup-screen t)

;; Window tabs//
(setq tab-bar-show nil)
(setq tab-bar-new-tab-choice "*dashboard*") ;;// need dahsboard

;; Syntax highlight
;;(setq font-lock-maximum-decoration t)

;; No bacup file
(setq make-backup-files nil)

;; Auto revert // update file on disc change
(global-auto-revert-mode t)

;; Dired updater in disc change
(setq global-auto-revert-non-file-buffers t)
(setq auto-revert-verbose nil) ;; optional
(setq auto-revert-use-notify t)



(provide 'th-settings)
;;; th-settings.el ends here
