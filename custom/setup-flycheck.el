;;; setup-flycheck.el --- Setup configuration for flycheck
;;;
;;; Commentary:
;;; test
;;; Code:
(use-package flycheck
  :ensure t
  :config
  (progn
    (require 'flycheck)
    (global-flycheck-mode t)
    (setq flycheck-clang-include-path '("./" "./include" "../include"))))
(provide 'setup-flycheck)
;;; setup-flycheck.el ends here
