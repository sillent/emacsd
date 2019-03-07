;;; setup-rust.el --- Init Emacs configuration
;;; Commentary:
;;; This is my emacs.d/init.el configuration
;;; Author: Dmitry Ulyanov
;;; Email: siilent1987@yahoo.com
;;; Code:

(eval-when-compile
  (require 'cl))

(use-package flycheck-rust
  :ensure t
  :defer t
  :config
  (add-hook  'flycheck-mode-hook #'flycheck-rust-setup))

(use-package company-racer
  :ensure t
  :defer t
  )

(when (< (car (pkg-info-package-version 'lsp-mode)) 20190105)
  (use-package lsp-rust
    :ensure t
    :after lsp-mode
    ))
(defun du/rust-toggle-mutability ()
  "Toggle the mutability of the variable at point."
  (interactive)
  (save-excursion
    (racer-find-definition)
    (back-to-indentation)
    (forward-char 4)
    (if (lookin-at "mut ")
        (delete-char 4)
      (insert "mut "))))

(defun du/rust-toggle-visibility ()
  "Toggle the visibilit of the variable at point."
  (interactive)
  (save-excursion
    (end-of-line)
    (beginning-of-defun)
    (if (looking-at "pub ")
        (delete-char 4)
      (insert "pub "))))

(use-package rust-mode
  :ensure t
  :defer t
  :hook ((rust-mode . (lambda ()
                        (when (<(car(pkg-info-package-version 'lsp-mode)) 20190105)
                          (lsp-rust-set-goto-def-racer-fallback t)
                          (lsp-ui-doc-enable-eldoc))
                        (lsp-rust-enable)
                        (flycheck-rust-setup)
                        (flycheck-mode)
                        (lsp-ui-mode)
                        (company-mode))))
  :bind (:map rust-mode-map
              ("C-c C-r C-v" . du/rust-toggle-visibility)
              ("C-c C-r C-m" . du/rust-toggle-mutability)
              ("C-c C-r C-s" . du/rust-vec-as-slice)
              ([?\t] . #'company-indent-or-complete-common))
  :init
  (require 'rust-mode)
  (global-company-mode)
  (add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode))
  :config
  (use-package company-racer)
  (use-package flycheck-rust)
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
