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

;;;; first attempt and some scratch code

;;;;
;;;; Fn = Fn-1 + Fn-2
;;;; F(n) = F(n-1) + F(n-2)
;;;; seed values
;;;; F1 = 1, F2 = 1

;;; 1 1 2 3 5 8
(defun fib (n)
  (cond
    ((= n 1) 1)
    ((= n 2) 1)
    (t (+ (fib (- n 1)) (fib (- n 2))))))

(defun fib (n)
  (if (<= n 2)
      1
      (+ (fib (- n 1)) (fib (- n 2)))))

(let ((sum nil))
  (do* ((n 1 (+ n 1)))
       ((> (fib n) 4000000))
    (push (fib n) sum))
  (apply #'+ sum))
