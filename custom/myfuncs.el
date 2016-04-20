(defun initproject()
  "Init my version project: git init, .gitignore with gtags file and CMake"
  (interactive)
  (shell-command "git init")
  (append-to-file "GTAGS\nGPATH\nGRTAGS\nbuild/\n" nil ".gitignore")

  )
(provide 'myfuncs)
