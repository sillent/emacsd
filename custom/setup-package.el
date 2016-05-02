(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)
(defconst demo-packages
  '(anzu
    company
    company-ansible
    company-shell
    company-c-headers
    duplicate-thing
    ggtags
    helm
    helm-make
    autopair
    helm-gtags
    helm-projectile
    helm-swoop
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
    magit
    magit-popup
    yaml-mode
    zygospore
    cmake-mode
    powerline
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
