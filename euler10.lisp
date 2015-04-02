
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

;; is this it??
;; make this a LABELS function and wrap it
;; TODO - fix in 2 and 3
(defun apa (p i)
  (cond
    ((and (evenp p) (not (= p 2))) nil)
    ((= i (- p 1)) t)
    ((= 0 (mod p i)) nil)
    (t (apa p (+ i 1)))))

(defun primep (p)
  (labels ((apa (p i)
	     (cond
	       ((and (evenp p) (not (= p 2))) nil)
	       ((= i (- p 1)) t)
	       ((= 0 (mod p i)) nil)
	       (t (apa p (+ i 1))))))
    (apa p 3)))
	   
    

(defun primep (p)
  (loop for i from 2 to (- p 1)
	if (= 0 (mod p i))
	  do (loop-finish)
	else
	  do (return t)
	end))


    (if (= 0 (mod p i))
	(loop-finish)
	(return t))))

(defun primep (p)
  (loop for i from 2 to (- p 1) do
    (format t "p:~A i:~A modulo:~A~%" p i (mod p i))))

(defun primep (p)
  (loop for i from 3 to (- p 1) do
    (if (= 0 (mod p i))
	(loop-finish)
	(return t))))

(defun primep (p)
  (let ((nums (loop for i from 2 to (- p 1) collect i)))
    (dolist (x nums)
      (format t "~A " (zerop (mod p x))))))


(defun problem10 (max)
  (let ((primes nil))
    (dotimes (x max)
      (if (primep x)
	  (push x primes)))
    primes))
;    (apply #'+ primes)))
      
(defun problem10 ()
  (loop for i from 1 to 2000000
	
