;;;; Problem 9 - Special Pythagorean triplet

;;; A Pythagorean triplet is a set of three natural numbers, a < b < c,
;;; for which, a^2 + b^2 = c^2
;;; 
;;; For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.
;;; 
;;; There exists exactly one Pythagorean triplet for which
;;; a + b + c = 1000.  Find the product abc.


;; first case
;; (+ (expt i 2) (expt (+ i 1) 2)) = (expt (+ i 2) 2)

;; second case
;; (+ (expt i 2) (expt (+ i 1) 2) (expt (+ i 2) 2)) = 1000


(defun find-pythagorean-triplets (max)
  (loop for i upfrom 1
	do (if (equal (+ (expt i 2) (expt (+ i 1) 2)) (expt (+ i 2) 2))
	       (format t "a:~A b:~A c:~A~%" i (+ i 1) (+ i 2))
	       nil)
	until (> (expt (+ i 2) 2) max)))
	       
	until (> 
	
	finally (format t "Finally - a:~A b:~A~%" i (+ i 1))))
		     
		       

(defun find-pyth-triplet (num)
  "Finds the Pythagorean triplet for sum 1000"
  (loop for i from 1
	until (or (equal num (+ (expt i 2) (expt (+ i 1) 2) (expt (+ i 2) 2))) (> i num))
	do (print (+ (expt i 2) (expt (+ i 1) 2)


 (expt (+ i 2) 2)))
	finally (format t "a:~A b:~A c:~A~%" i (+ i 1) (+ i 2))))

;; (find-pyth-triplet 25)
;; 1085 a:18 b:19 c:20
(defun find-pyth-triplet (num)
  "Finds the Pythagorean triplet for sum 1000"
  (let ((result 0))
    (loop for i from 1
	  do (setf result (+ (expt i 2) (expt (+ i 1) 2) (expt (+ i 2) 2)))
	     (print result)
	  until (or (equal num result) (> result num))
	  finally (format t "a:~A b:~A c:~A~%" i (+ i 1) (+ i 2)))))

;; (find-pyth-triplet 25)
;; a:3 b:4
(defun find-pyth-triplet (num)
  "Finds the Pythagorean triplet for sum 25"
  (loop for i from 1
	until (equal num (+ (expt i 2) (expt (+ i 1) 2)))
	finally (format t "a:~A b:~A~%" i (+ i 1))))
