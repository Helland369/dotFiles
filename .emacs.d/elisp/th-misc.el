;; -*- lexical-binding: t; -*-

;; Helpful // look up stuff
(use-package helpful
  :defer t
  :ensure t
  :custom
  (counsel-describe-function-function #'helpful-callable)
  (counsel-describe-variable-function #'helpful-variable)
  :bind
  ([remap describe-function] . counsel.describe-function)
  ([remap describe-command] . helpful-command)
  ([remap describe-variabel] . counsel-describe-variable)
  ([remap describe-key] . helpful-key))

;; Hacker news
(use-package hackernews)

(push '("\\`\\*hackernews .*\\*\\'" display-buffer-same-window)
      display-buffer-alist)




(provide 'th-misc)
