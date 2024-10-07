;; -*- init: utf-8; lexical-binding: t; -*-
;;; code:

;; Increase GC threshold during startup
(setq gc-cons-threshold most-positive-fixnum)

;; Temporarily disable file name handlers
(defvar file-name-handler-alist-old file-name-handler-alist)
(setq file-name-handler-alist nil)

;; Reset GC threshold and file name handlers
(add-hook 'emacs-startup-hook
          (lambda ()
            (setq gc-cons-threshold 200000000)
            (setq file-name-handler-alist file-name-handler-alist-old)))

;; use-package
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

;;(package-refresh-contents)
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(setq use-package-always-ensure t)
(require 'use-package)

;; Disable automatic package loading and refreshing
(setq package-enable-at-startup nil)
;;(setq package-check-signature nil)  ;; Optional: if you don't want to check for signatures
;;(setq package-archives nil) ;; Disable any package archives (if you set them elsewhere)

;; Define the path to the elisp directory
(defvar th/elisp-dir (expand-file-name "elisp" user-emacs-directory)
  "Directory for my personal Emacs Lisp files.")

;; Add elisp directory to the load path (optional, if you want to require files later)
(add-to-list 'load-path th/elisp-dir)


;; Load all elisp files in the elisp directory
(dolist (file (directory-files th/elisp-dir t "\\.el$"))
  (load file))

;; Load individual configuration files
;;(load (expand-file-name "config" th/elisp-dir))
;;(load (expand-file-name "evil" th/elisp-dir))
;;(load (expand-file-name "mxmenu" th/elisp-dir))
;;(load (expand-file-name "dev" th/elisp-dir))
;;(load (expand-file-name "webmode" th/elisp-dir))
;;(load (expand-file-name "treemacs" th/elisp-dir))
;;(load (expand-file-name "misc" th/elisp-dir))
;;(load (expand-file-name "lsp" th/elisp-dir))

(require 'th-evil)
(require 'th-config)
(require 'th-mxmenu)
(require 'th-dev)
(require 'th-webmode)
(require 'th-treemacs)
(require 'th-misc)
(require 'th-lsp)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ignored-local-variable-values '((init . utf-8)))
 '(package-selected-packages
   '(yasnippet-snippets yasnippet dap-chrome evil-collection evil))
 '(safe-local-variable-values
   '((th-treemacs . utf-8)
     (th-mxmenu . utf-8)
     (th-evil . utf-8)
     (th-misc . utf-8)
     (th-webmode . utf-8)
     (th-config . utf-8)
     (th-dev . utf-8)
     (th-lsp . utf-8))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )



(provide 'init)
;;; init.el ends here
