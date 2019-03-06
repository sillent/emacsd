;;; setup-rust.el --- Init Emacs configuration
;;; Commentary:
;;; This is my emacs.d/init.el configuration
;;; Author: Dmitry Ulyanov
;;; Email: siilent1987@yahoo.com
;;; Code:
(use-package flycheck-rust
  :ensure t
  :defer t
  :config
  (add-hook  'flycheck-mode-hook #'flycheck-rust-setup))

(use-package company-racer
  :ensure t
  :defer t
  )

(use-package rust-mode
  :ensure t
  :defer t
  :init
  (require 'rust-mode)
  (global-company-mode)
  (add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode))
  :config
  (use-package company-racer)
  (use-package flycheck-rust)
  (use-package company-lsp)
  (use-package racer
    :ensure t
    :defer t
    :init
    ;; (setq racer-rust-src-path (concat (getenv "HOME")
                                      ;; "/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src"))
    ;; (setq racer-cmd (concat (getenv "HOME") "/.cargo/bin/racer"))
    :config
    (define-key rust-mode-map (kbd "M-\"") #'racer-find-definition)
    (add-hook 'racer-mode-hook #'eldoc-mode)
    (add-hook 'racer-mode-hook #'company-mode)
    (local-set-key (kbd "TAB") #'company-indent-or-complete-common)
    (setq company-tooltip-align-annotations t)
    )
  (defun my-rust-mode-hook()
    (set (make-local-variable 'compile-command "~/.cargo/bin/cargo run"))
    (add-hook 'flycheck-mode-hook #'flycheck-rust-setup)
    )
  (add-hook 'rust-mode-hook 'my-rust-mode-hook)
  (add-hook 'rust-mode-hook #'racer-mode)
  )
(provide 'setup-rust)

;;; setup-rust.el ends here
