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


;; Get some help while coding
(use-package lsp-mode
  :init
  (setq lsp-keymap-prefix "C-c l")
  :hook
  (c-mode      . lsp-mode)
  (c-ts-mode   . lsp-mode)
  (c++-mode    . lsp-mode)
  (c++-ts-mode . lsp-mode)
  (csharp-mode . lsp-mode)
  (rust-mode   . lsp-mode)
  (js2-mode    . lsp-mode)
  (web-mode    . lsp-mode)
  (css-mode    . lsp-mode)
  (vue-mode    . lsp-mode)
  ;;(go-mode     . lsp-mode)
  (go-ts-mode  . lsp-mode)
  (lsp-mode    . lsp-enable-which-key-integration)
  :commands lsp
  :config
  (setq lsp-inlay-hint-enable t
        lsp-eldoc-enable-hover nil
        lsp-eldoc-render-all nil
        eldoc-echo-area-use-multiline-p nil
        lsp-lens-enable t
        lsp-modeline-diagnostics-enable t
        lsp-signature-auto-activate t
        lsp-signature-render-documentation t
        lsp-completion-show-detail t
        lsp-completion-show-kind t
        lsp-restart 'auto-restart
        lsp-auto-import t
        lsp-enable-file-watchers t
        lsp-enable-symbol-highlighting t
        lsp-volar-take-over-mode nil))

;; visual aid while coding
(use-package lsp-ui
  :after lsp-mode
  :hook (lsp-mode . lsp-ui-mode)
  :config
  (with-eval-after-load 'lsp-ui
    (define-key lsp-ui-mode-map [remap xref-find-definitions] #'lsp-ui-peek-find-definitions)
    (define-key lsp-ui-mode-map [remap xref-find-references] #'lsp-ui-peek-find-references))
  (setq lsp-ui-sideline-enable nil
        lsp-ui-sideline--margin 0
        lsp-ui-sideline-show-diagnostics nil
        lsp-ui-sideline-show-hover nil
        lsp-ui-sideline-show-code-actions nil
        lsp-ui-sideline-update-mode 'line
        lsp-ui-sideline-ignore-duplicate t
        lsp-ui-sideline-diagnostic-max-lines 3
        lsp-ui-sideline-diagnostic-max-line-length 60
        lsp-ui-doc-enable nil
        lsp-ui-doc-show-with-cursor t
        lsp-ui-doc-show-with-mouse nil
        lsp-ui-doc-side 'right
        lsp-ui-doc-position 'at-point))

(use-package lsp-ivy)

;; debug
(use-package dap-mode
  :defer t)


(provide 'th-lsp)
;;; th-lsp.el ends here
