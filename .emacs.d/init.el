;;; in.el --- init el                                -*- lexical-binding: t; -*-

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

;; Icrease gc treshold during starup
;;(setq gc-cons-threshold most-positive-fixnum)

;; Temporarily disable file name handlers
;;(defvar file-name-handler-alist-old file-name-handler-alist)
;;(setq file-name-handler-alist nil)

;; Reset gc treshold and file name handler
;;(add-hook 'emacs-starup-hook
;;	  (lambda ()
;;		 (setq gc-cons-threshold 100000000)
;;		 (setq file-name-handler-alist file-name-handler-alist-old)))


(set-face-attribute 'default nil
		     :font "NotoMono Nerd Font"
		     :height 120
             :width 'expanded
		     :weight 'medium)
		     ;;:slant 'normal)

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(add-to-list 'load-path (expand-file-name "elisp" user-emacs-directory))

(require 'th-settings)
(require 'th-use-pkg)
(require 'th-ui)
(require 'th-evil)
(require 'th-ivy)
(require 'th-misc)
(require 'th-files)
(require 'th-dev)
(require 'th-lsp)
(require 'th-web-dev)
(require 'th-org)
;;(require 'th-eglot)


(provide 'init.el)
;;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(elcord emacs-discord-rpc yasnippet-snippets yasnippet flymake-eslint dap-mode eglot pdf-tools which-key web-mode rainbow-delimiters prettier-js org-modern nerd-icons-ivy-rich magit lsp-ui lsp-ivy js2-mode highlight-indent-guides helpful hackernews flycheck evil-nerd-commenter evil-collection doom-themes doom-modeline dashboard counsel company-web company-box)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
