
; 2. Give three distinct cons expressions that return (a b c).
; ???

; 3. Using car and cdr, define a function to return the fourth element of a
; list.
(defun get-4th (lst &optional (n 4))
    (if (= n 1) (car lst)
        (get-4th (cdr lst) (- n 1)))
)

; (format t "4th is: ~A~%" (get-4th '(1 2 3 4 5 6)))
; (princ #\Newline)

; (format t "4th is: ~A~%" (get-4th '(4 5 6 69 123)))
; (princ #\Newline)

; (format t "4th is: ~A~%" (get-4th '(101 111 12312 12312414)))
; (princ #\Newline)


; 4. Define a function that takes two arguments and returns the greater of
; the two.
(defun get-greater (a b)
    (if (= a b) nil
        (if ( > (- a b) 0) a
            b)))

; (princ (get-greater 69 123))


; 5. What do these functions do?
; (a) (defun enigma (x)
;       (and (not (null x))
;           (or (null (car x))
;               (enigma (cdr x)))))
; 
; (b) (defun mystery (x y)
;       (if (null y)
;           nil
;           (if (eql (car y) x)
;               0
;               (let ((z (mystery x (cdr y))))
;                   (and z (+ z 1))))))
; 
; (a) check whether list contains NIL, it must be not empty
; (b) if y is empty -> nil; if head = x -> 0; AND for INT returns 2nd arg.
; hence it counts steps needed to find x in y ???
; 

; (defun mystery (x y)
;     (if (null y)
;         nil
;         (if (eql (car y) x)
;             0
;             (let ((z (mystery x (cdr y))))
;                 (+ z 1)))))


; (princ (mystery 4 '(3 4 5 6 7))) ; 1231
; (princ #\Newline)

; (princ (mystery 4 '(2 3 4 5 6 7)))
; (princ #\Newline)

; (princ (mystery 4 '(1 2 3)))
; (princ #\Newline)



; 7. Using only operators introduced in this chapter, define a function that
; takes a list as an argument and returns true if one of its elements is a
; list.
(defun has-a-list (lst)
    (if (null lst)
        nil
        (if (listp (car lst)) t
            (has-a-list (cdr lst)))))

(defun has-a-list-modified (lst)
  (dolist (item lst nil)
    (when (listp item) (return t))))

; (princ (has-a-list '(1 2 3 4 (1 2 3))))
; (princ #\Newline)
; (princ (has-a-list '(1 2 3 4 5)))
; (princ #\Newline)
; (princ (has-a-list '(((())))))
; (princ #\Newline)
; (princ #\Newline)
; (princ (has-a-list-modified '(1 2 3 4 (1 2 3))))
; (princ #\Newline)
; (princ (has-a-list-modified '(1 2 3 4 5)))
; (princ #\Newline)
; (princ (has-a-list-modified '(()) ))
; (princ #\Newline)


; 8. Give iterative and recursive definitions of a function that
; (a) takes a positive integer and prints that many dots.
; (b) takes a list and returns the number of times the symbol a occurs in it

; (a)
(defun print-dots-rec (n &optional (acc ""))
    (if (<= n 0) 
        (princ acc)
        (print-dots (- n 1) (concatenate 'string acc "."))))


(defun print-dots-iter (n)
    (let ((dots ""))
        (dotimes (i n)
            (setf dots(concatenate 'string dots ".")))
        (princ dots)
    ))

; (print-dots-iter 100)

; (b)
(defun count-entries-rec (x lst &optional (acc 0))
    (if (null lst) 
        acc
        (if (= (car lst) x)
            (count-entries-rec x (cdr lst) (+ acc 1))
                (count-entries-rec x (cdr lst) (+ acc 0)))))


(defun get-ith-item (i lst)
    (if (null lst) nil
        (if (= i 0)
            (car lst)
                (get-ith-item (- i 1) (cdr lst)))
))


(defun count-entries-iter (x lst)
    (let 
        ((c 0))
            (dotimes (i (list-length lst))
                (if (= x (get-ith-item i lst))
                    (setf c (+ c 1))
                )) c ))


(princ (count-entries-rec 1 '(1 2 3 4 1 1 2 3 1)))
(princ #\Newline)

(princ (count-entries-rec 0 ' (1 2 3 4 5 6)))
(princ #\Newline)

(princ (count-entries-iter 1 '(1 2 3 4 1 1 2 3 1)))
(princ #\Newline)

(princ (count-entries-iter 0 ' (1 2 3 4 5 6)))
(princ #\Newline)


; 9. A friend is trying to write a function that returns the sum of all the
; non-nil elements in a list. He has written two versions of this function,
; and neither of them work. Explain what's wrong with each, and give a
; correct version:
; (a) (defun summit (1st)
;   (remove nil 1st)
;       (apply #' + 1st))
; 
; (b) (defun summit (1st)
;       (let ((x (car 1st)))
;           (if (null x)
;               (summit (cdr 1st))
;                   (+ x (summit (cdr 1st))))))

(defun summit-a (lst)
    (apply #'+ (remove nil lst)))

; (defun summit (lst)
;     (let ((x (car lst)))
;         (if (null x)
;             (summit (cdr lst))
;                 (+ x (summit (cdr lst))))))
(defun summit (lst)
    (if (null lst)
        0
        (if (null (car lst))
            (summit (cdr lst))
                (+ (car lst) (summit (cdr lst))))))

(princ (summit-a '(1 2 3 4 5)))
(princ #\Newline)

(princ (summit '(1 2 3 4 5)))
(princ #\Newline)



