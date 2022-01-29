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
(use-package go-rename
  :ensure t)
(use-package gotest
  :ensure t)
(use-package go-scratch
  :ensure t)
(use-package go-direx
  :ensure t)
(use-package go-guru
  :ensure t)
(use-package go-mode
  :ensure t
  :config
  (progn
    (add-hook 'go-mode-hook 'go-eldoc-setup)
    (add-hook 'go-mode-hook 'lsp-deferred)
    (add-hook 'go-mode-hook (lambda ()
                              (set (make-local-variable 'company-backends) '(company-go))
                              (company-mode)
                              ))
    (add-hook 'go-mode-hook 'yas-minor-mode)
    (add-hook 'go-mode-hook 'flycheck-mode)
    (add-hook 'go-mode-hook
              (lambda ()
                (local-set-key (kbd "RET") 'my-indent-mode-line)))
    (setq multi-compile-alist '(
        (go-mode . (
        ("go-build" "go build -v"
           (locate-dominating-file buffer-file-name ".git"))
           ("go-build-and-run" "go build -v && echo 'build finish' && eval ./${PWD##*/}"
              (multi-compile-locate-file-dir ".git"))))
                  ))))
(provide 'setup-go)
;;; setup-go.el ends here
