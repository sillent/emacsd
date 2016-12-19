;;; init.el --- Init Emacs configuration
;;; Commentary:
;;; This is my emacs.d/init.el configuration
;;; Author: Dmitry Ulyanov
;;; Email: siilent1987@yahoo.com
;;; Code:
(setq user-full-name "Dmitry Ulyanov")
(setq user-mail-address "sillent1987@gmail.com")
;; PATH set
(setq mypath (concat "~/bin:"
                     "/bin:"
                     "/usr/bin:"
                     "/usr/sbin:"
                     "/sbin:"
                     "/usr/local/bin:"
                     "/usr/local/sbin:"
                     "/opt/bin:"
                     "/opt/sbin:"
                     ))
(setenv "PATH" mypath)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (wombat)))
 '(custom-safe-themes
   (quote
    ("3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" default))))
 ;;'(custom-safe-themes
   ;;(quote
    ;;("7ceb8967b229c1ba102378d3e2c5fef20ec96a41f615b454e0dc0bfa1d326ea6" default))))
(setq gc-cons-threshold 100000000)
(setq inhibit-startup-message t)

(defalias 'yes-or-no-p 'y-or-n-p)


;; this variables must be set before load helm-gtags
;; you can change to any prefix key of your choice
(setq helm-gtags-prefix-key "\C-cg")

(add-to-list 'load-path "~/.emacs.d/custom")
(require 'setup-package)                ; setup package manager and install package
;; (require 'setup-linum)                  ; setup mod : linum+
(require 'setup-helm)                   ; setup 'helm' mod
(require 'setup-helm-gtags)             ; setup gtags
;; (require 'setup-ggtags)
(require 'setup-cedet)
(require 'setup-editing)
(require 'setup-helm-swoop)

(require 'autopair)
(require 'setup-org)
(require 'custom-font)
(require 'setup-modeline)
(require 'setup-flycheck)
(require 'cmake)
(require 'myfuncs)

(windmove-default-keybindings)

;; function-args
;; (require 'function-args)
;; (fa-config-default)
;; (define-key c-mode-map  [(tab)] 'company-complete)
;; (define-key c++-mode-map  [(tab)] 'company-complete)

(require 'setup-company)
;; hs-minor-mode for folding source code
(add-hook 'c-mode-common-hook 'hs-minor-mode)

;; Available C style:
;; “gnu”: The default style for GNU projects
;; “k&r”: What Kernighan and Ritchie, the authors of C used in their book
;; “bsd”: What BSD developers use, aka “Allman style” after Eric Allman.
;; “whitesmith”: Popularized by the examples that came with Whitesmiths C, an early commercial C compiler.
;; “stroustrup”: What Stroustrup, the author of C++ used in his book
;; “ellemtel”: Popular C++ coding standards as defined by “Programming in C++, Rules and Recommendations,” Erik Nyquist and Mats Henricson, Ellemtel
;; “linux”: What the Linux developers use for kernel development
;; “python”: What Python developers use for extension modules
;; “java”: The default style for java-mode (see below)
;; “user”: When you want to define your own style
(setq
 c-default-style "linux" ;; set style to "linux"
 )

(global-set-key (kbd "RET") 'newline-and-indent)  ; automatically indent when press RET

;; activate whitespace-mode to view all whitespace characters
(global-set-key (kbd "C-c w") 'whitespace-mode)

;; show unncessary whitespace that can mess up your diff
(add-hook 'prog-mode-hook (lambda () (interactive) (setq show-trailing-whitespace 1)))

;; use space to indent by default
(setq-default indent-tabs-mode nil)

;; set appearance of a tab that is represented by 4 spaces
(setq-default tab-width 4)

;; Compilation
(global-set-key (kbd "<f5>") (lambda ()
                               (interactive)
                               (setq-local compilation-read-command nil)
                               (call-interactively 'compile)))

;; setup GDB
(setq
 ;; use gdb-many-windows by default
 gdb-many-windows t

 ;; Non-nil means display source file containing the main routine at startup
 gdb-show-main t
 )

;; Package: clean-aindent-mode
(require 'clean-aindent-mode)
(add-hook 'prog-mode-hook 'clean-aindent-mode)

;; Package: dtrt-indent
(require 'dtrt-indent)
(dtrt-indent-mode 1)

;; Package: ws-butler
(require 'ws-butler)
(add-hook 'prog-mode-hook 'ws-butler-mode)

;; Package: yasnippet
(require 'yasnippet)
(yas-global-mode 1)

;; Package: smartparens
(require 'smartparens-config)
(setq sp-base-key-bindings 'paredit)
(setq sp-autoskip-closing-pair 'always)
(setq sp-hybrid-kill-entire-symbol nil)
(sp-use-paredit-bindings)

(show-smartparens-global-mode +1)
(smartparens-global-mode 1)

;; Package: projejctile
(require 'projectile)
(projectile-global-mode)
(setq projectile-enable-caching t)

(require 'helm-projectile)
(helm-projectile-on)
(setq projectile-completion-system 'helm)
(setq projectile-indexing-method 'alien)

;; Package zygospore
(global-set-key (kbd "C-x 1") 'zygospore-toggle-delete-other-windows)


;; (show-paren-mode t)
;; (setq show-paren-style 'expression)
;; (electric-pair-mode t);; { } pair mode
(setq inhibit-startup-screen t)
(setq inhibit-splash-screen t)
(column-number-mode t)
(display-battery-mode t)

(setq ediff-split-window-function 'split-window-horizontally)
(setq make-backup-files nil)
(setq auto-save-list-file-name nil)
(setq auto-save-default nil)
(tool-bar-mode 0);; tool bar mode off
(menu-bar-mode 0);; menu bar mode off
(tooltip-mode -1)
;;(scroll-bar-mode -1) ;; hide scroll
(blink-cursor-mode -1) ;;  убираем мерцающий курсор
;;(setq use-dialog-box t) ;;  никаких графических диалогов
(setq redisplay-dont-pause t) ;; лучшая отрисовка буфера
(setq ring-bell-function 'ignore) ;; никаких звуковых сообщений
(setq display-time-24hr-format t)
(display-time-mode t)
(size-indication-mode -1)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 8)
(setq-default c-basic-offset 8)
(setq-default standard-indent 2)
(setq-default lisp-body-indent 2)

(define-key input-decode-map "\e\eOA" [(meta up)])
(define-key input-decode-map "\e\eOB" [(meta down)])
(define-key input-decode-map "\e\eOC" [(meta left)])
(define-key input-decode-map "\e\eOD" [(meta right)])
(global-set-key [(meta up)] 'enlarge-window)
(global-set-key [(meta down)] 'shrink-window)
(global-set-key [(meta left)] 'enlarge-window-horizontally)
(global-set-key [(meta right)] 'shrink-window-horizontally)
(put 'narrow-to-region 'disabled nil)

;; faces
;; (set-face-background 'mode-line "#0F1A5C")
;; (set-face-foreground 'mode-line-buffer-id "#DC314C")
;; (set-face-background 'mode-line-buffer-id "#0F1A5C")

;; (set-face-background 'mode-line-inactive "#B7BDDF")
;; (set-face-background 'isearch "#ABE6F1")
;; (set-face-foreground 'isearch "#0F1A5C")
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;; (setq-default abbrev-mode nil)

;;; init.el ends here
