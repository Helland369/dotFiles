;;; th-treesit.el --- Treesitter config  -*- lexical-binding: t; -*-

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

(setq treesit-language-source-alist
      '((cmake "https://github.com/uyha/tree-sitter-cmake")
        (go "https://github.com/tree-sitter/tree-sitter-go")
        (json "https://github.com/tree-sitter/tree-sitter-json")
        (make "https://github.com/alemuller/tree-sitter-make")
        (cpp "https://github.com/tree-sitter/tree-sitter-cpp")
        (c "https://github.com/tree-sitter/tree-sitter-c")
        (gomod "https://github.com/camdencheek/tree-sitter-go-mod")))

(setq treesit-font-lock-level 4)

(setq major-mode-remap-alist
      '((c++-mode . c++-ts-mode)
        (c-mode . c-ts-mode)
        (go-mode . go-ts-mode)))

;; TODO may need to edit
(use-package cmake-ts-mode
  :mode (("\\CMakeLists.txt\\'" . cmake-ts-mode)
         ("\\.cmake\\'" . cmake-ts-mode)))

(use-package json-ts-mode
  :mode ("\\.json\\'" . json-ts-mode))

(use-package go-ts-mode
  :mode ("\\.go\\'" . go-ts-mode)
  :config
  (setq treesit-indent-function 4))


(provide 'th-treesit)
;;; th-treesit.el ends here
