;; -*- th-lsp: utf-8; lexical-binding: t; -*-
;;; code:

(use-package lsp-mode
    :init
    (setq lsp-keymap-prefix "C-c l")
    :hook
    (c-mode . lsp)
    (c++-mode .lsp)
    (csharp-mode . lsp)
    (rst-mode . lsp)
    (js-mode . lsp)
    (web-mode . lsp)
    (css-mode .lsp)
    (html-mode . lsp)
    (lsp-mode . lsp-enable-which-key-integration)
    :commands lsp)

(setq lsp-file-watch-threshold 5000)

;; Lsp ui
(use-package lsp-ui
    :after lsp-mode
    :hook (lsp-mode . lsp-ui-mode)
    :commands lsp-ui-mode
    :config
    (define-key lsp-ui-mode-map [remap xref-find-definitions] #'lsp-ui-peek-find-definitions)
    (define-key lsp-ui-mode-map [remap xref-find-references] #'lsp-ui-peek-find-references)
    (setq lsp-ui-sideline-show-diagnostics nil)
    (setq lsp-ui-sideline-show-hover nil)
    (setq lsp-ui-doc-enable t)
    (setq lsp-ui-doc-position 'bottom))

;; Lsp ivy
(use-package lsp-ivy)

(use-package lsp-treemacs)
(lsp-treemacs-sync-mode 1)

;; Dap Mode
(use-package dap-mode
  :config
  (dap-auto-configure-mode)

  :bind
  (("<f7>" . dap-step-in)
   ("<f8>" . dap-next)
   ("<f9>" . dap-continue)))


(provide 'th-lsp)
;;; lsp.el ends here
