;;; th-dev.el --- General programming related packages  -*- lexical-binding: t; -*-

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

(use-package magit)
(magit-auto-revert-mode 1)

(use-package forge)

(use-package git-modes)

(use-package magit-todos
  :after magit)

(use-package company
  :ensure t
  :hook (prog-mode . company-mode)
  :bind
  (:map company-active-map
        ("<tab>" . company-complete-selection))
  :custom
  (company-minimum-prefix-length 1)
  ;;(company-idle-delay 0.2)
  (global-company-mode 1)
  :config
  (global-company-mode 1))

(use-package company-box
  :hook (company-mode . company-box-mode))

;; Flycheck // make red / grenn line
(use-package flycheck
  :diminish flycheck-mode
  :init
  (global-flycheck-mode))

;; Fycheck eslint
(setq flycheck-javascript-eslint-executable "/usr/bin/eslint")

;; Which key // what key to press ?
(use-package which-key
  :config
  (which-key-mode))

;; indent guide
(use-package highlight-indent-guides)
(add-hook 'prog-mode-hook 'highlight-indent-guides-mode)

;; Rainbow delimiter // colorful brackets
(use-package rainbow-delimiters
 :hook (prog-mode . rainbow-delimiters-mode))

;; Yasnippet
(use-package yasnippet
  :config
  (yas-global-mode 1))

;; Pre made snippets
(use-package yasnippet-snippets)

;; Built in project package
(require 'project)

;; ms-sql
(setq sql-ms-program "sqlcmd")
(setq sql-ms-options '("-S" "localhost" "-C"))
(add-hook 'sql-mode-hook 'sql-highlight-ms-keywords)

(provide 'th-dev)
;;; th-dev.el ends here
