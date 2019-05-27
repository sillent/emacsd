;;; setup-jinja2 --- Setup jinja2-mode
;;; Commentary:
;;; Code:

(use-package elpy
  :ensure t
  :config
  (progn
    (add-to-list 'auto-mode-alist '("\\.j2" . jinja2-mode))
    ))

(provide 'setup-jinja2)
;;; setup-jinja2.el ends here
