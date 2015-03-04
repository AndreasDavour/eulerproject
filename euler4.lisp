;;;; Problem 4 - Largest palindrome product

;;; A palindromic number reads the same both ways. The largest palindrome
;;; made from the product of two 2-digit numbers is 9009 = 91 × 99.
;;; 
;;; Find the largest palindrome made from the product of two 3-digit numbers.

;; 993*913 = 906609
;; 995 x 583 = 580085
(defun palindrome-numberp (p)
  "Util function for FIND-PALINDROME."
  (if (equal (write-to-string p) (reverse (write-to-string p)))
      t
      nil))

(defun find-palindrome ()
  "Finds the biggest palindrome number, made from the product of two 3 digit numbers."
  (let ((palindromes nil))
  (loop for i downfrom 999 to 100
	do (loop for j downfrom 999 to 100
		 do (if (palindrome-numberp (* i j))
			(push (* i j) palindromes))))
    (first (reverse (sort palindromes #'<)))))

(defun findp ()
  "Find the biggest palindrome number, less than 999 x 999."
  (loop for i from (* 999 999) downto (* 100 100) until (palindromep i)
	finally (print i)))
