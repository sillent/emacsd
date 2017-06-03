;;; setup-helm-swoop.el --- Helm swoop setup
;;; Commentary:
;;; Code:
(require 'helm-swoop)
(global-set-key (kbd "M-i") 'helm-swoop)
(global-set-key (kbd "M-I") 'helm-swoop-back-to-last-point)
(define-key isearch-mode-map (kbd "M-i") 'helm-swoop-from-isearch)

(provide 'setup-helm-swoop)
;;; setup-helm-swoop.el ends here
