;;; th-web-dev.el --- Web development packages // web-mode js2-mode etc  -*- lexical-binding: t; -*-

;; Copyright (C) 2024

;; Author:  <Thomas Helland>
;; Keywords: elisp

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:

;; 

;;; Code:

;; Web mode so that the html get nice

(use-package web-mode
  :ensure t
  :mode
  (("\\.phtml\\'" . web-mode)
   ("\\.php\\'" . web-mode)
   ("\\.tpl\\'" . web-mode)
   ("\\.[agj]sp\\'" . web-mode)
   ("\\.erb\\'" . web-mode)
   ("\\.mustache\\'" . web-mode)
   ("\\.djhtml\\'" . web-mode)
   ;;("\\.js[x]\\'" . web-mode)
   ("\\.html\\'" . web-mode))
  :config
  (setq web-mode-enable-auto-quoting nil)
  (setq web-mode-content-types-alist
        '(("jsx" . "\\.js[x]?\\'")
          ("javascript" . "\\.js[x]?\\'"))))

;; Company for web mode // aout compleate
(use-package company-web)
(add-to-list 'company-backends 'company-web-html)
(add-to-list 'company-backends 'company-web-jade)
(add-to-list 'company-backends 'company-web-slim)

;; Js2 mode so that we become firends with javascript
(use-package js2-mode
  :defer t
  :ensure t
  :mode ("\\.js\\'" . js2-mode)
  :config
  (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
  (setq js2-mode-show-strict-warnings nil))

;; If js2-mode descides to be difficult..
;;(setq-default major-mode 'js2-mode)

(use-package typescript-mode
  :ensure t
  :mode ("\\.ts\\'" . typescript-mode)
  :hook (typescript-mode . lsp))

(use-package vue-mode
  :mode "\\.vue\\'"
  :hook (vue-mode . prettier-js-mode))

;; uber web // swap between js2-mode and web mode
(defun th-js2-web-mode ()
  "Change between js2-mode and web-mode with jsp engine."
  (interactive)
  (if (derived-mode-p 'js2-mode)
      (progn
       (web-mode)
       (setq web-mode-engine "jsp"))
    (js2-mode)))

;; js prettier // indent js / html
(use-package prettier-js
  :ensure t
  :after (js2-mode)
  :hook (js2-mode . prettier-js-mode))

(add-hook 'js2-mode-hook 'prettier-js-mode)

;; prettier js indentation
(setq prettier-js-args '("--tab-width" "4"))

(provide 'th-web-dev)
;;; th-web-dev.el ends here
