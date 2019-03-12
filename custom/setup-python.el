;;; setup-python --- Setup python
;;; Commentary:
;;; Code:

;; elpy
(use-package elpy
  :ensure t
  :config
  (progn
    (elpy-enable)
    (setq python-indent-offset 4)
    (setq elpy-rpc-timeout 3)
    (setq elpy-rpc-backend "jedi")))

(use-package jedi
  :ensure t)
(use-package jedi-core
  :ensure t)
(use-package py-autopep8
  :ensure t
  :config
  (progn
    (setq py-autopep8-options '("--max-line-length=80"))))
(use-package importmagic
  :ensure t)
(use-package django-mode
  :ensure t)
;; (add-hook 'python-mode-hook 'importmagic-mode)
;; (require 'py-autopep8)
;; (add-hook 'python-mode-hook 'py-autopep8-enable-on-save)
;; (setq py-autopep8-options '("--max-line-length=100"))

;; (require 'django-html-mode)
;; (require 'django-mode)
;; (add-to-list 'auto-mode-alist '("\\.djhtml$" . django-html-mode))

(provide 'setup-python)
;;; setup-python.el ends here
