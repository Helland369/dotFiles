;; -*- lexical-binding: t; -*-

;; Web dev stuff

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
   ("\\.js[x]\\'" . web-mode)
   ("\\.html\\'" . web-mode))
  :config
  (setq web-mode-enable-auto-quoting nil)
  (setq web-mode-content-types-alist
        '(("jsx" . "\\.js[x]?\\'"))))

;; better colors for imbeded html?
(setq web-mode-enable-part-face t)
(setq web-mode-part-face 'font-lock-variable-name-face)

;; make web mode and js2 mode be friends
;;(add-to-list 'auto-mode-alist '("\\.js\\'" . web-mode))
(setq web-mode-enable-auto-indentation nil)
(setq web-mode-script-padding 4) ;; script indent ?

;; indentation
(setq web-mode-markup-indent-offset 4)
(setq web-mode-css-indent-offset 4)
(setq web-mode-code-indent-offset 4)

;; closing tag
(setq web-mode-enable-auto-pairing t)
(setq web-mode-enable-auto-closing t) ;; auto close tags?
;; css colors
(setq web-mode-enable-css-colorization t)


;; Company for web mode // aout compleate
(use-package company-web)
(add-to-list 'company-backends 'company-web-html)
(add-to-list 'company-backends 'company-web-jade)
(add-to-list 'company-backends 'company-web-slim)

;; Js2 mode so that we become firends wit javascript
(use-package js2-mode
  :defer t
  :ensure t)
  (add-hook 'js-mode-hook 'js2-minor-mode) ;; run minor mode with major mode
  (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode)) ;; use js2 mode as major
  
;; uber web // swap between js2-mode and web mode
(defun th-js2-web-mode ()
  "Change between js2-mode and web-mpde."
  (interactive)
  (if (derived-mode-p 'js2-mode)
      (web-mode)
    (js2-mode)))




(provide 'th-web-dev)
;;; th-web-dev.el ends here
