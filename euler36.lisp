;;;; Problem 36 - Double-base palindromes

;;; The decimal number, 585 = 10010010012 (binary), is palindromic in both
;;; bases.
;;; 
;;; Find the sum of all numbers, less than one million, which are
;;; palindromic in base 10 and base 2.
;;; 
;;; (Please note that the palindromic number, in either base, may not
;;; include leading zeros.)

(defun double-palindrome-number-sum (max)
  (let ((all-numbers))
    (loop 
      :for p :from 1 :to max
      :for binary-palindromep = (equal (write-to-string p :base 2)
				       (reverse (write-to-string p :base 2)))
      :for decimal-palindromep = (equal (write-to-string p :base 10)
					(reverse (write-to-string p :base 10)))
      :do (if (and binary-palindromep decimal-palindromep)
	      (push p all-numbers)))
    (apply #'+ all-numbers)))

;; (double-palindrome-number-sum 1000000)
;; -> 872187
