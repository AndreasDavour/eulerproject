;;;; Problem 6 - Sum square difference

;;; The sum of the squares of the first ten natural numbers is,
;;; 1^2 + 2^2 + ... + 10^2 = 385
;;; 
;;; The square of the sum of the first ten natural numbers is,
;;; (1 + 2 + ... + 10)^2 = 55^2 = 3025
;;; 
;;; Hence the difference between the sum of the squares of the first ten
;;; natural numbers and the square of the sum is 3025 − 385 = 2640.
;;; 
;;; Find the difference between the sum of the squares of the first one
;;; hundred natural numbers and the square of the sum.

(defun sum-squares-upto (x)
  (let ((vals nil))
    (loop for i from 1 to x do
      (push (expt i 2) vals))
    (apply #'+ vals)))

(defun square-sum-upto (x)
  (let ((vals nil))
    (loop for i from 1 to x do
      (push i vals))
    (expt (apply #'+ vals) 2)))

(defun sum-difference-upto (x)
  (- (square-sum-upto x) (sum-squares-upto x)))

;; CL-USER> (sum-difference-upto 100)
;; 25164150
;; CL-USER>
