;; company
(setq company-c-headers-path-system '("/usr/include" "/usr/local/include"))
(setq company-c-headers-path-user '("." "./include"))
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
  (add-to-list 'company-c-headers-path-system "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/clang/7.3.0/include" )
  (add-to-list 'company-c-headers-path-system "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include")
  (add-to-list 'company-c-headers-path-system "/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.11.sdk/usr/include")
  )

(if (string-equal system-type "darwin")
    (darwinInclude)
  )
(provide 'setup-company)
