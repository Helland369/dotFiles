;;; th-org.el --- org mode                           -*- lexical-binding: t; -*-

;; Copyright (C) 2024  

;; Author:  <th>
;; Keywords: 

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

;; org general
(setq org-directory "~/org")

;; org modern
(use-package org-modern
  :ensure t
  :hook ((org-mode . org-modern-mode)
         (org-agenda-finalize . org-modern-agenda)))

  (with-eval-after-load 'org
    (global-org-modern-mode))

;; org agenda
(setq calendar-week-start-day 1) ;; start calendar on monday instead of sunday

(setq org-agenda-files '("~/org/todo.org"))





(provide 'th-org)
;;; th-org.el ends here
