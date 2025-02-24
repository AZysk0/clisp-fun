(defun fact (n &optional (acc 1))
    (if (<= n 1) acc
        (fact (- n 1) (* acc n))))


(defun fib (n)
    (if (< n 0) 0
        (if (= n 1) 1
            (+ (fib (- n 1)) (fib (- n 2))))
     )
)


(def fib_acc ( ))

; (fib n 0) == (fib (n-1) 0) + (fib (n-2) 0)
; indices
; n -> 0
; (n - 1) -> 1
; (n - 2) -> 2 ...

; (trace fib)
; (princ (mapcar #'fib '(1 2 3 4 5 6 7 8 9 10 11)))
; (princ (mapcar #'fact '(1 2 3 4 5 6 7 8 9 10 11)))



; (princ (fib 0 0)) ; => 0
; (princ (fib 1 0)) ; => 1
; (princ (fib 2 0)) ; => 1
; (princ (fib 3 0)) ; => 2
; (princ (fib 4 0)) ; => 3
; (princ (fib 5 0)) ; => 5
; (princ (fib 6 0)) ; => 8


