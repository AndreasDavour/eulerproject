;;;; Problem 3 - largest prime factor

;;; The prime factors of 13195 are 5, 7, 13 and 29.
;;;
;;; What is the largest prime factor of the number 600851475143 ?

;;; primes
;;; 2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37

(defun even-divisor (x y)
  (if (zerop (mod x y))
      t
      nil))

(defun divisor (d)
  (loop for i upfrom 2 until (even-divisor d i)
     finally (print i)))

(defun divisible-by (n d)
  (zerop (mod n d)))

(defun factorize (n)
  "Find prime factors of N."
  (let ((i 2)
	(result n)
	(factors nil))
    (loop until (= result 1) do
	 (if (divisible-by result i)
	     (progn
	       (setf result (/ result i))
	       (push i factors))
	     ; factor found, go for the next one
	     (setf i (+ i 1))))
    factors))

(defun biggest-divisor (n)
  (first (factorize n)))
