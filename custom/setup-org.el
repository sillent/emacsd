;;; setup-org.el --- Setup ORG mode
;;; Commentary:
;;; Code:
(setq org-todo-keywords
      '((sequence "К работе" "Принята в работу" "Отклонена" "|" "Завершена" "Переназначена" "Делегирована")))
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode)) ; auto org-mode for *.org files
(global-set-key "\C-cl" 'org-mode-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-iswitchb)

(use-package ob-blockdiag
  :ensure t
  :config
  (org-babel-do-load-languages 'org-babel-load-languages
                               '((blockdiag . t)))
  )




(provide 'setup-org)
;;; setup-org.el ends here
