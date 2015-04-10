;;;; Problem 23 - Non-abundant sums

;;; A perfect number is a number for which the sum of its proper divisors
;;; is exactly equal to the number. For example, the sum of the proper
;;; divisors of 28 would be 1 + 2 + 4 + 7 + 14 = 28, which means that 28
;;; is a perfect number.
;;; 
;;; A number n is called deficient if the sum of its proper divisors is
;;; less than n and it is called abundant if this sum exceeds n.
;;; 
;;; As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the
;;; smallest number that can be written as the sum of two abundant numbers
;;; is 24. By mathematical analysis, it can be shown that all integers
;;; greater than 28123 can be written as the sum of two abundant
;;; numbers. However, this upper limit cannot be reduced any further by
;;; analysis even though it is known that the greatest number that cannot
;;; be expressed as the sum of two abundant numbers is less than this
;;; limit.
;;; 
;;; Find the sum of all the positive integers which cannot be written as
;;; the sum of two abundant numbers.

;; ok
(defun even-divisors (n)
  (let ((divisors nil))
    (push 1 divisors)
    (loop for i from 2 to (- n 1) do
      (if (zerop (mod n i))
	  (push i divisors)))
    divisors))

;; ok
(defun even-divisors-sum (n)
  (let ((divisors nil))
    (push 1 divisors)
    (loop for i from 2 to (- n 1) do
      (if (zerop (mod n i))
	  (push i divisors)))
    (apply #'+ divisors)))

(defun perfect-numberp (n)
  "Is the number equal to the sum of it's diviors?"
  (equal (even-divisors-sum n) n))

(defun abundant-numberp (n)
  "Is the sum of the divisors greater than the number?"
  (> (even-divisors-sum n) n))

(defun deficient-numberp (n)
  "Is the sum of the divisors less than the number?"
  (< (even-divisors-sum n) n))

(defun all-deficient-below (b)
  (let ((deficient nil))
    (loop for i from 1 to (- b 1) do
      (if (and (deficient-numberp i) (not (abundant-numberp i)))
	  (push i deficient)))
    deficient))

(defun all-perfect-below (b)
  "Test all numbers below B for perfectness."
  (let ((perfect nil))
    (loop for i from 1 to (- b 1) do
      (if (perfect-numberp i)
	  (push i perfect)))
    perfect))

;; ok
(defun all-abundant-below (b)
  "Test all numbers below B for abundanceness."
  (let ((abundance nil))
    (loop for i from 1 to (- b 1) do
      (if (and (abundant-numberp i) (not (perfect-numberp i)))
	  (push i abundance)))
    abundance))

;; this seems to run out of heap space and I've run out of interest
(defun sum-abundants (abund)
  (let ((sum nil))
    (loop for i in abund do
      (loop for j in abund do
	(if (< (+ i j) 28123)
	    (progn
	      (push (+ i j) sum)
	      (format t "i:~A j:~A~%" i j)))))
    (remove-duplicates sum)))
