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

(defun numberwords (limit)
  (let ((tmp )) 
    (loop for i from 1 to limit 
	  do (push (format nil "~R" i) tmp))
    tmp))

(defun number-of-words (limit)
  "Creating a list of words, adding in \"and\" when needed"
  (let ((tmp )) 
    (loop :for i :from 1 :to limit
	  :if (> i 100)
	    :do (push (string-with-and i) tmp)
	  :else
	    :if (= 0 (mod i 100))
	      :do (push (format nil "~R" i) tmp)
	  :else
	    :do (push (format nil "~R" i) tmp)
	  :end)
    tmp))

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

(defun string-with-and (p)
  (let* ((number-string (format nil "~R" p))
	 (start-value 0)
	 (end-value (length number-string))
	 (space-value (position #\Space (format nil "~R" p) :from-end t))
	 (combined-string 
	   (concatenate 'string
			(subseq number-string start-value space-value)
			" and"
			(subseq number-string space-value end-value))))
    combined-string))

(defun sum-words (w)
  (let ((tmp 0))
    (labels ((summer (n)
	       ;; end of list?
	       (if (null n)
		   nil
		   ;; if not, add the sum of chars and recurse to next
		   (progn 
		     (setf tmp (+ tmp (sum-string (car n))))
		     (summer (cdr n))))))
      (summer w))
    tmp))

;;; (sum-words (numberwords 1000))
;;; -> 21151
;;; 21124 (off by 27, why??)
