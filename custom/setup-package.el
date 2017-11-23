;;; setup-package.el --- Setup package for Emacs
;;; Author: Dmitry Ulyanov
;;; Email: siilent1987@yahoo.com
;;; Commentary:
;;; Code:
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
;; (package-initialize)
(defconst demo-packages
  '(anzu
    company
    company-ansible
    company-shell
    company-c-headers
    company-jedi
    duplicate-thing
    ggtags
    helm
    helm-make
    autopair
    helm-gtags
    helm-projectile
    helm-swoop
    helm-flycheck
    ;; function-args
    clean-aindent-mode
    comment-dwim-2
    dtrt-indent
    ws-butler
    iedit
    yasnippet
    smartparens
    projectile
    volatile-highlights
    undo-tree
    bbdb
    magit
    magit-popup
    beacon
    yaml-mode
    zygospore
    cmake-mode
    powerline
    flycheck
    jedi
    jedi-core
    ivy
    elpy
    py-autopep8
    importmagic
    django-mode
    smart-mode-line
    smart-mode-line-powerline-theme))

(defun install-packages ()
  "Install all required packages."
  (interactive)
  (unless package-archive-contents
    (package-refresh-contents))
  (dolist (package demo-packages)
    (unless (package-installed-p package)
      (package-install package))))

(install-packages)


(provide 'setup-package)
;;; setup-package.el ends here
