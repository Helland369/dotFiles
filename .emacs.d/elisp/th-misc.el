;;; misc-th.el --- Misc packages                     -*- lexical-binding: t; -*-

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

;; Helpful // look up stuff
(use-package helpful
  :defer t
  :ensure t
  :custom
  (counsel-describe-function-function #'helpful-callable)
  (counsel-describe-variable-function #'helpful-variable)
  :bind
  ([remap describe-function] . counsel.describe-function)
  ([remap describe-command] . helpful-command)
  ([remap describe-variabel] . counsel-describe-variable)
  ([remap describe-key] . helpful-key))

;; Hacker news
(use-package hackernews)

(push '("\\`\\*hackernews .*\\*\\'" display-buffer-same-window)
      display-buffer-alist)

;; Flyspell // spell check // requires aspell // pacman -S aspell aspell-en aspell-nb

;; Change to English spell check
(defun th-flyspell-english ()
  "Switch to English spell check."
  (interactive)
  (ispell-change-dictionary "english")
  (flyspell-buffer))

;; Change to Norwegian spell check
(defun th-flyspell-norwegian ()
  "Switch to Norwegian spell check."
  (interactive)
  (ispell-change-dictionary "norwegian")
  (flyspell-buffer))

(add-hook 'text-mode-hook 'flyspell-mode)
(add-hook 'org-mode-hook 'flyspell-mode)
;;(add-hook 'prog-mode-hook 'flyspell-mode)

;; lorem ipsum // generate random text
(use-package lorem-ipsum)

(provide 'th-misc)
;;; th-misc.el ends here
