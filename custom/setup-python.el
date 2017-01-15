;;; setup-python --- Setup python
;;; Commentary:
;;; Code:
;; (elpy-enable)
(require 'jedi)
(add-hook 'python-mode-hook 'jedi:setup)
(provide 'setup-python)
;;; setup-python.el ends here
