;; -*- lexical-binding: t; -*-

;; Icrease gc treshold during starup
(setq gc-cons-threshold most-positive-fixnum)

;; Temporarily disable file name handlers
(defvar file-name-handler-alist-old file-name-handler-alist)
(setq file-name-handler-alist nil)

;; Reset gc treshold and file name handler
(add-hook 'emacs-starup-hook
	  (lambda ()
		 (setq gc-cons-threshold 100000000)
		 (setq file-name-handler-alist file-name-handler-alist-old)))


(set-face-attribute 'default nil
		     :font "NotoMono Nerd Font"
		     :height 120
             :width 'expanded
		     :weight 'medium)
		     ;;:slant 'normal)

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(add-to-list 'load-path (expand-file-name "elisp" user-emacs-directory))

(require 'th-settings)
(require 'th-use-pkg)
(require 'th-ui)
(require 'th-evil)
(require 'th-ivy)
(require 'th-misc)
(require 'th-files)
(require 'th-dev)
(require 'th-lsp)
(require 'th-web-dev)
(require 'th-org)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("c8c4baac2988652a760554e0e7ce11a0fe0f8468736be2b79355c9d9cc14b751" "4ade6b630ba8cbab10703b27fd05bb43aaf8a3e5ba8c2dc1ea4a2de5f8d45882" "b5fd9c7429d52190235f2383e47d340d7ff769f141cd8f9e7a4629a81abc6b19" "aec7b55f2a13307a55517fdf08438863d694550565dee23181d2ebd973ebd6b8" default))
 '(ignored-local-variable-values '((lexical-bunding . t)))
 '(package-selected-packages
   '(org-modern rainbow-delimiters rainbow-delimiter treesit js2-mode company-web web-mode lsp-ivy lsp-ui lsp-mode which-key witch-key flycheck highlight-indent-guides company-box company magit evil-nerd-commenter hackernews helpful nerd-icons-ivy-rich counsel doom-modeline doom-themes doom-theme nerd-icons dashboard evil)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


(provide 'init)
;;; init.el ends here
