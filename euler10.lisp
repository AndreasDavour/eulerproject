
;;;; Problem 10 - Summation of primes

;;; The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
;;; 
;;; Find the sum of all the primes below two million.

;; primes
;; 2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97

;; (defun primep (p)
;;   (loop for i from 3 to (- p 1)
;; 	if (or (zerop (mod p i)) (evenp p))
;; 	  return nil
;; 	else return p))

(defun apa (p i)
  (cond
    ((or (= p 2) (= p 3)) t)
    ((and (evenp p) (not (= p 2))) nil)
    ((= i (- p 1)) t)
    ((= 0 (mod p i)) nil)
    (t (apa p (+ i 1)))))

(defun primep (p)
  (labels ((apa (p i)
	     (cond
	       ((or (= p 2) (= p 3)) t)
	       ((and (evenp p) (not (= p 2))) nil)
	       ((= i (- p 1)) t)
	       ((= 0 (mod p i)) nil)
	       (t (apa p (+ i 1))))))
    (apa p 3)))

(defun problem10 (max)
  (let ((primes nil))
    (dotimes (x max)
      (if (primep x)
	  (push x primes)))
    primes))
;    (apply #'+ primes)))

(defun problem10 (max)
  (let ((primes nil))
    (loop for x from 2 to max do
      (if (primep x)
	  (push x primes)))
    (apply #'+ primes)))

;; CL-USER> (problem10 2000000)
;; 142913828922
