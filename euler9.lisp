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

;; [ante@adavour ~]$ python e9.py
;; a = 200, b = 375, c = 425.  abc = 31875000

;; this is the best so far
(defun problem9 ()
  "Finding triplets delimited by their sum.
The inner loop need to have a termination, and 400
was a sensible number. In an ideal world it would be
dynamically detected."
  (loop for a from 1 do
    (loop for b from 1 to 400 ; this is where it has to be!!!
	  for c = (- 1000 b a)
	  do (format t "~A ~A ~A~%" a b c)
	  when (= (* c c) (+ (* a a) (* b b)))
	        do (return-from problem9 (format t "a:~A b:~A c:~A result:~A~%" a b c (* a b c))))))

;; this is a better method, and more dynamical
;; and not dependant on the number 400
;; pre cogged into the code
;;
;; not working right now

;; b not incrementing??
(defun problem9 ()
  (loop for n from 0 do
    (loop for m from 1
	  for m2 = (* m m)
	  for n2 = (* n n)
	  for a = (- m2 n2)
	  for b = (* 2 m n)
	  for c = (+ m2 n2)
	  do (format t "m:~A   a:~A b:~A c:~A  sum:~A~%" m a b c (+ a b c))
	  until (= 1000 (+ a b c))
	  finally (* a b c))))


;;; CL-USER> (problem9)
;;; a:3 b:4 c:5  sum:12
;;; a:8 b:6 c:10  sum:24
;;; a:5 b:12 c:13  sum:30
;;; a:15 b:8 c:17  sum:40
;;; a:12 b:16 c:20  sum:48
;;; a:7 b:24 c:25  sum:56
;;; a:24 b:10 c:26  sum:60
