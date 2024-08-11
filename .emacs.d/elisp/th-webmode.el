;; -*- th-webmode: utf-8; lexical-binding: t; -*-
;;; code:

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
   ("\\.html\\'" . web-mode)
   ("\\.css\\'" . web-mode)))

(setq web-mode-markup-indent-offset 2)
(setq web-mode-css-indent-offset 2)
(setq web-mode-code-indent-offset 2)

(setq web-mode-enable-auto-pairing t)

(setq web-mode-enable-css-colorization t)


(provide 'th-webmode)
;;; webmode.el ends here
