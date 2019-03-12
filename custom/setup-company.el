;;; setup-company.el --- Setup company
;;; Commentary:
;;; company
;;; Code:
(use-package company
  :ensure t)
(use-package company-shell
  :ensure t)
(use-package company-c-headers
  :ensure t)
(use-package company-jedi
  :ensure t)
(use-package company-shell
  :ensure t)

(setq company-c-headers-path-system '("/usr/include" "/usr/local/include"))
(setq company-c-headers-path-user '("." "./include" "../include"))
(setq company-clang-arguments '("-I." "-I./include" "-I../include"))
(require 'company)

(add-hook 'after-init-hook 'global-company-mode)
(delete 'company-semantic company-backends)
;; (delete 'company-clang company-backends)
(define-key c-mode-map  [(tab)] 'company-complete)
(define-key c++-mode-map  [(tab)] 'company-complete)
;; (define-key c-mode-map  [(control tab)] 'company-complete)
;; (define-key c++-mode-map  [(control tab)] 'company-complete)

;; company-c-headers
(add-to-list 'company-backends 'company-c-headers)

(defun darwinInclude()
  "List Include directives in darwin"
  (add-to-list 'company-c-headers-path-system "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/clang/9.0.0/include")
  (add-to-list 'company-c-headers-path-system "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include")
  (add-to-list 'company-c-headers-path-system "/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.13.sdk/usr/include")
  )

;; (if (string-equal system-type "darwin")
;;     (darwinInclude)
;;   )
(require 'setup-env)
(provide 'setup-company)
;;; setup-company.el ends here
