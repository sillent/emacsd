;;; setup-python --- Setup python
;;; Commentary:
;;; Code:

;; elpy
(elpy-enable)
(setq python-indent-offset 4)
(setq elpy-rpc-timeout 3)
(setq elpy-rpc-backend "jedi")

(add-hook 'python-mode-hook 'importmagic-mode)
(require 'py-autopep8)
(add-hook 'python-mode-hook 'py-autopep8-enable-on-save)
(setq py-autopep8-options '("--max-line-length=100"))
(provide 'setup-python)
;;; setup-python.el ends here
