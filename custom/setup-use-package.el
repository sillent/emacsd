;;; setup-use-package.el --- Setup package for Emacs
;;; Author: Dmitry Ulyanov
;;; Email: siilent1987@yahoo.com
;;; Commentary:
;;; Code:
(require 'package)
(setq package-enable-at-startup nil)

(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives
             '("org" . "https://orgmode.org/elpa/") t)

(package-initialize)
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))
(provide 'setup-use-package)

;;; setup-use-package ends here
