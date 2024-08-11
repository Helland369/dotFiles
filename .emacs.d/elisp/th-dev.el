;; -*- th-dev: utf-8; lexical-binding: t; -*-
;;; code:

(use-package counsel-projectile
    :config
    (counsel-projectile-mode))

;; Magit
(use-package magit)

;; Indent Guide
(use-package highlight-indent-guides)
(add-hook 'prog-mode-hook 'highlight-indent-guides-mode)

;; Company
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

(use-package company-box
  :hook(company-mode . company-box-mode))

(use-package company-web)
    (add-to-list 'company-backends 'company-web-html)
    (add-to-list 'company-backends 'company-web-jade)
    (add-to-list 'company-backends 'company-web-slim)

;; Flycheck
(use-package flycheck
    :diminish flycheck-mode
    :init
    (global-flycheck-mode))
    ;;(flycheck-add-mode 'javascript-eslint 'web-mode)
    ;;(setq js-indent-level 2)

;; Js2 Mode
(use-package js2-mode)
(add-hook 'js-mode-hook 'js2-minor-mode) ;; Make js2-mode minor mode
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode)) ;; Make js2 major mode

(use-package which-key
  :config
  (which-key-mode))

(auto-insert-mode 1)
(setq auto-insert-directory "~/.emacs.d/template/")
(define-auto-insert "\\.html$" "html-template.html")
(setq auto-insert-query nil)



(provide 'th-dev)
;;; dev.el ends here
