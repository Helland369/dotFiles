;;; th-evil.el --- Evil mode // vim motion           -*- lexical-binding: t; -*-

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

;; Vim motion
(use-package evil
  :init
  (setq evil-respect-visual-line-mode t
        evil-want-integration t
        evil-want-keybinding nil
        evil-vsplit-window-right t
        evil-spilt-window-below t)
  :config
  (evil-mode t)
  (evil-set-initial-state 'dashboard 'normal)
  (evil-set-undo-system 'undo-redo))

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
  "ca" 'calc
  "cc" 'evilnc-comment-or-uncomment-lines
  "dd" 'dired
  "df" 'ediff-files
  "dF" 'ediff-files3
  "es" 'eshell
  "ev" 'eval-buffer
  "ff" 'counsel-find-file
  "fg" 'counsel-rg
  "fz" 'counsel-fzf
  "gg" 'magit-status
  "ha" 'hs-show-all
  "hb" 'hs-hide-block
  "hm" 'hs-minor-mode-menu
  "ho" 'hs-show-block
  "hs" 'hs-minor-mode
  "ib" 'ivy-switch-buffer
  "lc" 'lsp-execute-code-action
  "lD" 'lsp-ui-doc-show
  "lf" 'lsp-format-region
  "lF" 'lsp-format-buffer
  "ii" 'counsel-imenu
  "lI" 'lsp-ui-imenu
  "ld" 'lsp-ui-peek-find-definitions
  "li" 'lsp-ui-peek-find-implementation
  "lr" 'lsp-ui-peek-find-references
  "lR" 'lsp-rename
  "oa" 'org-agenda
  "oh" 'org-html-export-to-html
  "om" 'org-md-export-to-markdown
  "ot" 'org-set-tags-command
  "ss" 'shell
  "w=" 'count-words
  "xd" 'xref-find-defenitions)


;; comment blocks easyer 
(use-package evil-nerd-commenter
  :bind ("M-/" . evilnc-comment-or-uncomment-lines))

;; non leader keys

;; scroll up
(define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)

;;make C-u, C-b, C-f, C-d better
(defun recenter-after-scroll (&rest _)
  "Recenter screen after scrolling"
  (evil-scroll-line-to-center nil))

(advice-add 'evil-scroll-up :after #'recenter-after-scroll)
(advice-add 'evil-scroll-down :after #'recenter-after-scroll)
(advice-add 'evil-scroll-page-up :after #'recenter-after-scroll)
(advice-add 'evil-scroll-page-down :after #'recenter-after-scroll)

(evil-global-set-key 'normal (kbd "g b") 'evil-next-buffer)
(evil-global-set-key 'normal (kbd "g B") 'evil-prev-buffer)


(provide 'th-evil)
;;; th-evil.el ends here
