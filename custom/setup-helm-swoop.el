(require 'helm-swoop)
(global-set-key (kbd "M-i") 'helm-swoop)
(global-set-key (kbd "M-I") 'helm-swoop-back-to-last-point)
(define-key isearch-mode-map (kbd "M-i") 'helm-swoop-from-isearch)

(provide 'setup-helm-swoop)
