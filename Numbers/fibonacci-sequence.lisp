;;;; A Fibonacci sequence calculator written in Lisp.
;;;; To run, compile the code into a repl and invoke
;;;; (fib-repl)

;;; This is the part that calculates the sequence.
;;; It saves each calculation in the memory, so that
;;; we don't need to calculate the whole sequence on
;;; each request.
;;;
;;; On each request, if the requested size is smaller
;;; than a previous calculation's size, it just
;;; returns the relevant part of the sequence.
;;; On the other hand, if the requested size is
;;; bigger, we calculate the remaining items while
;;; appending them to the end of the list.
(defvar prevMaxLen 2) ; previously largest index calculated
(defvar prevList '(1 1)) ; list of all previously calculated items
(defun smart-fib (n)
  (if (<= n prevMaxLen) (last prevList n)
      (let* ((x (smart-fib (1- n))) ; x is a list of previous items from biggest to smallest
	     (output (cons (+ (nth 0 x) (nth 1 x)) x))) ; adding new number to list
	(setq prevMaxLen n) ; updating memory
	(setq prevList output)))) ; updating memory

;;; This is the part that manages the User Interface.
;;; You'll probably notice that unlike most modern
;;; programming languages, Lisp is mostly oriented
;;; around recursion, and so even the most trivial
;;; functions like input, output, and a main loop
;;; will be written (mostly) recursively.
;;; In addition, unlike many languages, Lisp doesn't
;;; have a "main" function, instead it is interactive
;;; so we have to define a costume repl to mimic the
;;; usual main functionality people expect. But it
;;; won't activate automatically! After compiling the
;;; code into an active lisp repl, we must invocate
;;; (fib-repl)
(defun fib-input ()
  (let ((inp (read-from-string (read-line))))
    (if (or (and (numberp inp) (> inp 0)) (eq inp 'quit)) ; only valid input arguments are numbers and 'quit'
	inp
	(and (princ "Please enter a valid input (positive number/'quit'):") ; asks for a valid input recursively.
	     (fib-input)))))
(defun fib-output (out)
  (cond ((eq (cdr out) nil) (prin1 (car out)) (fresh-line)) ; if we only have one item left, print it.
	(out (prin1 (car out)) ; if we have more than one output left, print it with ', ' in the end.
	     (format t "~d" ", ")
	     (fib-output (cdr out))))) ; call recursively for the rest of the items in the list.
(defun fib-repl ()
  (princ "Welcome to the Fibonacci calculator!") (fresh-line)
  (princ "Please enter the number you want me to calculate:")
  (let ((inp (fib-input)))
    (unless (eq inp 'quit)
      (fib-output (reverse (smart-fib inp)))
      (fib-repl))))
