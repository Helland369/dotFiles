;; -*- lexical-binding: t; -*-

;; General dev packages

;; Magit // the better way to get git
(use-package magit)

;; Auto revert magit // update on disc change
(magit-auto-revert-mode t)

;; Company // auto compleate dropdown thing
(use-package company
  :after lsp-mode
  :hook (prog-mode . company-mode)
  :bind
  (:map company-active-map
        ("<tab>" . company-complete-selection))
  (:map lsp-mode-map
        ("<tab>" . company-indent-or-complete-common))
  :custom
  (company-minimum-prefix-length 1)
  (company-idle-delay 0.2))

;; Nicer looking company box
(use-package company-box
  :hook (company-mode . company-box-mode))

(use-package highlight-indent-guides)
(add-hook 'prog-mode-hook 'highlight-indent-guides-mode)

;; Flycheck // make red / grenn line
(use-package flycheck
  :diminish flycheck-mode
  :init
  (global-flycheck-mode))

;; Which key // what key to press ?
(use-package which-key
  :config
  (which-key-mode))

;; Templates
(auto-insert-mode 1)
(setq auto-insert-directory "~.emacs.d/template")
(define-auto-insert "\\.html$" "html-template.html")
(setq auto-insert-query nil)


;; Rainbow delimiter // colorful brackets
(use-package rainbow-delimiters
 :hook (prog-mode . rainbow-delimiters-mode))




(provide 'th-dev)
;;; th-dev.el ends here
