;;; Package -- setup-neotree
;;; Commentary:
;;;
;;; Code:
(use-package neotree
  :ensure t
  :config
  (progn
    (require 'neotree)
    (global-set-key [f8] 'neotree-toggle)
    (setq neo-theme (if (display-graphic-p) 'icons 'arrow))))
(provide 'setup-neotree)
;;; setup-neotree.el ends here
