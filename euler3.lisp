;;;; Problem 3 - largest prime factor

;;; The prime factors of 13195 are 5, 7, 13 and 29.
;;;
;;; What is the largest prime factor of the number 600851475143 ?

;;; primes
;;; 2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37

(defun primep (p)
  (let ((divisor -1))
    (do ((x 2 (+ x 1)))
	((> x p) divisor)
      (setf divisor (mod p x))
      (if (and (equal divisor 0) (< x p))
	  (progn 
	    (format t "Not a prime~%") 
	    (return))
	  (progn
	    (format t "~A is a prime" p)
	    (return))))))

(defun primep (p)
  (let ((divisor -1))
    (do ((x 2 (+ x 1)))
	((> x p) divisor)
      (setf divisor (mod p x))
      (if (and (equal divisor 0) (< x p))
	  (return nil)
	  (return t)))))

(defun factorize (p)
  (let 	((factors nil)
	 (result 0))
    (do ((x 2 (+ x 1)))
	((>= x (sqrt p)))
      (setf result (mod p x))
       (if (equal result 0)
	   (print result)))))
; 	  (push result factors)))
;     (nreverse factors)))
	 
      (setf divisor (mod p x))
      (if (and (equal divisor 0) (< x p))
	  (return nil)
	  (return t)))))

; Metoden kallas för Eratosthenes såll och utgörs av följande steg:
; 
; 1. Gör först en lista med alla heltal större än 1 upp till en viss
;    övre gräns n .
; 2. Stryk från listan alla jämna tal större än 2.
; 3. Listans nästa tal som inte är struket är ett primtal.
; 4. Stryk sedan alla tal, som är större än det primtal som du hittade
;    i det föregående steget, och samtidigt är multiplar av det
;    primtalet.
; 5. Upprepa nu steg 3-4 tills nästa tal på listan som varken är
;    struket eller ett primtal är större än kvadratroten ur talet n
;    (den övre gränsen).
; 6. Alla tal som nu återstår på listan är primtal.

(defun f (x)
  (let ((start-list nil)
	(primes nil))
					;1
    (loop for i from 2 to (truncate (sqrt x)) do
	 (push i start-list)
	 (format t "1. range counter: ~A~%" i))
					;2
    (setf start-list (delete-if #'(lambda (x) (and (> x 2) 
						   (evenp x))) 
				start-list))
    (format t "2. zapped evens list: ~A~%" start-list)
    
    (loop for i in start-list do
					;3
	 (push (car start-list) primes)
		(format t "4. found primes: ~A~%" primes)			;4 
	 (setf start-list (delete-if #'(lambda (x) (and (equal 0 (mod x (car primes))) 
							(> x (car primes)))) 
				     start-list))
	 (format t "repeast list: ~A~%" start-list)
	 (print (nreverse primes)))))

(defun remove-even-ones (list)
  (delete-if #'(lambda (x) (and (> x 2) 
				(evenp x))) 
	     list))

(defun remove-all-multiples-greather-than-prime (prime list)
  (delete-if #'(lambda (x) (and (equal 0 (mod x prime))
				(> x prime))) 
	     list))

