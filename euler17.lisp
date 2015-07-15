;;;; Problem 17 - Number letter counts

;;; If the numbers 1 to 5 are written out in words: one, two, three, four,
;;; five, then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.
;;; 
;;; If all the numbers from 1 to 1000 (one thousand) inclusive were
;;; written out in words, how many letters would be used?
;;; 
;;; NOTE: Do not count spaces or hyphens. For example, 342 (three hundred
;;; and forty-two) contains 23 letters and 115 (one hundred and fifteen)
;;; contains 20 letters. The use of "and" when writing out numbers is in
;;; compliance with British usage.

(defun sum-string (s)
  "sum the amount of chars, minus whitespace"
  (let ((tmp )
	(total 0))
    (setf tmp (remove #\- s))
    (setf tmp (remove #\Space tmp))
    (setf total (length tmp))
    (if (search "hundred" tmp)
	(setf total (+ total 3)))
    total))
    
    


(defun numberwords (limit)
  (let ((tmp )) 
    (loop for i from 1 to limit 
	  do (push (format nil "~R" i) tmp))
    tmp))

;; recurse through the words works fine
(defun numbercurse (n)
  (if (null n)
      nil
      (numbercurse (cdr n))))

(defun sum-words (w)
  (let ((tmp 0))
    (labels ((summer (n)
	       ;; end of list?
	       (if (null n)
		   nil
		   (if (search "hundred" (car n))
		       ;; hundreds, but is there a dash?
		       (if (search "-" (car n)) 
			   (progn
			     (setf tmp (+ 3 tmp 1 (length (remove #\- (car n)))))
			     (summer (cdr n)))
			   ;; hundreds, but no dash
			   (progn
			     (setf tmp (+ 3 tmp 1 (length (car n))))
			     (summer (cdr n))))
		       ;; not hundreds
		       (if (search "-" (car n))
			   ;; but there is a dash
			   (progn
			     (setf tmp (+ tmp 1 (length (remove #\- (car n)))))
			     (summer (cdr n)))
			   ;; no hundreds, and no dash
			   (progn
			     (setf tmp (+ tmp 1 (length (car n))))
			     (summer (cdr n))))))))
      (summer w))
    tmp))

(defun sum-words (w)
  (let ((tmp 0))
    (labels ((summer (n)
	       ;; end of list?
	       (if (null n)
		   nil
		   (if (search "-" (car n))
		       (progn
			 (setf tmp (+ tmp 1 (length (remove #\Space (remove #\- (car n))))))
			 (summer (cdr n)))
		       (progn
			 (setf tmp (+ tmp 1 (length (remove #\Space (car n)))))
			 (summer (cdr n)))))))
		     
      (summer w))
    tmp))

