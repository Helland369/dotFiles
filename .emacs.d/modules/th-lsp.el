;;; th-lsp.el --- Lsp mode                           -*- lexical-binding: t; -*-

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


;; Lsp mode // make coding great. definitely no frustration
(use-package lsp-mode
  :defer t
  :init
  (setq lsp-keymap-prefix "C-c l")
  :hook
  (c-mode . lsp-mode)
  (c++-mode . lsp-mode)
  (csharp-mode . lsp-mode)
  (js2-mode . lsp-mode)
  (typescript-mode . lsp-mode)
  (web-mode . lsp-mode)
  (css-mode . lsp-mode)
  (vue-mode . lsp)
  (lsp-mode . lsp-enable-which-key-integration)
  :commands lsp
  :config
  (setq lsp-inlay-hint-enable t)
  (setq lsp-eldoc-enable-hover t)
  (setq lsp-eldoc-render-all t)
  (setq eldoc-echo-area-use-multiline-p t)
  (setq lsp-lens-enable t)
  (setq lsp-modeline-diagnostics-enable t)
  (setq lsp-signature-auto-activate t)
  (setq lsp-signature-render-documentation t)
  (setq lsp-completion-show-detail t)
  (setq lsp-completion-show-kind t)
  (setq lsp-restart 'auto-restart)
  (setq lsp-auto-import t)
  (setq lsp-enable-file-watchers t)
  (setq lsp-enable-symbol-highlighting t)
  (setq lsp-volar-take-over-mode nil))
  ;;(setq lsp-clients-clangd-executable "ccls"))

;; Help lsp mode behave?
;;(setq lsp-file-watch-threshold 5000)

;; Lsp ui // see you frustration
(use-package lsp-ui
  :after lsp-mode
  :hook (lsp-mode . lsp-ui-mode)
  :commands lsp-ui-mode
  :config
  (define-key lsp-ui-mode-map [remap xref-find-definitions] #'lsp-ui-peek-find-definitions)
  (define-key lsp-ui-mode-map [remap xref-find-references] #'lsp-ui-peek-find-references)
  (setq lsp-ui-sideline-show-diagnostics nil)
  (setq lsp-ui-sideline-show-hover nil)
  (setq lsp-ui-sideline-show-code-actions nil)
  (setq lsp-ui-doc-enable nil)
  (setq lsp-ui-doc-show-with-cursor t)
  (setq lsp-ui-doc-show-with-mouse nil)
  (setq lsp-ui-doc-side 'right)
  (setq lsp-ui-doc-position 'at-point))

(use-package lsp-ivy)


(use-package dap-mode
  :defer t)


(provide 'th-lsp)
;;; th-lsp.el ends here
