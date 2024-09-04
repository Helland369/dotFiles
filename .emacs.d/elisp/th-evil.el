;; -*- th-evil: utf-8; lexical-binding: t; -*-
;;; code:

(use-package evil
    :init
    (setq evil-respect-visual-line-mode t)
    (setq evil-want-integration t)
    (setq evil-want-keybinding nil)
    (setq evil-vspilt-window-right t)
    (setq evil-split-window-below t)
    :config
    (evil-mode t)
    (evil-set-initial-state 'dashboard-mode 'normal))

(use-package evil-collection
    :after evil
    :config
    (evil-collection-init))

;; Evil leader
(define-prefix-command 'my-leader-map)

(keymap-set evil-motion-state-map "SPC" 'my-leader-map)
(keymap-set evil-normal-state-map "SPC" 'my-leader-map)

(evil-define-key nil my-leader-map
    "ff" 'counsel-find-file
    "ft" 'treemacs
    "bi" 'ibuffer
    "bb" 'counsel-bookmark
    "t2" 'tab-new
    "t0" 'tab-close
    "tm" 'tab-move
    "tu" 'tab-bar-undo-close-tab
    "tt" 'tab-bar-select-tab-by-name
    "wv" 'evil-window-vsplit
    "ws" 'evil-window-split
    "wl" 'evil-window-right
    "wk" 'evil-window-top
    "wj" 'evil-window-bottom
    "wh" 'evil-window-left
    "pf" 'projectile-find-file
    "li" 'lsp-ui-imenu
    "ld" 'xref-find-definitions
<<<<<<< HEAD
    "cc" 'comment-region)
<<<<<<< HEAD
    "cc" 'evilnc-comment-or-uncomment-lines
    "g" 'magit-status)
    "cc" 'evilnc-comment-or-uncomment-lines
    "g" 'magit-status)

=======
=======
    "cc" 'evilnc-comment-or-uncomment-lines
    "g" 'magit-status)
>>>>>>> 4f4c34b (emacs)
>>>>>>> 6e81995 (emacs)
    ;;"kk" 'evil-collection-unimpaired-move-text-up
    ;;"jj" 'evil-collection-unimpaired-move-text-down

(define-key evil-normal-state-map (kbd "M-k") 'evil-collection-unimpaired-move-text-up)
(define-key evil-normal-state-map (kbd "M-j") 'evil-collection-unimpaired-move-text-down)
(define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)


(provide 'th-evil)
;;; th-evil.el ends here
