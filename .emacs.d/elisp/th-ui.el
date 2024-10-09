;;; ui-th.el --- Emacs ui elements // ui packages    -*- lexical-binding: t; -*-

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

;; Icons
(use-package nerd-icons
  :ensure t
  :custom
  (nerd-icons-font-family "Symbols Nerd Font Mono"))

;; Dashboard
(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook)
  :custom
  (dashboard-set-heading-icons t)
  (dashboard-set-file-icons t)
  (dashboard-startup-banner 'logo)
  (dashboard-center-content t)
  (dashboard-display-icons-p t)
  (dashboard-icon-type 'nerd-icons))
  ;;(setq dashboard-filter-agenda-entry 'dashboard-no-filter-agenda)

  (setq dashboard-items '((recents . 5)
                      (bookmarks . 5)
                      (projects . 5)
                      (agenda . 5)))

;; Make dashboard the startup screen for emacs --daemon
;; (add-hook 'after-init-hook (lambda ()
;;                               (unless (dashboard-initial-buffer-p)
;;                                 (dashboard-refresh-buffer))))

(setq initial-buffer-choice (lambda () (get-buffer "*dashboard*")))

(use-package doom-themes)
(setq doom-themes-enable-bold t
      doom-themes-enable-italic t)
(load-theme 'doom-monokai-spectrum t)

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode t))



(provide 'th-ui)
;;; th-ui.el ends here


