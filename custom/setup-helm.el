;;; setup-helm.el --- Setup helm
;;; Commentary:
;;; Code:
;;; commented helm-config - removed from repository
;;;(use-package helm-config
;;;  :config
;;;  (progn
;;;    (helm-mode 1)
;;;    ))


(use-package helm
  :ensure t
  :init
  (progn
    (defvar helm-ff-search-library-in-sexp)
    (defvar helm-split-window-inside-p)
    (defvar helm-buffers-fuzzy-matching)
    (defvar helm-ff-file-name-history-use-recentf)
    (setq
     helm-scroll-amount 4
     helm-ff-search-library-in-sexp t     ; search for library in 'require'
     helm-split-window-inside-p t
     helm-candidate-number-limit 20
     helm-ff-file-name-history-use-recentf t
     helm-move-to-line-cycle-in-source t
     helm-buffers-fuzzy-matching t
     helm-display-header-line nil
     )
    ;; (helm-autoresize-mode t)
    ;; hooks
    (add-hook 'eshell-mode-hook
              #'(lambda ()
                  (define-key eshell-mode-map (kbd "M-l")  'helm-eshell-history)))
    (add-hook 'helm-goto-line-before-hook 'helm-save-current-pos-to-mark-ring)
    )
  (helm-mode 1)
  (helm-autoresize-mode t)
  :bind
  (
   ("M-x" . helm-M-x)
   ("M-y" . helm-show-kill-ring)
   ("C-x b" . helm-mini)
   ("C-x C-f" . helm-find-files)
   ("C-h SPC" . helm-all-mark-rings))
  :config
  (progn
    (require 'helm-config)
    (require 'helm-grep)
    (global-set-key (kbd "C-c h") 'helm-command-prefix)
    (global-unset-key (kbd "C-x c"))
        ;; rebihnd tab to do persistent action
    (define-key helm-map (kbd "<tab>")
      'helm-execute-persistent-action)
    ;; make TAB works in terminal
    (define-key helm-map (kbd "C-i")
     'helm-execute-persistent-action)
    ;; list actions using C-z
    ;; (define-key helm-map (kbd "C-z")
    ;;   'helm-select-action)

    (define-key helm-grep-mode-map (kbd "<return>")
      'helm-grep-mode-jump-other-window)
    (define-key helm-grep-mode-map (kbd "n")
      'helm-grep-mode-jump-other-window-forward)
    (define-key helm-grep-mode-map (kbd "p")
      'helm-grep-mode-jump-other-window-backward)

    (when (executable-find "curl")
      (setq helm-google-suggest-use-curl-p t))
    (add-to-list 'helm-sources-using-default-as-input 'helm-source-man-pages)

    ))



;; The default "C-x c" is quite close to "C-x C-c", which quits Emacs.
;; Changed to "C-c h". Note: We must set "C-c h" globally, because we
;; cannot change `helm-command-prefix-key' once `helm-config' is loaded.
;; (define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB works in terminal
;; (define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z

;; (define-key helm-grep-mode-map (kbd "<return>")  'helm-grep-mode-jump-other-window)
;; (define-key helm-grep-mode-map (kbd "n")  'helm-grep-mode-jump-other-window-forward)
;; (define-key helm-grep-mode-map (kbd "p")  'helm-grep-mode-jump-other-window-backward)


;; (add-to-list 'helm-sources-using-default-as-input 'helm-source-man-pages)


;; (global-set-key (kbd "C-c h x") 'helm-register)
;; (global-set-key (kbd "C-x r j") 'jump-to-register)

;; (define-key 'help-command (kbd "C-f") 'helm-apropos)
;; (define-key 'help-command (kbd "r") 'helm-info-emacs)
;; (define-key 'help-command (kbd "C-l") 'helm-locate-library)

;; use helm to list eshell history
(add-hook 'eshell-mode-hook
          #'(lambda ()
              (define-key eshell-mode-map (kbd "M-l")  'helm-eshell-history)))

;;; Save current position to mark ring
(add-hook 'helm-goto-line-before-hook 'helm-save-current-pos-to-mark-ring)

;; show minibuffer history with Helm
(define-key minibuffer-local-map (kbd "M-p") 'helm-minibuffer-history)
(define-key minibuffer-local-map (kbd "M-n") 'helm-minibuffer-history)

(define-key global-map [remap find-tag] 'helm-etags-select)

(define-key global-map [remap list-buffers] 'helm-buffers-list)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; PACKAGE: helm-swoop                ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Locate the helm-swoop folder to your path
(use-package helm-swoop
  :ensure t
  :config
  (global-set-key (kbd "M-i") 'helm-swoop)
  (global-set-key (kbd "M-I") 'helm-swoop-back-to-last-point)
  (define-key isearch-mode-map (kbd "M-i") 'helm-swoop-from-isearch))

(require 'helm-swoop)

;; Change the keybinds to whatever you like :)
(global-set-key (kbd "C-c h o") 'helm-swoop)
(global-set-key (kbd "C-c s") 'helm-multi-swoop-all)

;; When doing isearch, hand the word over to helm-swoop
(define-key isearch-mode-map (kbd "M-i") 'helm-swoop-from-isearch)

;; From helm-swoop to helm-multi-swoop-all
(define-key helm-swoop-map (kbd "M-i") 'helm-multi-swoop-all-from-helm-swoop)

;; Save buffer when helm-multi-swoop-edit complete
(setq helm-multi-swoop-edit-save t)

;; If this value is t, split window inside the current window
(setq helm-swoop-split-with-multiple-windows t)

;; Split direcion. 'split-window-vertically or 'split-window-horizontally
(setq helm-swoop-split-direction 'split-window-vertically)

;; If nil, you can slightly boost invoke speed in exchange for text color
(setq helm-swoop-speed-or-color t)

;; (helm-mode 1)
;; (helm-autoresize-mode t)

(provide 'setup-helm)
;;; setup-helm.el ends here
