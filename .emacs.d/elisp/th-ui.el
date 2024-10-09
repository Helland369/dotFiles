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
  (dashboard-center-content t)
  (dashboard-display-icons-p t)
  (dashboard-icon-type 'nerd-icons))
  ;;(setq dashboard-filter-agenda-entry 'dashboard-no-filter-agenda)

  (setq dashboard-items '((recents . 5)
                      (bookmarks . 5)
                      (projects . 5)
                      (agenda . 5)))

;; Make dashboard the startup screen
(add-hook 'after-init-hook (lambda ()
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
