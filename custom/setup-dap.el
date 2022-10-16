;;; setup-dap.el --- init Emacs DAP client
;;; Commentary:
;;; Author: Dmitry Ulyanov
;;; Email: sillent1987@gmail.commandlinetools
;;; Code

(use-package dap-mode
  :ensure t
  :config
  (dap-mode 1)
  (dap-ui-mode)
  (dap-tooltip-mode 1)
  (dap-ui-controls-mode 1)

  (require 'dap-lldb)
  (require 'dap-gdb-lldb)
  ;; (require 'dap-dlv-go)
  ;; (dap-gdb-lldbp-setup)
  )

(provide 'setup-dap)
;;; setup-dap.el ends here
