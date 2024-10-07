;; -*- th-misc: utf-8; lexical-binding: t; -*-
;;; code:

;; Helpful
(use-package helpful
    :ensure t
    :custom
    (counsel-describe-function-function #'helpful-callable)
    (counsel-describe-variable-function #'helpful-variable)
    :bind
    ([remap describe-function] . counsel-describe-function)
    ([remap describe-command] . helpful-command)
    ([remap describe-variable] . counsel-describe-variable)
    ([remap describe-key] . helpful-key))

;; Hacker news
(use-package hackernews)

(push '("\\`\\*hackernews .*\\*\\'" display-buffer-same-window)
      display-buffer-alist)

;; ...or equivalently, starting with Emacs 30:

;;(push '((category . hackernews) display-buffer-same-window)
;;      display-buffer-alist)

;; Ediff

(setq ediff-split-window-function 'split-window-horizontally
      ediff-window-setup-function 'ediff-setup-windows-plain)

(defun th-ediff-hook ()
  (ediff-setup-keymap)
  (define-key ediff-mode-map "j" 'ediff-next-difference)
  (define-key ediff-mode-map "k" 'ediff-previous-difference))

;; dired
(use-package dired
  :ensure nil
  :commands (dired dired-jump)
  :bind (("C-x C-j" . dired-jump))
  :config
  (evil-collection-define-key 'normal 'dired-mode-map
    "h" 'dired-up-directory
    "l" 'dired-find-file
    "F" 'dired-do-find-marked-files))


(provide 'th-misc)
;;; th-misc.el ends here
