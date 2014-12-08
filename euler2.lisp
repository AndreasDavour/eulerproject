;;; Eulerproject 
;;;
;;; Problem 2 - sum of even fibonicci numbers below 4 million

(defun fib (x)
  (cond ((equal x 1) 1)
	((equal x 2) 1)
	(t (+ (fib (- x 1)) (fib (- x 2))))))

;; 4613732
(let ((sum nil))
  (do* ((n 1 (+ n 1))
       (value 0 (fib n)))
      ((> value 4000000))
    (if (evenp value)
	(push value sum)))
  (apply #'+ sum))
