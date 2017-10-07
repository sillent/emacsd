;;; setup-env.el  --- Environment setup
;;; Commentary:
;;; Author: siilent1987@yahoo.com
;;; Code:
;; SETUP clang and INCLUDE directive for company complete correctly usage all path in system
;; (shell-command "LANG=C gcc -xc . -v 2>&1 | grep include|grep \"^ \"" "shell-command-output")
(shell-command "LANG=C echo |gcc -gcc -E -Wp,-v - 2>&1|grep include| grep \"^ \"" "shell-command-ouput")
(switch-to-buffer "shell-command-output")
(goto-char (point-min))
(while (not (equal (point) (point-max)))
  (move-beginning-of-line nil)
  (if (equal (char-after) ?\x20)
      (delete-char 1))
  (insert "(add-to-list 'company-clang-arguments \"-I")
  (move-beginning-of-line nil)
  (move-end-of-line nil)
  (insert "\")")
  (next-line)
  )
(eval-buffer)
(switch-to-prev-buffer)

;; (shell-command "LANG=C gcc -xc . -v 2>&1 | grep include|grep '^ \/'" "shell-command-output-include")
(shell-command "LANG=C echo |gcc -gcc -E -Wp,-v - 2>&1|grep include| grep \"^ \"" "shell-command-ouput-include")
(switch-to-buffer "shell-command-output-include")
(goto-char (point-min))
(while (not (equal (point) (point-max)))
  (move-beginning-of-line nil)
  (if (equal (char-after) ?\x20)
      (delete-char 1))
  (insert "(add-to-list 'company-c-headers-path-system \"")
  (move-beginning-of-line nil)
  (move-end-of-line nil)
  (insert "\")")
  (next-line)
  )
(eval-buffer)
(switch-to-prev-buffer)

(provide 'setup-env)

(char-after)

;;; setup-env.el ends here
