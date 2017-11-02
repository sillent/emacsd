;;; setup-env.el  --- Environment setup
;;; Commentary:
;;; Author: siilent1987@yahoo.com
;;; Code:
;; SETUP clang and INCLUDE directive for company complete correctly usage all path in system
(defun companygenerate (stringa)
  "Function that generate needed arguments for clang.
STRINGA - must be a string"

  (shell-command "LANG=C gcc -xc . -v 2>&1|grep -i '^ /.*/include'|sed 's/^ //g'" "shell-command-output")
  (switch-to-buffer "shell-command-output")
  (goto-char (point-min))
  (while (not (equal (point)(point-max)))
    (move-beginning-of-line nil)
    (if (equal (char-after) ?\x20)
        (delete-char 1))
    (insert stringa)
    (move-beginning-of-line nil)
    (move-end-of-line nil)
    (insert "\")")
    (forward-line)
    )
  (eval-buffer)
  (defvar ebuf (current-buffer))
  (switch-to-prev-buffer)
  (kill-buffer ebuf)
  )
(companygenerate "(add-to-list 'company-clang-arguments \"-I")
(companygenerate "(add-to-list 'company-c-headers-path-system \"")

(provide 'setup-env)
;;; setup-env.el ends here
