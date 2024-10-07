;; -*- lexical-binding: t; -*-

;; use-package // elpa // melpa

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(package-refresh-contents)
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(setq use-package-always-ensure t)
(require 'use-package)

;; Disable auto package refresh and load at startup

(setq package-enable-at-startup nil)


(provide 'th-use-pkg)
