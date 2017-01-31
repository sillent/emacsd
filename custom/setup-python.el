;;; setup-python --- Setup python
;;; Commentary:
;;; Code:
(elpy-enable)
(setq python-indent-offset 4)
(setq elpy-rpc-timeout 3)
(setq elpy-rpc-backend "jedi")
(provide 'setup-python)
;;; setup-python.el ends here
