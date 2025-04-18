;;; init.el --- init el                                -*- lexical-binding: t; -*-

;; Copyright (C) 2024

;; Author:  <Thomas Helland>
;; Keywords: elisp,

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

(set-face-attribute 'default nil
                    :family "Iosevka"
                    :height 120)

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; line and column number
(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode t)
(global-visual-line-mode t)
(setq column-number-mode t)

;; Man page path
(setenv "MANPATH" (string-trim (shell-command-to-string "manpath")))

;; To find lsp path
(setenv "PATH" (concat "/usr/bin" (getenv "PATH")))
(setq exec-path (append exec-path '("/usr/bin")))

(add-to-list 'load-path (expand-file-name "modules" user-emacs-directory))

(require 'th-package)
(require 'th-emacs)
(require 'th-dev)
(require 'th-evil)
(require 'th-ivy)
(require 'th-lsp)
(require 'th-misc)
(require 'th-web-dev)
(require 'th-files)
(require 'th-org)
(require 'th-ui)
(require 'th-treesit)


(provide 'init)
;;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(company-box company-web counsel cpp-ts-mode dap-mode dashboard
                 doom-modeline evil-collection evil-nerd-commenter
                 flycheck forge git-modes go-mode helpful
                 highlight-indent-guides ivy-posframe js2-mode
                 kanagawa-themes lsp-ivy lsp-ui magit magit-todos
                 nerd-icons-ivy-rich org-modern prettier-js
                 rainbow-delimiters web-mode yasnippet)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
