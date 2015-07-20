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

(merge 'string
       (subseq (format nil "~R" 432) (position #\Space (format nil "~R" 432)))
       (subseq (format nil "~R" 432) 0 (position #\Space (format nil "~R" 432) :from-end t))
       #'(lambda (x y) t))

(defun number-of-words (limit)
  (let ((tmp )) 
    (loop for i from 1 to limit 
	  do (push (format nil "~R" i) tmp))
    tmp))

(defun number-of-words (limit)
  "Creating a list of words, adding in \"and\" when needed"
  (let ((tmp )) 
    (loop :for i :from 1 :to limit
	  :if (or (> p 100) (not (mod i 100)))
	    :do (push (format nil "~R" i) tmp)
	  :else
	    :do (push (format nil "~R" i) tmp)
	  :end)
    tmp))


;; (defun sum-string (s)
;;   "sum the amount of chars, minus whitespace"
;;   (let ((tmp )
;; 	(total 0))
;;     (setf tmp (remove #\- s))
;;     (setf tmp (remove #\Space tmp))
;;     (setf total (length tmp))
;;     (if (search "hundred" tmp)
;; 	(setf total (+ total 3)))
;;     total))

(defun sum-string (s)
  "sum the amount of chars, after zapping space and hyphens"
  (let ((result 0))
    (if (valid-datap s)
	(setf result (length s))
	(setf result (length (zap-unvalid-data s))))
    result))
	 
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
;;; 18451 (- 21124 18451)

;;; another approach
;;; have a function that filers vaild data
;;; count amount of "and" and add it in
;;; loop over numbers and apply filter while adding, finally add in "and" total

(defun valid-datap (data)
  "Predicate to find valid data."
  (not (or (find #\Space data)
	   (find #\- data))))

(defun zap-unvalid-data (data)
  "Remove #\Space and #\- from DATA."
  (remove #\- (remove #\Space data)))

(defun euler17 ()
  "21124"
  (let ((result 0))
    (loop :for p :from 1 :to 1000
	  :for tmp = (format nil "~R" p)
	  :if (valid-datap tmp)
	    :do (setf result (+ result (length tmp)))
;		(print tmp)
	  :else
	    :do (setf result (+ result (length (zap-unvalid-data tmp))))
;		(print tmp)
	  :End)
    ;; Adding in the length of the "and" strings
    ;; add 3 for every number
    ;; subtract 3 for every number below 100
    ;; subtract one for each hundred, and subtract one for "thousand"
    ;; add the reminder to RESULT
					;    (+ result (* 3 (- 1000 100 10)))))
					;(- (+ result 3000) 30 300 1)))
    (+ result (* 3
		 (- 1000 ; all numbers
		    100  ; the first 100 numbers
		    9    ; 200, 300, 400 etc
		    1    ; "thousand"
		    ))))) ;; still missing 3 more, WTF?!

;; total plus three characters for every entry,
;; minus every even hundred
;; minus 1 for "thousand"
	  
		
		
;; (loop :for p :from 1 :to 1000
;;       :if (or (> p 100) (mod 100 p))
;; 	:do (format t "p and no 'and' ~%")
;;       :else
;; 	:do (format t "p and ~A " p)
;;       :end)

		 
		   
