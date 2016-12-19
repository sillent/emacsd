;;; setup-flycheck.el --- Setup configuration for flycheck
;;;
;;; Commentary:
;;; test
;;; Code:
(require 'flycheck)
;;; Code:
(global-flycheck-mode t)
(setq flycheck-clang-include-path '("./" "./include" "../include"))
(provide 'setup-flycheck)
;;; setup-flycheck.el ends here
