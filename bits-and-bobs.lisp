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
  (let ((divisor nil))
    (loop for i from 3 to (- p 1) do
      (if (zerop (mod p i))
	  (push 0 divisor)))
    (if (find 0 divisor)
	nil
	t)))
