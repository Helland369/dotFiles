;; -*- lexical-binding: t; -*-

;; Evil mode // supperior motion keys
(use-package evil
  :init
  (setq evil-respect-visual-line-mode t)
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  (setq evil-vsplit-window-right t)
  (setq evil-spilt-window-below t)
  :config
  (evil-mode t)
  (evil-set-initial-state 'dashboard 'normal))

;; Adding to evil Evil
(evil-set-undo-system 'undo-redo)

;; Extending evil mode
(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

;; Evil leader
(define-prefix-command 'th-leader-map)

(keymap-set evil-motion-state-map "SPC" 'th-leader-map)
(keymap-set evil-normal-state-map "SPC" 'th-leader-map)

(evil-define-key nil th-leader-map
  "ff" 'counsel-find-file
  "bi" 'ibuffer
  "ib" 'ivy-switch-buffer
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
  "cc" 'evilnc-comment-or-uncomment-lines
  "xd" 'xref-find-defenitions
  "w=" 'count-words
  "wd" 'downcase-word
  "wu" 'upcase-word
  "ef" 'ediff-files
  "eF" 'ediff-files3
  "dd" 'dired
  "ii" 'counsel-imenu
  "ss" 'speedbar
  "wj" 'th-js2-web-mode)

;; "ft" 'treemacs
;; "pf" 'projectile-find-file
;; "li" 'lsp-ui-imenu
;; "gg" 'magit-status

;; Move a whole text block // M+k // M+j
(define-key evil-normal-state-map (kbd "M-k") 'evil-collection-unimpaired-move-text-up)
(define-key evil-normal-state-map (kbd "M-j") 'evil-collection-unimpaired-move-text-down)

;; Scroll up wiht M+U
(define-key evil-normal-state-map (kbd "M-u") 'evil-scroll-up)

;; Evil nerd commenter // mass comment / uncomment
(use-package evil-nerd-commenter
  :bind ("M-/" . evilnc-comment-or-uncomment-lines))




(provide 'th-evil)
