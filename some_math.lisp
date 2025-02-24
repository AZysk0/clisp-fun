(defun partial (func &rest args1)
  (lambda (&rest args2)
    (apply func (append args1 args2))))


(defun fact (n &optional (acc 1))
    (if (<= n 1) acc
        (fact (- n 1) (* acc n))))


(defun fib (n)
    (if (< n 0) 0
        (if (= n 1) 1
            (+ (fib (- n 1)) (fib (- n 2))))))


; F(n) = F(n-1) + F(n-2)
; F(n-1) = F(n-2) + F(n-3)
; ... F(2) = F(0) + F(1), 
; F(1) = 1, F(0) = 0
(defun fib_tail (prev curr n)
    (if (= n 0) curr
        (fib_tail curr (+ prev curr) (- n 1))))


(defun fib_p (n)
    (fib_tail 0 1 n))


; (trace fib_tail)
; (fib_p 10)
; (princ (mapcar #'fib_p '(1 2 3 4 5 6 7 8 9 10 11 12)))

