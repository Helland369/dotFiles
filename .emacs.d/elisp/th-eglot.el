;;; th-eglot.el --- Eglot                            -*- lexical-binding: t; -*-

;; Copyright (C) 2024

;; Author:  <Thomas Helland>
;; Keywords: Elisp

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

(use-package eglot
  :ensure t
  :hook
  (((c-ts-mode c++-ts-mode) . eglot-ensure)
   ((js2-mode js-ts-mode) . eglot-ensure)
   ((html-mode web-mode) eglot-ensure)
   ((css-ts-mode) eglot-ensure))
   :config
   (setq eglot-autoshutdown t)
   (setq eglot-events-buffer-size 100000)
   (add-to-list 'eglot-server-programs
                '((js2-mode js-ts-mode) . ("/usr/bin/typescript-language-server" "--stdio"))) ;;; "--tsserver-inlay-hints"
   (add-to-list 'eglot-server-programs
                '((c-ts-mode c++-ts-mode) . ("clangd" "--clang-tidy" "--header-insertion=never" "--inlay-hints=true")))
   (add-hook 'eglot-managed-mode-hook 'flymake-mode)
   (add-hook 'eglot-managed-mode-hook 'eglot-inlay-hints-mode))





(provide 'th-eglot)
;;; th-eglot.el ends here
