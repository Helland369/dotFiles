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

(defun th-flyspell-english ()
  "Switch to English spell check."
  (interactive)
  (ispell-change-dictionary "english")
  (flyspell-buffer))

(defun th-flyspell-norwegian ()
  "Switch to Norwegian spell check."
  (interactive)
  (ispell-change-dictionary "norwegian")
  (flyspell-buffer))

(use-package pdf-tools
  :ensure t
  :config
  (pdf-tools-install)
  (setq pdf-view-continuous t)
  (add-hook 'pdf-view-mode-hook (lambda () (display-line-numbers-mode -1))))

;;(setq pdf-view-midnight-colors '("#ffffff" . "#000000"))
(add-to-list 'auto-mode-alist '("\\.dpf\\'" . pdf-view-mode))

;; Discord status
;; (use-package elcord
;;   :ensure t
;;   :config
;;   (setq elcord-edit-icon "emacs"
;;         elcord-application-id "383226320970055681" ;; Default id for Emacs in discord
;;         elcord-display-buffer-details t ;; Show file mane in stats
;;         elcord-show-time t)
;;   :hook (after-init . elcord-mode))
;; (elcord-mode 1)

(provide 'th-misc)
;;; th-misc.el ends here
