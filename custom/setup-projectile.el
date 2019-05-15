;;; setup-projectile.el --- Setup projectile for Emacs
;;; Author: Dmitry Ulyanov
;;; Email: siilent1987@yahoo.com
;;; Commentary:
;;; Code:
(use-package projectile
  :ensure t
  :config
  (projectile-mode +1)
  :bind-keymap
  ("C-c p" . projectile-command-map))

(use-package helm-projectile
  :ensure t)

(provide 'setup-projectile)

;;; setup-projectile.el ends here
