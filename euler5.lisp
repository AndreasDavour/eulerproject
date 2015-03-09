;;;; Problem 5 - Smallest multiple

;;; 2520 is the smallest number that can be divided by each of the numbers
;;; from 1 to 10 without any remainder.
;;; 
;;; What is the smallest positive number that is evenly divisible by all
;;; of the numbers from 1 to 20?

(defun testcase20 (x)
  (let ((test nil))
    (loop for i from 1 to 20 do
      (push (mod x i) test))
    (if (equal '(0 0 0 0 0 0 0 0 0 0) test)
	t
	nil)))

(defun testcase10 (x)
  (let ((test nil))
    (loop for i from 1 to 10 do
      (push (mod x i) test))
    (if (equal '(0 0 0 0 0 0 0 0 0 0) test)
	t
	nil)))

;; doesn't work
(defun smallest-positive ()
  (loop for i from 1 until (testcase20 i)
	finally (print i)))

(let ((test nil)) 
  (loop for i from 232792550 to 232792560 do
    (loop for p from 1 to 20 do
      (push (mod i p) test))
    (format t "~A: ~A~%" (length test) test)
    (setf test nil)))
