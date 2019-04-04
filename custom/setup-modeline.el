;;; setup-modeline.el --- Setup modeline
;;; Commentary:
;;; Code:
(use-package smart-mode-line
  :ensure t
  :config
  (progn
    (if (display-graphic-p)
        (progn
          (setq sml/theme 'dark)
          (sml/setup)))))
(use-package smart-mode-line-powerline-theme
  :ensure t)
(provide 'setup-modeline)
;;; setup-modeline.el ends here
