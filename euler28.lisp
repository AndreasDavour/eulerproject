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

;; this attempt to just get four numbers recurse forever
;; time for a refactor branch

(defun euler28 (interval)
(loop until number = (* 1001 1001)
      interval = interval + 1
 (loop 
   get next odd number with an interval of N
   until you have four)))

;; oddies x 2:: skip -> x:: oddies x+1 3:: skip -> x:: oddies x+1 4

(defun produce-four-numbers (start intermediates)
"This will return the next four numbers to add up."
  (let ((results)
	(evens intermediates))
    (do ((count start (incf count)))
	((= 4 (length results)))
      (cond
	((and (oddp count) (> evens (- intermediates 1)))
	 (setf evens 0)
	 (push count results))
	((evenp count)
	 (incf evens))))
    (nreverse results)))

(defun skip-to-next-range (count gap)
  "This will return the first number of the next range."
  (do ((c count (incf c))
       (evens 0))
      ((= evens gap) c)
    (if (evenp c)
	(incf evens))))

