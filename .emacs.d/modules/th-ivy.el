;;; th-ivy.el --- M-x menu // ivy / counsel / swiper          -*- lexical-binding: t; -*-

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

;; better M-x menu
(use-package ivy
  :defer 0.1
  :diminish
  :bind
  (("C-c C-r" . ivy-resume)
   ("C-x B" . ivy-switch-buffer-other-window))
   :custom
   (setq ivy-count-format "(%d/%d) "
         ivy-use-virtual-buffers t
         enable-recursice-minibuffers t)
   :config
   (global-set-key (kbd "C-s") 'swiper-isearch)
   (global-set-key (kbd "M-x") 'counsel-M-x)
   (global-set-key (kbd "C-x C-f") 'counsel-find-file)
   (global-set-key (kbd "C-x b") 'counsel-switch-buffer)
   (global-set-key (kbd "C-c b") 'counsel-bookmark)
   (global-set-key (kbd "C-c d") 'counsel-descbinds)
   (ivy-mode))

;; find stuff
(use-package counsel
  :after ivy
  :config (counsel-mode))

;; find more stuff
(use-package swiper
  :after ivy
  :bind
  (("M-s" . swiper)
   ("M-i" . swiper)))

;; ivy icons
(use-package nerd-icons-ivy-rich
  :ensure t
  :init
  (nerd-icons-ivy-rich-mode 1)
  (ivy-rich-mode 1))

;; better looking ivy
(use-package ivy-rich
  :after ivy
  :custom
  (ivy-virtual-abbreviate 'full
                          ivy-rich-switch-buffer-align-virtual-buffer t
                          ivy-rich-path-style 'abbrev)
  :config
  (ivy-rich-mode 1))

;; ivy in the midle of the screen
(use-package ivy-posframe
  :config
  (ivy-posframe-mode 1))


(provide 'th-ivy)
;;; th-ivy.el ends here
