;;; setup-dap.el --- init Emacs DAP client
;;; Commentary:
;;; Author: Dmitry Ulyanov
;;; Email: sillent1987@gmail.commandlinetools
;;; Code

(use-package dap-mode
  :ensure t
  :config
  (setq dap-auto-configure-features '(sessions locals controls tooltip))
  (dap-mode 1)
  (dap-ui-mode)
  (dap-tooltip-mode 1)
  ;; (dap-ui-controls-mode 1)

  (require 'dap-lldb)
  (require 'dap-gdb-lldb)
  (dap-gdb-lldb-setup)
  (require 'dap-dlv-go)
  )

(dap-register-debug-template
   "Rust::GDB Run Configuration"
   (list :type "gdb"
         :request "launch"
         :name "GDB::Run"
         :gdbpath "rust-gdb"
         :target nil
         ;; these lines copy form somewhere else and no matter they are here or not
         ;; don't change anything
         :dap-compilation "cargo build"
         :dap-compilation-dir "${workspaceFolder}"
         :cwd "${workspaceFolder}"))

(dap-register-debug-template
 "Rust::LLDB Run Configuration"
 (list :type "lldb"
       :request "launch"
       :name "LLDB::Run"
       :gdbpath "rust-gdb"
       :target nil
       ;; these lines copy form somewhere else and no matter they are here or not
       ;; don't change anything
       :dap-compilation "cargo build"
       :dap-compilation-dir "${workspaceFolder}"
       :cwd "${workspaceFolder}"))


(provide 'setup-dap)
;;; setup-dap.el ends here
