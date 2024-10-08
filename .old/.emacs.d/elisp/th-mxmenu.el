;; -*- th-mxmenu: utf-8; lexical-binding: t; -*-
;;; code:

;; Ivy
(use-package counsel
  :after ivy
  :config (counsel-mode))

(use-package ivy
  :defer 0.1
  :diminish
  :bind
  (("C-c C-r" . ivy-resume)
   ("C-x B" . ivy-switch-buffer-other-window))
  :custom
  (setq ivy-count-format "(%d/%d) ")
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t)
  :config
  (global-set-key (kbd "C-s") 'swiper-isearch)
  (global-set-key (kbd "M-x") 'counsel-M-x)
  (global-set-key (kbd "C-x C-f") 'counsel-find-file)
  (global-set-key (kbd "C-x b") 'ivy-switch-buffer)
  (global-set-key (kbd "C-c b") 'counsel-bookmark)
  (global-set-key (kbd "C-c d") 'counsel-descbinds)
  (ivy-mode))

;;(gloabal-set-key (kbd "C-M-j") 'counsel-switch-buffer)

(use-package swiper
  :after ivy
  :bind
  (("C-s" . swiper)
   ("C-r" . swiper)))

(use-package nerd-icons-ivy-rich
  :ensure t
  :init
  (nerd-icons-ivy-rich-mode 1)
  (ivy-rich-mode 1))

(use-package ivy-rich
    :after ivy
    :custom
    (ivy-virtual-abbreviate 'full
    ivy-rich-switch-buffer-align-virtual-buffer t
    ivy-rich-path-style 'abbrev)
    :config
    (ivy-rich-mode 1))



(provide 'th-mxmenu)
;;; mxmenu.el ends here
