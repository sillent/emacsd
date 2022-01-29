;;; myfuncs.el --- My function scripts
;;; Commentary:
;;;
;;; Code:
(setq helm-boring-buffer-regexp-list '("\\` " "\\*helm" "\\*helm-mode" "\\*Echo Area" "\\*Minibuf"))
;; (setenv "GTAGSDBPATH" "/home/santa/.gtags/" )

(defun initproject()
  "Init my version project: git init, .gitignore with gtags file and CMake"
  (interactive)
  (if (eq nil (file-exists-p ".git"))
      (initgit)
    )
  )

(defun initgit()
  "Initi .git"
  (shell-command "git init")
  (append-to-file "GTAGS\nGPATH\nGRTAGS\nbuild/\n" nil ".gitignore")
  (shell-command "gtags -c")
  )

(defun createlocal-dir()
  "Create .dir-locals.el in root dir"
  (interactive)
  (append-to-file "(( nil . ((company-clang-arguments . (\"-I\")))))" nil ".dir-locals.el")
  )

(setq enable-local-variables t)

(defun my-indent-mode-line ()
  (interactive)
  (newline-and-indent)
  (when (looking-at "}")
    (newline-and-indent)
    (forward-line -1)
    (end-of-line)
    (rustic-indent-line)
    )
  (when (looking-at ")")
    (newline-and-indent)
    (forward-line -1)
    (end-of-line)
    (rustic-indent-line)
    )
  )
(provide 'myfuncs)

;;; myfuncs.el ends here
;;; Local Variables:
;;; byte-compile-warnings: (not free-vars)
;;; End:
