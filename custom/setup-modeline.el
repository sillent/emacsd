;;; setup-modeline.el --- Setup modeline
;;; Commentary:
;;; Code:
(use-package smart-mode-line
  :ensure t
  :config
  (progn
    (setq sml/theme 'dark)
    (sml/setup)))

(provide 'setup-modeline)
;;; setup-modeline.el ends here
