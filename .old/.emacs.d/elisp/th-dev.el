;; -*- th-dev: utf-8; lexical-binding: t; -*-
;;; code:

;; Better mass comment // uncomment
(use-package evil-nerd-commenter
  :bind ("M-/" . evilnc-comment-or-uncomment-lines))

(use-package counsel-projectile
    :config
    (counsel-projectile-mode))

;; Magit
(use-package magit)

;; Auto revert for magit // update files when they change on disc // ex git pull
(magit-auto-revert-mode t)

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
(setq prettier-js-args '("--tab-width" "4" "--use-tabs" "false"))

(add-hook 'js2-mode-hook 'prettier-js-mode)
(add-hook 'web-mode-hook 'prettier-js-mode)
;;(add-hook 'typescript-mode-hook 'prettier-js-mode)

;; prettier JS // makie it auto indent
(use-package prettier-js
   :ensure t
   :after (js2-mode)
   :hook (js2-mode . prettier-js-mode))

;; prettier instaled with yay -S prettier
(add-hook 'js2-mode-hook 'prettier-js-mode)


(use-package which-key
  :config
  (which-key-mode))

(auto-insert-mode 1)
(setq auto-insert-directory "~/.emacs.d/template/")
(define-auto-insert "\\.html$" "html-template.html")
(setq auto-insert-query nil)





(provide 'th-dev)
;;; dev.el ends here
