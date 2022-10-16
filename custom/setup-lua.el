;;; setup-lua.el --- seting up Lua
;;; Commentary:
;;;
;;; Code:
(use-package lua-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
  (add-to-list 'interpreter-mode-alist '("lua" . lua-mode))
  )

(use-package company-lua
  :ensure t)

(use-package flymake-lua
  :ensure t)

(provide 'setup-lua)
;;; setup-lua.el ends here
