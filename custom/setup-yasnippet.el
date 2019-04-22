;;; Yasnippet setup module
;;; Author: Dmitry Ulyanov
;;; Comments:
;;;
;;; Code:
(use-package yasnippet
  :ensure t
  :config
  (progn
    (setq yas-snippet-dirs '("~/.emacs.d/snippets"))
    (yas-global-mode 1)))
(provide 'setup-yasnippet)
;;; setup-yasnippets.el ends here
