;;; settings-th.el --- Emacs settings                -*- lexical-binding: t; -*-

;; Copyright (C) 2024

;; Author:  <Thomas Helland>
;; Keywords: elisp

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:

;; 

;;; Code:

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
