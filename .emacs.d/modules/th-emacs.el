;;; th-emacs.el --- Emacs settings                -*- lexical-binding: t; -*-

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

;;(menu-bar-mode -1)
;;(tool-bar-mode -1)
;;(scroll-bar-mode -1)

;; line and column number
;;(global-display-line-numbers-mode t)
;;(global-visual-line-mode t)
;;(setq column-number-mode t)

;; indentation
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

(electric-pair-mode 1)

;; Save cursor possition
(when (< emacs-major-version 25)
    (require 'saveplace)
    (setq-default save-place t))

(when (> emacs-major-version 25)
    (save-place-mode 1))

;; No more startup screen
(setq inhibit-startup-screen t)

;; tabs
(setq tab-bar-show nil)
;;(setq tab-bar-new-tab-choice "*dashboard*")

;; No bacup file
(setq make-backup-files nil)

;; Auto revert // update file on disc change
(global-auto-revert-mode t)

;; Dired updater in disc change
(setq global-auto-revert-non-file-buffers t)
(setq auto-revert-verbose nil) ;; optional
(setq auto-revert-use-notify t)

(provide 'th-emacs)
;;; th-emacs.el ends here
