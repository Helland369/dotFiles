;;; dev-th.el --- General programming related packages  -*- lexical-binding: t; -*-

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

;; Magit // the better way to get git
(use-package magit)

;; Auto revert magit // update on disc change
(magit-auto-revert-mode t)

;; Company // auto compleate dropdown thing
(use-package company
  :ensure t
  ;;:after lsp-mode
  :hook (prog-mode . company-mode)
   :bind
  (:map company-active-map
         ("<tab>" . company-complete-selection))
  ;; (:map lsp-mode-map
  ;;       ("<tab>" . company-indent-or-complete-common))
  :custom
  (company-minimum-prefix-length 1)
  (company-idle-delay 0.2)
  :config
  (global-company-mode 1))

;; Nicer looking company box
(use-package company-box
  :hook (company-mode . company-box-mode))

(use-package highlight-indent-guides)
(add-hook 'prog-mode-hook 'highlight-indent-guides-mode)

;; Flycheck // make red / grenn line
;; (use-package flycheck
;;   :diminish flycheck-mode
;;   :init
;;   (global-flycheck-mode))

;; Which key // what key to press ?
(use-package which-key
  :config
  (which-key-mode))

;; Templates
(auto-insert-mode 1)
(setq auto-insert-directory "~.emacs.d/template")
(define-auto-insert "\\.html$" "html-template.html")
(setq auto-insert-query nil)


;; Rainbow delimiter // colorful brackets
(use-package rainbow-delimiters
 :hook (prog-mode . rainbow-delimiters-mode))

;; Built in project package
(require 'project)


(provide 'th-dev)
;;; th-dev.el ends here
