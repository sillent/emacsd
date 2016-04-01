(setq org-todo-keywords
      '((sequence "К работе" "Принята в работу" "Отклонена" "|" "Завершена" "Переназначена" "Делегирована")))
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode)) ; auto org-mode for *.org files
(global-set-key "\C-cl" 'org-mode-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-iswitchb)

(provide 'setup-org)
