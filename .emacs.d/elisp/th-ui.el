;; -*- lexical-binding: t; -*-

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
  (dashboard-center-content nil)
  (dashboard-icon-type 'nerd-icons)
  (dashboard-items '((recents . 6)
                      (bookmarks . 6)
                      (projects . 6)
                      (agenda))))

;; Make dashboard the startup screen
(add-hook 'afther-init-hook (lambda ()
                              (unless (dashboard-initial-buffer-p)
                                (dashboard-refresh-buffer))))

(setq initial-buffer-choice (lambda () (get-buffer "*dashboard*")))

(use-package doom-themes)
(setq doom-themes-enable-bold t
      doom-themes-enable-italic t)
(load-theme 'doom-monokai-spectrum t)

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode t))



(provide 'th-ui)
