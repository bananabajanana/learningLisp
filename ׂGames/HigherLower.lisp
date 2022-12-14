;;;; A basic implementation of the 'Higher-Lower' game, in
;;;; which the player chooses a number and the computer
;;;; tries to guess it. The computer's strategy is a simple
;;;; implementation of binary search across a certain range
;;;;
;;;; To start the game run (game)

;;; Returns the average of the current range.
(defun guess ()
  (floor (+ myMin myMax) 2))

;;; Initiates the range to 0-101 (not including)
(defun start-game ()
  (setq myMin 0)
  (setq myMax 101)
  (guess))

;;; Tells the computer that the number is higher
;;; than the current guess
(defun higher ()
  (setq myMin (guess))
  (guess))

;;; Tells the computer that the number is lower
;;; than the current guess
(defun lower ()
  (setq myMax (guess))
  (guess))

;;; A simple game repl loop.
;;; !THIS IS NOT IDEAL!
;;; From what I've seen, the 'Lispy' way of
;;; making a game repl in this kind of situation
;;; is flavoring the input to make it into commands
;;; that the computer can run directly (instead
;;; of checking the string with each option and
;;; manually running the relevant command).
;;; Hopefully I will come back to fix this eventually.
(defun game-repl ()
  (let ((input (read-line)))
    (cond ((string-equal input "higher") (princ (higher)) (fresh-line))
	  ((string-equal input "lower") (princ (lower)) (fresh-line))
	  ((string-equal input "restart") (princ (start-game)) (fresh-line)))
    (cond ((not (string-equal input "quit")) (game-repl)))))

;;; starts the game repl and explains the rules.
(defun game ()
  (princ "Welcome to the higher lower game! Choose a number between 1 and 100, and I'll try to guess it. (after each guess give me a hint 'higher/lower' or restart the guessing game with 're-start'") (fresh-line)
  (princ (start-game)) (fresh-line)
  (game-repl))
