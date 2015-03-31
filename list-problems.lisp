(asdf:load-system "cl-ppcre")

(defun problemlist ()
  (let ((files (directory "/home/ante/src/eulerproject/*.lisp"))
	(filelist nil))
    (dolist (f files)
      (with-open-file (fd f :direction :input)
	(push (nth-value 1 (cl-ppcre:scan-to-strings "^;;;; (.*$)" (read-line fd nil))) filelist)))
    (dolist (n filelist)
      (if n
	  (format t "~A~%" n)))))

(problemlist)
