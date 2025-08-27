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

;; magit a better way to git
(use-package magit)
(magit-auto-revert-mode 1)

;; using github in emacs
;;(use-package forge)

;; editing .gitignore files and other files related to git
(use-package git-modes)

;; highlight TODO comments in magit
(use-package magit-todos
  :after magit)

;; show diff in the side line
(use-package diff-hl
  :config
  (global-diff-hl-mode))

;; autocompleation
(use-package company
  :ensure t
  :hook (prog-mode . company-mode)
  ;;:bind
  ;; (:map company-active-map
  ;;       ("<tab>" . company-complete-selection))
  :custom
  (company-minimum-prefix-length 1)
  ;;(company-idle-delay 0.2)
  (global-company-mode 1)
  :config
  (global-company-mode 1))

;; better looking autocompleation
(use-package company-box
  :hook (company-mode . company-box-mode))

;; linting // error cheking
(use-package flycheck
  :diminish flycheck-mode
  :init
  (global-flycheck-mode)
  :custom
  (setq flycheck-javascript-eslint-executable "/usr/bin/eslint"))

;; indent guide
(use-package highlight-indent-guides
  :hook (prog-mode . highlight-indent-guides-mode)
  :custom
  (setq highlight-indent-guides-method 'character))

;; colorful brackets
(use-package rainbow-delimiters
 :hook (prog-mode . rainbow-delimiters-mode))

;; snippets
(use-package yasnippet
  :config
  (yas-global-mode 1))


;; ms-sql
(setq sql-ms-program "sqlcmd")
(setq sql-ms-options '("-S" "localhost" "-C"))
(add-hook 'sql-mode-hook 'sql-highlight-ms-keywords)

(use-package slime
  :ensure t
  :init
  (setq inferior-lisp-program "sbcl")
  :config
  (slime-setup '(slime-fancy slime-company)))

(use-package slime-company
  :ensure t)

(provide 'th-dev)
;;; th-dev.el ends here
