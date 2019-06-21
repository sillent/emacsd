;;; setup-go.el --- Init Emacs configuration
;;; Commentary:
;;; This is my emacs.d/init.el configuration
;;; Author: Dmitry Ulyanov
;;; Email: siilent1987@yahoo.com
;;; Code:

(use-package multi-compile
  :ensure t)
(use-package go-eldoc
  :ensure t)
(use-package company-go
  :ensure t)
(use-package go-mode
  :ensure t
  :config
  (progn
    (add-hook 'go-mode-hook 'go-eldoc-setup)
    (add-hook 'go-mode-hook (lambda ()
                              (set (make-local-variable 'company-backends) '(company-go))
                              (company-mode)
                              ))))
(provide 'setup-go)
;;; setup-go.el ends here
