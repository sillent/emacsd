;;; setup-magit.el -- Magit bindings
;;; Commentary:
;;; Code:
(use-package magit
  :ensure t
  :config
  (progn
    (global-set-key (kbd "C-x g s") 'magit-status)
    (global-set-key (kbd "C-x g l") 'magit-log)
    (global-set-key (kbd "C-x g i") 'magit-init)
    (global-set-key (kbd "C-x g c") 'magit-commit)))
(use-package magit-popup
  :ensure t)
(provide 'setup-magit)
;;; setup-magit ends here
