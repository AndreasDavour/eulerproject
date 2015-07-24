;;;; Problem 28 - Number spiral diagonals

;;; Starting with the number 1 and moving to the right in a clockwise
;;; direction a 5 by 5 spiral is formed as follows:
;;; 
;;; 21 22 23 24 25
;;; 20  7  8  9 10
;;; 19  6  1  2 11
;;; 18  5  4  3 12
;;; 17 16 15 14 13
;;; 
;;; It can be verified that the sum of the numbers on the diagonals is
;;; 101.
;;; 
;;; What is the sum of the numbers on the diagonals in a 1001 by 1001
;;; spiral formed in the same way?

(defparameter apa (make-array '(1001 1001)))

(defparameter matrix-size (* 1001 1001))

;; set the last entry on first row
(setf (aref apa 0 1000) matrix-size)

;; row-major-aref

(loop for i from 1 to 4
      do )

find x evens

;; (13 14 15 16 17 18 19 20 21 22 23 24 25)

;; In order to get the four numbers from the list above
;; sort out the number of even numbers.
;; In this iteration it is 2, and returns
;; (13 17 21 25)
;; Then skipt ahead a set amount to find the next range
;; which will be (31 37 43 49)

;; This function, regardless of the name, does not
;; make sure you get four number, which it should.
(defun four-numbers-with-even-interval (lst int)
  (let ((tmp int)
	(result))
    (labels ((helper (x counter)
	       (if (null x)
		   nil
		   (progn
		     (cond
		       ((and (oddp (car x)) (= counter int))
			(progn
			  (push (car x) result)
			  (helper (cdr x) 0)))
		       ((and (oddp (car x)) (not (= counter int)))
			(helper (cdr x) counter))
		       ((evenp (car x))
			(helper (cdr x) (incf counter))))))))
      (helper lst tmp))
    (nreverse result)))


;; this attempt to just get four numbers recurse forever
;; time for a refactor branch
(defun four-numbers-with-even-interval (lst int)
  (let ((tmp int)
	(result))
    (labels ((helper (x counter)
	       (if (= 4 (length result))
		   (cdr x)
		   (progn
		     (cond
		       ((and (oddp (car x)) (= counter int))
			(progn
			  (push (car x) result)
			  (helper (cdr x) 0)))
		       ((and (oddp (car x)) (not (= counter int)))
			(helper (cdr x) counter))
		       ((evenp (car x))
			(helper (cdr x) (incf counter))))))))
      (helper lst tmp))
    (nreverse result)))
