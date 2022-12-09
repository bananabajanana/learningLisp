;;;; A prime factorization calculator written in Lisp.
;;;; To run, compile the code into a repl and invoke
;;;; (prime-calc-repl)
;;;;
;;;; Lisp is an unconventional programming language
;;;; almost unheard of these days... I heard about it
;;;; not long ago, and decided to learn it because it
;;;; has some really interesting ideas and concepts.
;;;; I strongly recommend you to learn it too! The
;;;; skills one can develop thanks to Lisp are
;;;; unimanigable and unlike any other programming
;;;; language out there. (Also, it's just fun to say
;;;; you know Lisp...)

;;; This is the part that calculates the prime
;;; factors. First I made a helper function, that
;;; checks whether a given positive number is prime.
;;; It does that in a recursive way, by going over
;;; all possible divisors, and checking whether
;;; truely non of them divide the number (which
;;; makes it prime). Then, the main function,
;;; goes over all possible divisors in the same
;;; way, except it makes a list of all divisors
;;; that are also prime.
;;; One cool thing to notice in this code, is that
;;; it uses the symmetry between boolean values,
;;; and empty lists. Instead of is-prime returning
;;; true, it returns a list which contains the
;;; number itself, to make the second function
;;; shorter and more concise.
(defun is-prime (n &optional (x 2))
  (if (or (> x (sqrt n))		; It is enough to check up to the square root. look online why
	  (and (/= (rem n x) 0)
	       (is-prime n (1+ x))))
      n
      nil))
(defun prime-factors (n &optional (x 2))
  (if (= n x) (is-prime n)
      (if (and (= (rem n x) 0) (is-prime x))
	  (cons (is-prime x) (prime-factors n (1+ x)))
	  (prime-factors n (1+ x)))))

;;; This is the part that manages the User Interface.
;;; You'll probably notice that unlike most modern
;;; programming languages, Lisp is mostly oriented
;;; around recursion, and so even the most trivial
;;; functions like input, output, and a 'main' loop
;;; will be written (mostly) recursively.
;;; In addition, unlike many languages, Lisp doesn't
;;; have a 'main' function, instead it is interactive
;;; so we have to define a costume repl to mimic the
;;; usual main functionality people expect. But it
;;; won't activate automatically! After compiling the
;;; code into an active lisp repl, we must invocate
;;; (prime-calc-repl)
(defun input ()
  (let ((inp (read-from-string (read-line))))
    (if (or (and (numberp inp) (> inp 0)) (eq inp 'quit))
	inp
	(and (princ "Please enter a valid input (positive num/'quit'):")
	     (fib-input)))))
(defun output (out)
  (cond ((eq (cdr out) nil) (prin1 (car out)) (fresh-line))
	(out (prin1 (car out))
	     (format t "~d" ", ")
	     (fib-output (cdr out)))))
(defun prime-calc-repl ()
  (princ "Welcome to the prime calculator!") (fresh-line)
  (princ "Please enter the number you want me to find factors of:")
  (let ((inp (input)))
    (unless (eq inp 'quit)
      (output (prime-factors inp))
      (prime-calc-repl))))
