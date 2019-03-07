(remove-hook 'flymake-diagnostic-functions 'flymake-proc-legacy-flymake)
(defvar du/title)
(defvar du/msg)
(defvar du/done)

(use-package lsp-mode
  :ensure t
  :config
  (setq lsp-print-io t)
  (setq lsp-rust-rls-command '("rls"))
  ;; (setq lsp-rust-rls-command '("rustup" "run" "nightly" "rls"))
  ;; (setq lsp-rust-rls-command '("rustup" "run" "beta" "rls"))
  (setenv "RUST_BACKTRACE" "full")
  (setenv "RUST_LOG" "rls::=debug")
  ;; (setenv "LD_LIBRARY_PATH" "/home/diabolo/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/lib/")
  ;; (setq lsp-rust-rls-command '("/home/diabolo/src/rust/rls/target/debug/rls"))
  ;; (add-to-list 'lsp-project-blacklist "^/Users/csraghunandan/Library/Caches/Homebrew/emacs--git/$")
  ;; (add-to-list 'lsp-project-blacklist "^/Users/csraghunandan/\\.emacs\\.d/$"))

  ;; Fix problem seems to be caused by upgrading lsp-mode package to v3.
  (unless (fboundp 'lsp-rust-enable)
    (defun diabolo-lsp-rust-window-progress (_workspace params)
      "Progress report handling.
PARAMS progress report notification data."
      ;; Minimal implementation - we could show the progress as well.
      ;; (setq id (gethash "id" params))
      (setq du/title (gethash "title" params))
      (setq du/msg (gethash "message" params))
      (setq du/done (gethash "done" params))
      (message "RLS: %s%s%s"
               du/title
               (if du/msg (format " \"%s\"" msg) "")
               (if du/done " done" "")))

    (defun lsp-rust-enable ()
      (require 'lsp-clients)
      (when (boundp 'lsp-rust-rls-command)
        (lsp-register-client
         (make-lsp-client :new-connection (lsp-stdio-connection lsp-rust-rls-command)
                          :major-modes '(rust-mode)
                          :server-id 'rls
                          :notification-handlers (lsp-ht ("window/progress" 'diabolo-lsp-rust-window-progress)))))
      (lsp)))
  )

;; company-lsp: Company completion backend for lsp-mode.
;; https://github.com/tigersoldier/company-lsp/
(use-package company-lsp
  :ensure t
  :config
  (push 'company-lsp company-backends))

;; lsp-ui: This contains all the higher level UI modules of lsp-mode, like flycheck support and code lenses.
;; https://github.com/emacs-lsp/lsp-ui
(use-package lsp-ui
  :ensure t
  :after lsp-mode
  :init
  ;; (when window-system (setq lsp-ui-doc-use-webkit t))
  :config
  (define-key lsp-ui-mode-map [remap xref-find-definitions] #'lsp-ui-peek-find-definitions)
  (define-key lsp-ui-mode-map [remap xref-find-references] #'lsp-ui-peek-find-references)
  ;; (setq lsp-ui-sideline-enable nil
  ;;       lsp-ui-doc-enable nil
  ;;       lsp-ui-flycheck-enable t
  ;;       lsp-ui-sideline-show-flycheck t
  ;;       lsp-ui-imenu-enable t
  ;;       lsp-ui-sideline-ignore-duplicate t)
  (setq lsp-ui-doc-enable t
        lsp-enable-completion-at-point t
        lsp-ui-imenu-enable t
        lsp-ui-sideline-show-flycheck t
        lsp-ui-sideline-ignore-duplicate t
        lsp-ui-sideline-enable t)
  (if lsp-ui-doc-use-webkit ;; window-system
      (setq lsp-ui-doc-position 'at-point
            lsp-ui-doc-header t
            lsp-ui-doc-include-signature t
            lsp-ui-sideline-enable nil)
    (setq lsp-ui-doc-header nil
          lsp-ui-doc-include-signature nil))

  ;; (setq lsp-ui-doc-frame-parameters
  ;;       '((left . -1)
  ;;         (top . -1)
  ;;         (no-accept-focus . t)
  ;;         (min-width . 0)
  ;;         (width . 0)
  ;;         (min-height . 0)
  ;;         (height . 0)
  ;;         (internal-border-width . 0)
  ;;         (vertical-scroll-bars)
  ;;         (horizontal-scroll-bars)
  ;;         (left-fringe . 0)
  ;;         (right-fringe . 0)
  ;;         (menu-bar-lines . 0)
  ;;         (tool-bar-lines . 0)
  ;;         (line-spacing . 0.1)
  ;;         (unsplittable . t)
  ;;         (undecorated . t)
  ;;         (minibuffer . nil)
  ;;         (visibility . nil)
  ;;         (mouse-wheel-frame . nil)
  ;;         (no-other-frame . t)
  ;;         (cursor-type)
  ;;         (no-special-glyphs . t)))
  )

(provide 'setup-lsp)
