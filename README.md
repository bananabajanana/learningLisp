Learning Lisp
==========

I have been wanting to learn to program in Lisp for a year or so, and in here I will upload all of the code snippets and project I write on my journey.

Feel free to fork this repo as you wish, and add projects or comments of your own. Every contribution is welcome!

Motivation
-----------

In one word, I'd personally define Lisp as "Unique", but sadly, one word is not enough to actually convey how special it is.
Lisp is unlike any programming language out there. With it's theoretical 'pure' roots, it is to this day one of the most uniform languages out there, in the sense that there is only one syntax - every function is written in parentheses, with the first word being the function name, and the rest being arguments. Thats it. Don't believe me? Here are a couple of examples:

* Hello World - `(princ "Hello World")`
* Sum of numbers - `(+ 5 2 10 3 9)`
* Define a Hello-World function that returns the sum of the numbers - ```(defun Hello-World () (princ "Hello World") (+ 5 2 10 3 9))```

If this concept interests you, I highly recommend giving this language a go, even though it is mostly unheard-of, and some may claim it is _ancient_ or _outdated_...
Also, since almost no one knows how to program in this alien language, it gives even the most imbecile programmer who just gave it a go once great bragging rights, which is always good.

_"Lisp [..] the most intelligent way to misuse a computer."_ ~ Edsger Dijkstra  
_"An interesting language where you can write interesting programs that do interesting things."_ ~ Uncredited

Programs List
=============

Numbers
-------

In this folder, you will find all programs that have something to do with numbers. Mostly calculations, approximations, and algorithmic solutions to mathematical riddles...

[**Fibonacci Sequence**](https://github.com/bananabajanana/learningLisp/blob/main/Numbers/fibonacci-sequence.lisp) - Enter a number and have the program generate the Fibonacci sequece to that number.

[**Prime Factorization**](https://github.com/bananabajanana/learningLisp/blob/main/Numbers/prime-factors.lisp) - Have the user enter a number and find all Prime Factors (if there are any) and display them.

Games
-------

In this folder, you will find all games (big or small) that i program with lisp. From naive and simple, to hopefully graphical marvels, if you're looking for lispy games, I'll have them here.

[**Higher Lower**](https://github.com/bananabajanana/learningLisp/blob/main/Games/HigherLower.lisp) - The player chooses a number, and the computer tries to guess it. This computer is optimized with the perfect strategy! (not really that impressive, it's just binary search...)
