;;; setup-rust.el --- Init Emacs configuration
;;; Commentary:
;;; This is my emacs.d/init.el configuration
;;; Author: Dmitry Ulyanov
;;; Email: siilent1987@yahoo.com
;;; Code:

;; (eval-when-compile
;;   (require 'cl))

;; (use-package racer
;;  :ensure t)

;; (use-package company-racer
;;   :ensure t
;;   :defer t
;;   )

(use-package cargo
  :ensure t
  :defer t
  :bind (
        ("C-c C-c C-e" . cargo-process-bench)
        ("C-c C-c C-b" . cargo-process-build)
        ("C-c C-c C-r" . cargo-process-run)
        ("C-c C-c C-t" . cargo-process-test)
   ))

;; (when (< (car (pkg-info-package-version 'lsp-mode)) 20190105)
;;   (use-package lsp-rust
;;     :ensure t
;;     :after lsp-mode
;;     ))

;; (use-package lsp-rust
;;   :ensure t
;;   :after lsp-mode
;;   )

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

;; (use-package rust-mode
;;   :ensure t
;;   :defer t
;;   :hook ((rust-mode . (lambda ()
;;                         (when (<(car(pkg-info-package-version 'lsp-mode)) 20190105)
;;                           (lsp-rust-set-goto-def-racer-fallback t)
;;                           (lsp-ui-doc-enable-eldoc))
;;                         (lsp-rust-enable)
;;                         (flycheck-rust-setup)
;;                         (flycheck-mode)
;;                         (lsp-ui-mode)
;;                         (company-mode))))
;;   :bind (:map rust-mode-map
;;               ("C-c C-r C-v" . du/rust-toggle-visibility)
;;               ("C-c C-r C-m" . du/rust-toggle-mutability)
;;               ("C-c C-r C-s" . du/rust-vec-as-slice)
;;               ([?\t] . #'company-indent-or-complete-common))
;;   :ensure-system-package
;;   ((rustfmt . "rustup component add rustfmt-preview")
;;    (racer . "cargo install racer")
;;    (rls . "rustup component add rls-preview rust-analysis rust-src"))
;;   :config
;;   (setq rust-indent-method-chain t)
;;   (setq company-tooltip-align-annotations t))

(use-package rustic
  :ensure t
  :bind
  ("M-j" . lsp-ui-imenu)
  ("M-?" . lsp-find-references)
  :config
  (progn
    ;; (setq lsp-rust-analyzer-proc-macro-enable t)
    ;; (setq rustic-lsp-format t)
    ;; (setq lsp-rust-all-targets nil)
    (add-hook 'rustic-mode-hook
            (lambda ()
              (local-set-key (kbd "RET") 'my-indent-mode-line)))
  ))

(use-package flycheck-rust
  :ensure t
  :defer t
  :bind
  ("C-c C-f" . lsp-rust-analyzer-open-cargo-toml)
  :config
  (add-hook  'flycheck-mode-hook #'flycheck-rust-setup))


(provide 'setup-rust)

;;; setup-rust.el ends here
