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

;;; main loop
  
(defun euler28 (max)
  (apply #'+ 
	 (do* ((n 2 (incf n))
	       (temp (produce-four-numbers 2 1))
	       (total (cons 1 temp)
		      (setf total (append total temp))))
	      ((= (* max max) (fourth temp)) total)
	   (setf next (skip-to-next-range (fourth temp) n))
	   (setf temp (produce-four-numbers next n)))))
