;;; init.el --- Init Emacs configuration
;;; Commentary:
;;; This is my emacs.d/init.el configuration
;;; Author: Dmitry Ulyanov
;;; Email: siilent1987@yahoo.com
;;; Code:


;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(setq user-full-name "Dmitry Ulyanov")
(setq user-mail-address "sillent1987@gmail.com")
;; PATH set
(defvar my-path)
(setq my-path (concat "~/bin:"
                     "~/.local/bin:"
                     "/bin:"
                     "/usr/bin:"
                     "/usr/sbin:"
                     "/sbin:"
                     "/usr/local/bin:"
                     "/usr/local/sbin:"
                     "/opt/bin:"
                     "/opt/sbin:"
                     ))
(setenv "PATH" my-path)

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)
(defun package--save-selected-packages (&rest opt)
  "I forgot what doing this function with OPT arg."
  nil)
(setq gc-cons-threshold 100000000)
(setq inhibit-startup-message t)

(defalias 'yes-or-no-p 'y-or-n-p)

;; this variables must be set before load helm-gtags
;; you can change to any prefix key of your choice
(defvar helm-gtags-prefix-key)
(setq helm-gtags-prefix-key "\C-cg")

(add-to-list 'load-path "~/.emacs.d/custom")
(require 'setup-use-package)

(use-package anzu
  :ensure t)

;; which-key completion for forgoten keybind
(use-package which-key
  :ensure t
  :config
  (which-key-mode))

;; try - package that just try other package without install it
(use-package try
  :ensure t)

(require 'setup-helm)

(use-package helm
  :ensure t
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
    (define-key helm-map (kbd "C-z")
      'helm-select-action)

    (define-key helm-grep-mode-map (kbd "<return>")
      'helm-grep-mode-jump-other-window)
    (define-key helm-grep-mode-map (kbd "n")
      'helm-grep-mode-jump-other-window-forward)
    (define-key helm-grep-mode-map (kbd "p")
      'helm-grep-mode-jump-other-window-backward)

    (when (executable-find "curl")
      (setq helm-google-suggest-use-curl-p t))
    (setq
     helm-scroll-amount 4
     helm-ff-search-library-in-sexp t
     helm-split-window-in-side-p t
     helm-candidate-number-limit 20
     helm-ff-file-name-history-use-recentf t
     helm-move-to-line-cycle-in-source t
     helm-buffers-fuzzy-matching t)
    (add-to-list 'helm-sources-using-default-as-input 'helm-source-man-pages)

    ))

(require 'setup-lsp)
(require 'setup-rust)
;; (require 'setup-package)                ; setup package manager and install package
;; (require 'setup-helm)                   ; setup 'helm' mod
;; (require 'setup-helm-gtags)             ; setup gtags
;; (require 'setup-ggtags)
(require 'setup-ggtags)
(require 'setup-cedet)
(require 'setup-editing)
(require 'setup-icons)
(require 'setup-neotree)
;;(require 'setup-helm-swoop)

(use-package autopair
  :ensure t
  :config
  (require 'autopair))
(require 'setup-org)
(require 'custom-font)
(require 'setup-modeline)
(require 'setup-flycheck)
(require 'setup-cmake)
(require 'myfuncs)
;; setup python
(require 'setup-python)
(require 'setup-magit)
(require 'setup-webmode)

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

;; Package: projejctile
(use-package projectile
  :ensure t
  :config
  (progn
    (require 'projectile)
    (projectile-global-mode)
    (setq projectile-enable-caching t)))

(use-package helm-projectile
  :ensure t
  :config
  (progn
    (require 'helm-projectile)
    (helm-projectile-on)
    (setq projectile-completion-system 'helm)
    (setq projectile-indexing-method 'alien)))

;; (require 'setup-rpm-spec)

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
