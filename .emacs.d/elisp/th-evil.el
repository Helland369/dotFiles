;;; evil-th.el --- Evil mode // vim motion           -*- lexical-binding: t; -*-

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

;; Evil mode // supperior motion keys
(use-package evil
  :init
  (setq evil-respect-visual-line-mode t)
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  (setq evil-vsplit-window-right t)
  (setq evil-spilt-window-below t)
  :config
  (evil-mode t)
  (evil-set-initial-state 'dashboard 'normal))

;; Adding to evil Evil
(evil-set-undo-system 'undo-redo)

;; Extending evil mode
(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

;; Evil leader
(define-prefix-command 'th-leader-map)

(keymap-set evil-motion-state-map "SPC" 'th-leader-map)
(keymap-set evil-normal-state-map "SPC" 'th-leader-map)

;; a b c d e f g h i j k l m n o p q r s t u v w x y z

(evil-define-key nil th-leader-map
  "bb" 'counsel-bookmark
  "bi" 'ibuffer
  "cc" 'evilnc-comment-or-uncomment-lines
  "dd" 'dired
  "ef" 'ediff-files
  "eF" 'ediff-files3
  "ff" 'counsel-find-file
  "gg" 'magit-status
  "ib" 'ivy-switch-buffer
  "ii" 'counsel-imenu
  "li" 'lsp-ui-imenu
  "oa" 'org-agenda
  "ss" 'speedbar
  "se" 'th-flyspell-english
  "sn" 'th-flyspell-norwegian
  "t2" 'tab-new
  "t0" 'tab-close
  "tm" 'tab-move
  "tt" 'tab-bar-select-tab-by-name
  "tu" 'tab-bar-undo-close-tab
  "w=" 'count-words
  "wd" 'downcase-word
  "wh" 'evil-window-left
  "wj" 'evil-window-bottom
  "wk" 'evil-window-top
  "wl" 'evil-window-right
  "ws" 'evil-window-split
  "wu" 'upcase-word
  "wv" 'evil-window-vsplit
  "ww" 'th-js2-web-mode
  "xd" 'xref-find-defenitions)

;; "ft" 'treemacs
;; "pf" 'projectile-find-file

;; move a whole text block // M+k // M+j
(define-key evil-normal-state-map (kbd "M-k") 'evil-collection-unimpaired-move-text-up)
(define-key evil-normal-state-map (kbd "M-j") 'evil-collection-unimpaired-move-text-down)

;; Scroll up wiht M+U
(define-key evil-normal-state-map (kbd "M-u") 'evil-scroll-up)

;; Evil nerd commenter // mass comment / uncomment
(use-package evil-nerd-commenter
  :bind ("M-/" . evilnc-comment-or-uncomment-lines))



(provide 'th-evil)
;;; th-evil.el ends here
