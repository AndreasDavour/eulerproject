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

;;;;;;;;;;;;;;;;;;;;

;; 1
(defun generate-list (max)
  (let ((l nil))
    (dotimes (x max)
      (push (+ 1 x) l))
    (cdr (nreverse l))))

;; 2
(defun remove-even-ones (list)
  (delete-if #'(lambda (x) (and (> x 2) 
				(evenp x))) 
	     list))
;; 3
(defun remove-all-multiples-greather-than-prime (prime list)
  (delete-if #'(lambda (x) (and (equal 0 (mod x prime))
				(> x prime))) 
	     list))

(defun remove-multiples (numbers prime)
  (delete-if #'(lambda (x) (cond
			     ((eql prime x) t)
			     ((= 0 (mod x prime)) t))) numbers))

;; 4
(defun factors (number)
  (let ((start-list nil)
	(short-list nil))
    (setf start-list (generate-list number number))
    (remove-even-ones start-list)
    (setf short-list (remove-all-multiples-greather-than-prime (car start-list) start-list))

(defun traverse-list (l)
  (if (equal l nil)
      t
      (traverse-list (cdr l))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
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
;; ;;; 2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37
(defun f (x)
  (let ((start-list nil)
	(prime nil))
					;1
;    (loop for i from 2 to (truncate (sqrt x)) do
      (loop for i from 2 to x do
	 (push i start-list)
	 (format t "1. Build list up to: ~A~%" i))
					;2
    (setf start-list (delete-if #'(lambda (x) (and (> x 2) 
						   (evenp x))) 
				start-list))
    (format t "2. List with all even numbers zapped: ~A~%" start-list)
    (format t "2.1 Now save the first number on the list as a prime~%")
    (setf primes (car)
    (setf start-list (cdr start-list))
    (format t "3. Now remove from the list"
    (loop for i in start-list do
					;3
	 (push (car start-list) primes)
	 (format t "4. found primes: ~A~%" primes)			;4
	 (format t "start-list: ~A~%" start-list)
	 (setf start-list
	       (delete-if #'(lambda (x) (cond  ((eql (car primes) x) t) ((= 0 (mod x (car primes))) t))) start-list))
	 (format t "start-list after DELETE-IF : ~A~%" start-list)
	 (format t "repeast list: ~A~%" start-list)
	 (format t "primes: ~A~%" primes)
	 (format t "~A~%" (nreverse primes)))))))))

;; (defun remove-multiples (prime number-list)
;;   (setf number-list (delete-if #'(lambda (x) (cond  ((eql prime x) t) ((= 0 (mod x prime)) t))) number-list)))
;; CL-USER> (remove-multiples 5 (list 15 10 9 8 7 5 3 2))
;; (9 8 7 3 2)

(defun generate-list (max)
"Returns a list of numbers bigger than 1 up to MAX."
  (let ((l nil))
    (dotimes (x max)
      (push (+ 1 x) l))
    (cdr (nreverse l))))

(defun remove-multiples (numbers prime)
  "Clobber the prime and multiples from sieve."
  (delete-if #'(lambda (x) (cond
			     ((eql prime x) t)
			     ((= 0 (mod x prime)) t))) numbers))

(defun remove-evens (numbers)
  "Clobber even numbers, as they can't be primes."
  (delete-if #'(lambda (x) (and (> x 2) 
				(evenp x))) numbers))
(defun test (n)
  (loop for i in (generate-list n)
	do (print i)
	until (> i (1- (sqrt n)))))
