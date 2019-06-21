;;; setup-toml.el --- Init Emacs configuration
;;; Commentary:
;;; Author: Dmitry Ulyanov
;;; Email: siilent1987@yahoo.com
;;; Code:
(use-package toml-mode
  :ensure t
  :config
  (progn
    (add-to-list 'auto-mode-alist '("\\.toml" . toml-mode))
    ))

(provide 'setup-toml)
;;; setup-toml.el ends here
