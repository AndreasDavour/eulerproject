;;;; Problem 7 - 10001st prime

;;; By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can
;;; see that the 6th prime is 13.
;;; 
;;; What is the 10 001st prime number?

(defun primep (p)
  (let ((divisor nil))
    (loop for i from 3 to (- p 1) do
      (if (zerop (mod p i))
	  (push 0 divisor)))
    (if (find 0 divisor)
	nil
	t)))

(defun bigprime (x)
"A very stupid implememtation to brute force the problem."
  (let ((primes nil))
    (loop for i upfrom 2 until (equal (+ 1 x) (length primes)) do
      (if (primep i)
	  (push i primes)))
    (first primes)))

;; CL-USER> (time (bigprime 10001))
;; Evaluation took:
;;   137.353 seconds of real time
;;   137.419299 seconds of total run time (137.419299 user, 0.000000 system)
;;   100.05% CPU
;;   342,583,589,017 processor cycles
;;   16,318,496 bytes consed
;;   
;; 104743
;; CL-USER>
