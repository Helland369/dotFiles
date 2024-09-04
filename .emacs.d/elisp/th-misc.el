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



(provide 'th-misc)
;;; th-misc.el ends here
