;;;; Problem 1

;;; If we list all the natural numbers below 10 that are multiples of 3 or 5,
;;; we get 3, 5, 6 and 9. The sum of these multiples is 23.
;;; 
;;; Find the sum of all the multiples of 3 or 5 below 1000.

;; 3 5 6 9
(defun 3/5-multiples (below)
  "lists the multiples of 3 or 5 up until but not including BELOW"
  (loop for num from 1 upto (- below 1)
     do
       (cond ((equal 0 (mod num 3)) (print num))
	     ((equal 0 (mod num 5)) (print num))
	     (t nil))))

;; 10 -> 23
;; 1000 -> 233168
(defun 3/5-multiples-sum (below)
  "lists the sum of all multiples of 3 or 5,
up until but not including BELOW"
  (let ((sum nil))
    (dotimes (x below (apply #'+ sum))
      (cond ((equal 0 (mod x 3)) (push x sum))
	    ((equal 0 (mod x 5)) (push x sum))
	    (t nil)))))
