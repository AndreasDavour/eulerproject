(defun even-divisor (x y)
  (if (zerop (mod x y))
      t
      nil))

(defun divisor (d)
  (loop for i upfrom 2 until (even-divisor d i)
     finally (print i)))

(defun divisible-by (n d)
  (zerop (mod n d)))

(defun primep (p)
  (labels ((apa (p i)
	     (cond
	       ((or (= p 2) (= p 3)) t)
	       ((and (evenp p) (not (= p 2))) nil)
	       ((= i (- p 1)) t)
	       ((= 0 (mod p i)) nil)
	       (t (apa p (+ i 1))))))
    (apa p 3)))
