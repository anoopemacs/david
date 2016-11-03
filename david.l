;;chapter1 function data
(abs -1)
(sqrt 10)
(/ 1 2)

;;chapter2 lists
(setf lst '(a n o o p))
(sdraw lst)
(setf lst '((1 2) (3 4)))
(sdraw lst)

(cons 'a nil)
(list 'a nil)
(length nil)

'(a b c . (a b c))

;;chapter3 eval
23
nil
t
(setf lst '(+ 3 8))
(sdraw lst)
(/ 1 2)
(/ 1 2.0)

(defun average (x y)
  (/ (+ x y) 2.0))
(average 3 9)

pi
(list t 'a)

(apply #'+
       (list 3 '4))
(apply #'+
       (list 3 4))

(list 'a 'b c)
(+ 3 '3)
(+ 3 '(3 8))
(defun sq(n)
  (* n n))
(sq 998)
;;learn accessing lisp documentation from emacs
;; C-c C-d d
(defun w/oargs()
  (* 38 99))
(w/oargs)
(listp (quote foo))
(listp (quote (quote foo)))
(listp 'foo)
(listp ''foo)
(first ''foo)
(symbol-name 'equal)
(symbol-function 'equal)
((lambda (x y)
   (* x y)) 8 9)
((lambda(x) (* x x)) 8)
((lambda (x y); notice x y are bracketed
   (+ x y)) 68 1)
'(+ 3 9)
(eval '(+ 3 9))
(apply #'+ '(1 2 3))

;;chapter4 conditionals
;;start Sun Sep 20 21:53:45 IST 2015
(defun my-abs (x)
  (if (> x 0)
      x
      (- 0 x)))
(my-abs -9)

;;cond is pretty useful
(defun compare (x y)
  (cond ((equal x y) '(both are equal))
	((> x y) 'x-greater)
	((< x y) 'x-lesser)))

(defun my-abs(x)
  (cond ((> x 0) x)
	(t (- 0 x))))
(my-abs -9)
;;stop Sun Sep 20 22:11:37 IST 2015
(/ 13.7 2.54)
5.4

(and t t t 8)
(defun iits (x)
  (cond ((equal x 'b) 'bombay)
	((equal x 'h) 'hyderabad)
	((equal x 'd) 'dharwad)
	(t 'none)))
;;how to use step doubt??
(step (if (oddp 5)
	  'yes
	  'no))
;;start Mon Sep 21 03:18:00 IST 2015
;;chapter5 variables & side effects
(random 9.0)
(defun poor-style (n)
  (setf n (+ n 10))
  n)
(poor-style 9)
(defun good-style (n)
  (let ((p (+ n 10)))
    p))
(good-style 9)

;;let* is pretty useful
(defun height-change (old new)
  (let* ((diff (- new old))
	 (ratio (/ diff old))
	 (percent (* ratio 100)))
    percent))
(height-change 4.5 5.4)
(height-change 100 130)

(max 2 39 99)
(min 3 9 1 0 -34)

(defun coin-with-bug ()
  (cond ((< (random 101) 50) 'heads)
	((> (random 101) 50) 'tails)
	((equal (random 101) 50) 'edge)))
(defun coin ()
  (let ((rd (random 101)))
    (cond ((< rd 50) 'head)
	  ((> rd 50) 'tail)
	  ((equal rd 50) 'edge))))
(coin-with-bug)
(coin)
(documentation 'cons 'function)
(documentation 'let* 'function)
;;it is easier to use C-c C-d d instead
(defun avg999 (x y)
  "returns average of 2 nums"
  (/ (+ x y) 2.0))
(avg999 9 3)
;; try C-c C-d d placing cursor on avg
;; search for functions containing thread in thier name
(apropos "thread")
(apropos "avg9")
(documentation 'avg999 'function)
(setf test 69)
(defun test()
  (format t "hello"))
test
(test)
;;end Mon Sep 21 04:32:51 IST 2015
;;chapter6 list
;;start Mon Sep 21 12:22:38 IST 2015
'(w x y z)
;;dot notation
'(w . (x y z))
(cons '(a b c) 'd)
(append '(a b c) 'd)
(append '(a b c) '(d))
(append '(a) '(b) '(c))
;;first input of append has to be list
(setf a (cons '(god i love) 'her))
(setf b (list '(god i love) 'her))
(setf c (append '(god i love) 'her))
(sdraw c)
(listp c)
;(length c)
;;error-why?
(nthcdr 3 '(a n o o p))
(nth 0 '(a n o o p))
(nthcdr 3 '(a b c . d))
(car 'd)
(nth 3 '(a b c . d))
(last '(rosebud))
;;sets
(member 'a '(d a b c))
(intersection '(a b c)
	      '(b c d))
(union '(a b c) '(b c d))
(set-difference '(a b c d) '(a b))
(set-difference '(a c) '(a b))
(subsetp '(a) '(a e i o u))
(defun my-subsetp (x y)
  (not (set-difference x y)))
(my-subsetp '(a) '(a e i o u))
;;tables or assoc lists
(setf words
      '((one ondu)
	(two eradu)
	(three muru)
	(four naku)))
(assoc 'two words)
(setf words
      '((one . ondu)
	(two . eradu)
	(three . muru)
	(four . naku)))
(assoc 'two words)
;;reverse assoc
(rassoc 'muru words)
;;end Mon Sep 21 13:14:03 IST 2015
;;start Mon Sep 21 14:06:58 IST 2015
;;6.9
(setf things '((object1 large green shiny cube)
	       (object2 small red dull metal cube)
	       (object3 red small dull plastic cube)
	       (object4 small dull blue metal cube)
	       (object5 small shiny red four-sided pyramid)
	       (object6 large shiny green sphere)))
(defun descr (x)
  (cdr (assoc x things)))
(descr 'object1)
(defun differences (x y)
  (set-exclusive-or (descr x)
		    (descr y)))
(differences 'object3 'object2)
(setf quality-table '((large . size)
		      (small . size)
		      (red . color)
		      (green . color)
		      (blue . color)
		      (shiny . lustre)
		      (dull . lustre)
		      (metal . material)
		      (plastic . material)
		      (cube . shape)
		      (sphere . shape)
		      (pyramid . shape)
		      (four-sided . shape)))
(defun quality (x)
  (cdr (assoc x quality-table)))
(quality 'red)
(quality 'dull)
(defun quality-diff (x y)
  (quality (car (differences x y))))
(quality-diff 'object2 'object3)
(defun all-qual-diff (x y)
  (remove-duplicates
   (sublis quality-table (differences x y))))
(all-qual-diff 'object3 'object4)
(all-qual-diff 'object1 'object3)
;;scrawl
(setf lst '(a b c . d))
;;end Mon Sep 21 14:35:12 IST 2015
(subst 'optimistic 'ambitious '(I will be ambitious))
;;subst is a tree operation
(subst 'optimistic 'ambitious '((I will be ambitious)))
;;sublis is like multi subst
(sublis '((roses . violets)
	  (red . blue))
	'(roses are red))

(setf dotted-words
      '((one . ondu)
	(two . eradu)
	(three . muru)
	(four . naku)))
(sublis dotted-words '(one two three four))
;;start Mon Sep 21 20:06:11 IST 2015
(setf lst '(a b c . (d)))
(setf lst '(a b c . d))
(sdraw lst)
(last lst)
;;cdring down the list may be expensive
(eql 3 3.0)
;;for nums only =
(= 3 3.0)
(remove 'a '(a n o o p a) :count 1)
(remove 'a '(a n o o p a) :count 1 :from-end t)
;;keywords evaluate to themselves
:count
(member '(a) '((a) (b)))
(member '(a) '((k) (a) (b)) :test #'equal)
;;all built in clisp funs use eql by default,
;;  :test to the rescue
;;end Mon Sep 21 20:26:38 IST 2015

;;start Mon Sep 21 21:27:42 IST 2015
;;chapter7 applicative programming. funs as data
(funcall #'cons 'a 'b)
;;macros or special funs cant be sharp quoted
(defun sq (x)
  (* x x))
(mapcar #'sq '(1 2 3 4 5))
(setf words
      '((one ondu)
	(two eradu)
	(three muru)
	(four naku)))
(mapcar #'car words)
(mapcar #'second words)
(mapcar #'reverse words)
(defun translate (x)
  (second (assoc x words)))
(translate 'one)
(mapcar #'translate '(one two three four))
(mapcar #'(lambda (x) (* x x x))
	'(1 2 3 4 5))
(find-if #'oddp '(1 2 3 4))

(defun my-assoc (which table)
  (find-if #'(lambda (table-element)
	       (equal (car table-element) which))
	   table))
;; which is accesible inside find-if because lexical closures will look up one function level higher if name not locally found
words
(assoc 'one words)
(my-assoc 'one words)
(remove-if #'oddp '(1 2 3 4 5))
(remove-if-not #'evenp '(1 2 3 4 5))
;;end Mon Sep 21 22:09:17 IST 2015
;;start Mon Sep 21 22:37:48 IST 2015
(apply #'+ '(1 1 1))
(reduce #'+ '(1 2 3))
(setf words
      '((one ondu)
	(two eradu)
	(three muru)
	(four naku)))
(reduce #'append words)
(apply #'append words)
(setf lst '((a b c) (c d a) (f b d) (g)))
(apply #'union lst)
;;error
(reduce #'union lst)
(every #'plusp '(1 2 3 4))
(every #'(lambda (x) (> x 0))
       '(1 2 3 4))
;;end Mon Sep 21 22:48:26 IST 2015
;;trace and dtrace
;;start Thu Sep 24 06:26:09 IST 2015
(defun half (n) (* n 0.5))
(defun average (x y)
  (+ (half x) (half y)))
(trace half average)
(average 3 7)
;;list traced
(trace)
(untrace half)
(average 3 7)
;;untrace all
(untrace)
(trace)
;;davids dtrace
(dtrace average half)
(average 3 7)
;; i will use dtrace, duntrace and sdraw regularly
;; to do: dtrace name Arg-1 etc with variable symbol X,Y,Z
(duntrace)
(dtrace)
(defun add2end (base toadd)
  (append base (list toadd)))
(defun repeat1st (phrase)
  (add2end phrase (car phrase)))
(repeat1st '(anoop loves))
(dtrace repeat1st add2end)
(repeat1st '(anoop loves))
(defun find-first-odd (lst)
  (find-if #'oddp lst))
(dtrace find-first-odd)
(dtrace oddp)
(find-first-odd '(2 2 3 8 8 0))
(duntrace)
(dtrace find-first-odd oddp find-if)
(find-first-odd '(2 2 3 8 8 0))
;; david warns not to dtrace built in funs like oddp
;;  as it may result in infinite loops
;; 7.11
;;end Thu Sep 24 07:10:29 IST 2015

;;start Sun Sep 27 18:18:56 IST 2015
(mapcar #'(lambda (x y)
	    (list x 'gets y))
	'(anoop arjun rishav johny naveen)
	'(job1 job2 job3 job4 job5))
(mapcar #'+ '(1 2 3 4) '(99 198 297))

#'cons
#'(lambda (x) (+ x 2))
;; #' on lambda returns lexical closure
(setf g #'(lambda (x) (* x 10)))
(funcall g 8)
(g 8);;error
(setf k #'cons)
(funcall k 'a 'b)
(k 'a 'b);;error

(find-if #'oddp '(1 3 4 8 9))
(find-if #'oddp '(1 3 4 8 9) :from-end t)
(reduce #'cons '(a b c d e))
(reduce #'cons '(a b c d e) :from-end t)

;;faulty assoc, scoping fault
(defun helper (table-element)
  (equal (first table-element) which))
(defun faulty-assoc (which alist)
  (find-if #'helper alist))
;; faulty because helpers parent context is global which contains no 'which variable
;;end Sun Sep 27 19:21:50 IST 2015

;;start Sun Sep 27 20:30:08 IST 2015
;;7.15
;;applicative operator: a fun that takes funs as input
(defun ao (fn)
  "ao - applicative operator example"
  (funcall fn '(god! i love her)))
(ao #'length)
(ao #'reverse)
(ao #'car)
(ao #'cdr)
(ao #'(lambda (x)
	(append '(oh my) x)))
;;7.16: fun that spits out fun
(defun gt-spitout (n)
  "greater than fun spit out"
  #'(lambda (x)
      (> x n)))
(setf gt99 (gt-spitout 99))
(funcall gt99 77797)
(find-if gt99 '(1 3 88 98 444 773))
(format t "~A" gt99)
;;end Sun Sep 27 20:50:53 IST 2015

;;chapter8
;;start Sun Sep 27 23:53:32 IST 2015

;;recursion:
;; analogy:dragon-stories, program-traces, recursion-template
(defun fol (lst)
  "fol- find odd in list"
  (cond ((null lst) nil)
	((oddp (car lst)) lst)
	(t  (fol (cdr lst)))))
(fol '(2 8 4 9 8 3 88 9))
(dtrace fol)
(defun factorial (n)
  (if (or (eql n 0)
	  (eql n 1))
      1
      (* n (factorial (- n 1)))))
(dtrace factorial)
(factorial 5)
(defun count-slices (loaf)
  (if (null loaf)
      0
      (+ 1 (count-slices (cdr loaf)))))
(defun count-slices (loaf)
  (cond ((null loaf) 0)
	(t (+ 1 (count-slices (cdr loaf))))))
(count-slices '(y m a g r))
(dtrace count-slices)
(defun c (n)
  (cond ((equal 1 n) t)
	((evenp n) (c (/ n 2)))
	(t (c (+ (* n 3) 1)))))
(dtrace c)
(c 4)
;;end Mon Sep 28 02:30:04 IST 2015

;;start Mon Sep 28 05:20:01 IST 2015
;;8.12
(defun laugh (n)
  (cond
    ((zerop n) nil)
    (t (cons 'ha (laugh (- n 1))))))
(laugh 3)

(defun my-nth (n lst)
  (cond
    ((eql n 0) (car lst))
    (t (my-nth (- n 1) (cdr lst)))))
(my-nth 3 '(1 2 3 4 5))
(dtrace my-nth)
(defun extract-symbols (lst)
  (cond ((null lst) nil)
	((symbolp (car lst))
	 (cons (car lst) (extract-symbols (cdr lst))))
	(t (extract-symbols (cdr lst)))))
(extract-symbols '(a 3 9 3 iijk kj 3 l))
(dtrace extract-symbols)
(extract-symbols '(3 bears and 1 girl))
(defun fib (n)
  (cond ((eql n 0) 0)
	((eql n 1) 1)
	(t (+ (fib (- n 1)) (fib (- n 2))))))
(fib 3)
(dtrace fib)
;;8.13
(setf lst '(((goldilocks . and)) (the . 3) bears))
(sdraw lst)
(defun findnum (lst)
  (cond ((numberp lst) lst)
	((atom lst) nil)
	(t (or (findnum (car lst))
	       (findnum (cdr lst))))))
(dtrace findnum)
(findnum lst)
(defun stq (tree)
  "stq= symbol to 'q"
  (cond ((null tree) nil)
	((atom tree) 'q)
	(t (cons (stq (car tree))
		 (stq (cdr tree))))))
(dtrace stq)
(sdraw lst)
(stq lst)
(defun count-to-n (n)
  (count-recursively 1 n))
(defun count-recursively (s e)
  (cond ((> s e) nil)
	(t (cons s (count-recursively (+ s 1) e)))))
(count-to-n 4)

;;debugger - have skipped on page 272
;; i need to watch youtube video on this especially for sbcl
;;  and slime environment
;; I guess i need to glance sbcl, slime docs once
(defun fact (n)
  (cond ((zerop n) (break "N is zero."))
	(t (* n (fact (- n 1))))))
(fact 5)
;;debugger can display a backtrace of the control stack, which
;; shows all the recursive calls that are currently stacked up
;;control stack = lisp's way of keeping track of collection of nested function calls
;;stack frame = an entry on the control stack that describes one of these function calls

;;8.16
(defun count-slices (loaf)
  (cond ((null loaf) 0)
	(t (+ 1 (count-slices (cdr loaf))))))
(dtrace count-slices)
(count-slices '(x x x x))
;; tail recursive form is better
;;  because: lisp better optimizes it with some jump trick
(defun count-slices (loaf)
  (helper loaf 0))
(defun helper (loaf n)
  (cond ((null loaf) n)
	(t (helper (cdr loaf) (+ n 1)))))
(dtrace helper)
(count-slices '(x x x x))
;; non tail recursive:
(defun my-reverse (lst)
  (cond ((null lst) nil)
	(t (append (my-reverse (cdr lst))
		 (list(car lst))))))
(my-reverse '(a n o o p))
(dtrace my-reverse)
;;tail recursive form
(defun my-reverse (lst)
  (helper lst nil))
(defun helper (lst rlst)
  "rlst = rev lst instantaneous"
  (cond ((null lst) rlst)
	(t (helper (cdr lst)
		   (cons (car lst) rlst)))))
(dtrace my-reverse helper)
(my-reverse '(a n o p))
;; not all recursive functions have tail recursive form
;; eg : multiple recursive funs - difficult to model tail
;;      tail recursively

;;8.17
(defun my-mapcar (fn lst)
  "for one list only"
  (cond ((null lst) nil)
	(t (cons (funcall fn (car lst))
		 (my-mapcar fn (cdr lst))))))
(my-mapcar #'(lambda (x)
	       (* 2 x))
	   '(2 3 8 9))
;;labels
;; a local fun, syntax analogical to let - local variable
(defun count2n (n)
  (labels ((helper (s e)
	     (cond ((> s e) nil)
		   (t (cons s (helper (+ s 1) e))))))
    (helper 1 n)))
(count2n 3)
;; disadvantage of labels is funs inside them cannot be traced
;;  but we can still step through them. step? yet to learn that
;;8.19
;;very small intro to tree

;;chapter9 input output
"i will do this!"
"strings eval to themselves"
"strings are subtype of vectors"
(format t "t - means write to display")
(format t "~& prints new line if cursor not at new line already")
;;good tip: format begin with "~&..."
(defun books()
  (format t "~&davids")
  (format t "~&pg-ansi~&pg-onlisp")
  (format t "~&land of lisp")
  (format t "~&other subject specific books"))
(books)
;;symbol print
(format t "~&~S" 'jessica)
(format t "~&~A" 'paul)
;;format returns nil
(defun stalk (n)
  "print square of n"
  (format t "~&~S squared is ~S" n (* n n)))
(stalk 8)
(mapcar #'stalk '(1 2 3 4 5))
;; ~S - with escape chars = with ""
;; ~A - without esc chars = without ""
(defun compare(x)
  (format t "~& with esc chars: ~S" x)
  (format t "~& without esc chars: ~A" x))
(compare "hello ladies")
;;read
(defun my-square ()
  (format t "~&please enter your num:")
  (let ((n (read)))
    (format t "~&~S squared is ~S" n (* n n))))
(my-square)
(defun zen()
  (if (y-or-n-p "Do you seek zen enlightenment: y or n")
      (format t "~&then dont ask for it!")
      (format t "~&you have found it!")))
(zen)
;;9.6
*terminal-io*
;;reading files
(defun get-tree-data ()
  (with-open-file (stream1 "~/david/timber.dat")
    ;;unlike "let", "with open file" involves single bracketing
    (let* ((tree-location (read stream1))
	   (tree-assoc (read stream1))
	   (num-trees (read stream1)))
      (format t "~&The location is ~A" tree-location)
      (format t "~&The total num of trees is ~A" num-trees)
      (format t "~&The assoc list is ~A" tree-assoc))))
(get-tree-data)
;;writing files
(defun save-her (eyes hair laugh)
  (with-open-file (stream2 "~/david/her.dat"
			   :direction :output)
    (format stream2 "~&~S" eyes)
    (format stream2 "~&~S" hair)
    (format stream2 "~&~S" laugh)))
(save-her "her eyes look like they are a window to her soul"
	  "her hair is clean but not obsessively maintained"
	  "she has a natural laughter that makes me weak in the stomach")
;;better to retain "" when writing to file, because it makes it easier to reread that data

;;lisp toolkit: dribble
;;asked doubt on c.l.l ?
;;they said that:
You are expecting slime-repl to behave like your implementation REPL.
When using slime, you have save the dribble post-hoc, with C-x C-s in
the slime-repl buffer.

Notice also that slime/swank works with multiple threads; when you
evaluate things in lisp buffers, they're evaluated by swank in different
worker threads each time.

I guess it would be possible to add a dribble feature to swank, but if
you do it only for the current thread, then it won't work for the worker
threads for lisp buffer evaluations, and if we handled also those lisp
buffer evaluations, then we'd have to dribble commands (and outputs)
coming from multiple threads at the same time.

There are a few places where EVAL is used in swank.lisp, notably
interactive-eval and eval-and-grab-output.  You could implement a
swank:dribble function to activate saving their string argument to a
file. 
;;
;; try lisp toolkits directly in sbcl repl inside a terminal
;; let me avoid slime while I am learning
(dribble "~/david/session1.log")
(cons t 8)
(reverse '(a n o o p))
(format t "hello dribble")
(dribble)

(setf hackers '((rishav roy)
		(anoop gr)
		(arjun deshmukh)
		(johny jose)
		(anindhya banerjee)))
(defun print-one-name (lst)
  (format t "~&~10S ~S" (car lst) (second lst)))
;;10S means use 10 character width for first print
(print-one-name '(rishav roy))
(defun print-hackers (assoc)
  (mapcar #'print-one-name assoc))
(print-hackers hackers)

(format t "~8,4F" (/ 22 7))

;;end of file
(defun test()
  (with-open-file (stream3 "~/david/test.dat" :direction :input)
    ;; here i am explicit about direction
    (let ((var1 (read stream3)))
      (format t "~&error must occur")
      var1)))
(test)

;;?doubt did not understand section 9.11
(defun read-all-objects (stream eof-indicator)
  (let ((instantaneous (read stream nil eof-indicator)))
    (cond ((eq instantaneous eof-indicator) nil)
	  (t (cons instantaneous (read-all-objects stream (list '$eof$)))))))
(defun read-my-file ()
  (with-open-file (stream4 "~/david/sample.dat")
    (let ((contents
	   (read-all-objects stream4 (list '$eof$))))
      (format t "~&Read ~S objects from the file."
	      (length contents))
      contents)))

(read-my-file)
(defun test()
  (with-open-file (stream3 "~/david/eof.dat" :direction :input)
    (read-all-objects stream3 (list 'meh))))
(test)
(list '$eof$)
'($eof$)

;;chapter10 assignment
;; let and applicative operators are superior to assignment
;; ? in what cases do applicative operators replace assignment
(setf *total-glasses* 0)
(defun sell (n)
  (setf *total-glasses* (+ *total-glasses* n))
  (format t "~&~A glasses so far" *total-glasses*))
(sell 8)
;; incf, decf - analogical name like setf
(setf *a* 8)
(incf *a* 2)
(decf *a*)

(setf *stack* nil)
(push 'anoop *stack*)
(push 'gr *stack*)
(pop *stack*)
;;push and pop - misnomers, better name: pushf popf
;;avoid side effects: dont modify local variables

;;when & unless - I will use cond instead, so forget when unless
;;when is like multi line bodied if
(when (> 8 1)
  (format t "~&when prints if condition is true"))
;;unless is like multi-line if-not
(unless (< 8 1)
  (format t "~&unless prints if condition is false"))
;;first input to setf can be an eval expression
;;10.6
;; think of data structures before writing large programs
;; tic tac toe
(defun make-board()
  (list 'board 0 0 0 0 0 0 0 0 0))
(make-board)
;; 0- , 1-o, 10-x
(defun convert-to-letter(v)
  (cond ((equal v 1) "O")
	((equal v 10) "X")
	(t " ")))
(defun print-row (x y z)
  (format t "~& ~A | ~A | ~A"
	  (convert-to-letter x)
	  (convert-to-letter y)
	  (convert-to-letter z)))
(defun print-board (board)
  (format t "~%************************")
  (print-row (nth 1 board) (nth 2 board) (nth 3 board))
  (format t "~&___________")
  (print-row (nth 4 board) (nth 5 board) (nth 6 board))
  (format t "~&___________")
  (print-row (nth 7 board) (nth 8 board) (nth 9 board)))
(setf btest (make-board))
(setf *board* (make-board))
(print-board *board*)
(print-board btest)
(defun make-move (player pos board)
  (setf (nth pos board) player)
  board)
(setf *computer* 1)
(setf *anoop* 10)
(setf *undo* nil)
(make-move *computer* 3 *board*)
(print-board *board*)
(make-move *anoop* 5 *board*)
(make-move *undo* 5 *board*)
(setf *triplets*
      '((1 2 3) (4 5 6) (7 8 9) ;rows
	(1 4 7) (2 5 8) (3 6 9) ;columns
	(1 5 9) (3 5 7) ))
;;diagonals

;;sums for a given triplet picked from above assoc-list of tripletS
(defun sum-triplet (board triplet)
  (+ (nth (first triplet) board)
     (nth (second triplet) board)
     (nth (third triplet) board)))
(sum-triplet *board* '(3 5 7))
(sum-triplet *board* '(7 8 9))
(defun compute-sums (board)
  (mapcar #'(lambda (triplet)
	      (sum-triplet board triplet))
	  *triplets*))
(compute-sums *board*)
;;notice below that we use (* 3 *anoop*) instead of 30
;; because it is always better to be explicitly clear in code
(defun winner-p (board)
  (let ((sums (compute-sums board)))
    (cond ((member (* 3 *anoop*) sums) 'anoop)
	  ((member (* 3 *computer*) sums) 'computer)
	  (t nil))))
(winner-p *board*)
(setf btest '(board 10 10 10 1 1 1 1 1 1))
(winner-p btest)
(defun play-one-game ()
  (if (y-or-n-p "Would you like to go first? ")
      (anoop-move (make-board))
      (computer-move (make-board))))
(play-one-game)
(defun read-a-legal-move (board)
  (format t "~&Your move: ")
  (let ((pos (read)))
    (cond ((not (and (integerp pos)
		     (<= 1 pos 9)))
	   (format t "~&invalid input.")
	   (read-a-legal-move board))
	  ((not (zerop (nth pos board)))
	   (format t "~&already occupied slot")
	   (read-a-legal-move board))
	  (t pos))))
(read-a-legal-move *board*)
(defun board-full-p (board)
  (not (member 0 board)))
(defun anoop-move (board)
  (let* ((pos (read-a-legal-move board))
	 (new-board (make-move
		     *anoop*
		     pos
		     board)))
    (print-board new-board)
    (cond ((winner-p board)
	   (format t "~&anoop you won"))
	  ((board-full-p board)
	   (format t "~&board full; its a tie"))
	  (t (computer-move new-board)))))
(defun computer-move (board)
  (let* ((best-move (choose-best-move board))
	 (pos (first best-move))
	 (strategy (second best-move))
	 (new-board (make-move
		     *computer* pos board)))
    (format t "~&computers move: ~S" pos)
    (format t "~&computer is using strategy: ~S" strategy)
    (print-board new-board)
    (cond ((winner-p board)
	   (format t "~&computer you won"))
	  ((board-full-p board)
	   (format t "~&board full; its a tie"))
	  (t (anoop-move new-board)))))
(defun choose-best-move (board)
  (or (make-three-in-a-row board)
      (block-opponent-win board)
      (random-move-strategy board)))
(defun random-move-strategy (board)
  (list (pick-random-empty-pos board)
	"random list"))
(defun pick-random-empty-pos (board)
  (let ((pos (+ 1 (random 9))))
    (if (zerop (nth pos board))
	pos
	(pick-random-empty-pos board))))
(pick-random-empty-pos *board*)
(play-one-game)
;; intelligence for 2 in a row win or dont let anoop win
(defun make-three-in-a-row (board)
  (let ((pos (win-or-block board (* 2 *computer*))))
    (and pos (list pos "make three in arow"))))
(defun block-opponent-win (board)
  (let ((pos (win-or-block board (* 2 *computer*))))
    (and pos (list pos "block opponent"))))
(defun win-or-block (board target-sum)
  (let ((triplet (find-if
		  #'(lambda (trip)
		      (equal (sum-triplet board
					  trip)
			     target-sum))
		  *triplets*)))
    ;;above lexical closure gives first triplet on verge of completion called with target-sum = (* 2 player)
    ;;for that triplet lets find the desperate blank space:
    (when triplet
      (find-empty-position board triplet))))
;; lets call a triplet as a square, infact a rectangle
(defun find-empty-position (board squares)
  (find-if #'(lambda (pos)
	       (zerop (nth pos board)))
	   squares))
(play-one-game)
;; some doubts in the above game, will revisit someday?
;;? skip for now page 325, break and error
;;setf circular list
(setf circ (list 'foo))
(sdraw circ)
(setf (cdr circ) circ)
;;using setf on lists is known as list surgery
;; but above is destructive and advanced lispers use it though
;;destructive list operations are named as N*
(setf x '(a b))
(setf y '(c d))
(sdraw x)
(sdraw y)
(append x y)
;; nconc = destructive append
;; below destroys x, and sets nconc value to x
;;  unless if x is nil, so always use setf with nconc
(nconc x y) ;;bad style
(setf x (nconc x y))
(defun my-nconc (x y)
  (cond ((null x) y)
	(t (setf (cdr (last x)) y)
	   x)))
(my-nconc nil x)
;; nsubst = destructive subst
(setf x '(a n (o o) p))
(subst 0 'o x)
(nsubst 9 'o x)
(nsubst 'OO '(9 9) x :test #'equal)
;; nreverse nunion nintersection nset-difference
;; remove-nondestructive, delete-destructive
;;n=non-consing, non-copying; hence destructive

;;nconc eg:
(setf assocl '((a apple)
	      (b bat)
	      (c cat)
	       (d dog)))
(assoc 'a assocl)
(defun add-to-assoc (assocl alphabet new-addition)
  (nconc (assoc alphabet assocl) new-addition))
(add-to-assoc assocl 'a '(aeroplane))

;;chapter11 iteration & block-structure
;;note: macros dont evaluate their args
;;dolist and dotimes are macros
(dotimes (i 3 'result-output)
  (format t "~&become a god"))
(dolist (x '(a n o o p) 'result-output)
  (format t "~&~A -letter split" x))
;; return - premature iteration ender
(defun find-first-odd (lst)
  (dolist (x lst "normal exit no odd found")
    (cond ((oddp x) (return x)))))
(find-first-odd '(2 4 8 8))

(defun it-fact (n)
  "iterative factorial"
  (let ((prod 1))
    (dotimes (x n 'done)
      (setf prod (* prod (+ x 1))))
    prod))
(it-fact 5)

(defun it-intersection (a b)
  "iterative set intersectin"
  (let ((result nil))
      (dolist (x a result)
	(cond ((member x b) (push x result))))))
(it-intersection '(a b c) '(b c d))

(defun it-square-list (lst)
  (let ((result nil))
    (dolist (holder lst (reverse result))
      ;;(format t "~& holder=~A result=~A" holder result)
      (setf result (cons (* holder holder) result)))))
(it-square-list '(1 2 3))

;;do- varlist, endlist, body
(do ((i 1 (+ i 1)) (j 1 (+ i 1)))
    ((equal i 10) 'i-is-10)
  (format t "~&~A" (* i j)))

(defun launch (n)
  (do ((i n (- i 1)))
      ((= i 0) (format t ".blast-off!"))
    (format t "~A..." i)))
(launch 10)
;;notice that do has implicit var assignment, hence 
;; unlike dotimes we need not use let(()) awkwardly
(defun fact (n)
  (do ((i n (- i 1))
       (result 1 (* result i)))
      ;;result update done in varlist
      ((zerop i) result)))
(fact 5)
;;above is elegant almost always, except
;; if update needs a conditional test 

;;do*
(defun ffo (lst)
  "find first odd"
  (do* ((x lst (cdr x))
	(fist (car x) (car x)))
       ((null x) nil)
    (if (oddp fist) (return fist))
    ;;(format t "~&x=~A,  fist=~A" x fist)
    ))
(ffo '(2 2 3 8))

;;endlist = (nil) means infinite loop
(defun read-a-number ()
  (do ((input nil))
      (nil)
    (format t "~&enter a number:")
    (setf input (read))
    (cond ((numberp input)
	   (return input))
	  (t (format t "~&not a number")))))
(read-a-number)
;;(return x) = (return-from nil x)

;; I have skipped keyboard exercises and exercises of all chapters

(defun add2n (n)
  "lisp TIME toolkit test"
  (do ((i n (- i 1))
       (result 0 (+ result i)))
      ((zerop i) result)))
(time (add2n 10000000))

(defun optional-eg (a &optional b)
  (format t "~&a is ~A" a)
  (format t "~&b is ~A" b))
(optional-eg 'anoop)

(defun optional-eg (a &optional (b 'batman))
  (format t "~&a is ~A" a)
  (format t "~&b is ~A" b))
(optional-eg 'anoop)

(defun average (&rest args1)
  (/ (reduce #'+ args1)
     (length args1)
     1.0))
(average 8 9)

(defun square-all (&rest args)
  (cond ((null args) nil)
	(t (cons (* (car args) (car args))
		 (apply #'square-all (cdr args))))))
(square-all 1 2 3 4)

;;chapter12 structures and type system
;;type system = set of built-in datatypes
;; Lisp type system are visible and extensible
;;for OOP check CLOS book by that lady
(typep 3 'integer)
(type-of "Anoop")
(defstruct iitian
  (name nil)
  (gender 'male)
  (roll nil)
  (dept nil))
(typep 9 'iitian)
(setf anoop (make-iitian))
(format t "~A" anoop)
;;structures are not lists
(defstruct starship
  (name nil)
  (speed 0)
  (condition 'green)
  (shields 'down))
;; fun make-starship and predicate starship-p are autocreated
(setf s1 (make-starship))
;; quote-sharp
(setf s2 '#s(starship speed (warp 3)
		      condition red
		      shields up))
(starship-p s2)
(starship-speed s2)
(setf (starship-speed s2) '300-times-sound)
(setf (starship-name s1) "Enterprise")
(incf (starship-speed s1))
s1
(defun alert (x)
  (setf (starship-shields x) 'up)
  (cond ((equal (starship-condition x)
		'green)
	 (setf (starship-condition x) 'yellow)))
  'shields-raised)
(alert s1)
s1
;;neat trick ; data type - starship, use variable naming as
;; strshp
(setf s3 (make-starship :name "reliant"
			:shields 'damaged))
;;describe- instead I will use C-c C-d d
(describe s1)
(describe 7)
(describe 'fred)
(describe t)
(describe 'defun)
(describe 'cons)

(defun half (n)
  (/ n 2))
(setf half 69)
(inspect 'half)

;;chapter13 array, hash table & (redundant) property lists 
;; arrays are not frequently used in lisp
;;  because lists are better in most cases
;; vectors - one dim array
(setf my-vec '#(tuning violin 440 a))
(setf *print-array* nil)
my-vec
(setf *print-array* t)
my-vec
;;analogy aref ~ nth aref=array element refer
;; but diff syntax nth
(aref my-vec 1)
;; length, reverse ,find-if work both on lists and arrays
(make-array 5 :initial-element nil)
(make-array 5 :initial-contents '(a e i o u))
;; arrays are subset of vectors
;; strings are subset of vectors
(length "anoop is a lisper")
(length "anoop")
(reverse "anoop")
(aref "anoop" 1)

;; hash table ~ assoc list
;; hash table may replace assoc list in final prototype for
;;  speed, but assoc is much more intuitive

;;chapter14 macros and compilation
;;ppmx=pretty print macro expansion
;; macros are like shorthand
(setf *a* 8)
(incf *a*)
*a*
(ppmx (incf *a*))
;;defmacro syntax similar to defun
(defmacro simple-incf (var)
  (list 'setq var (list '+ var 1)))
(eval (list 'setf 'a 8))
(simple-incf a)
(dtrace simple-incf)
(ppmx (simple-incf a))
;;ppmx only expands macro, doesnt eval it
(defmacro simple-incf (var &optional (amount 1))
  (list 'setq var (list '+ var amount)))
(simple-incf a 2)
(setf b 8)
(ppmx (simple-incf a (* 3 b)))
(defun faulty-incf (var)
  (setq var (+ var 1)))
(faulty-incf a)
;;backquote
(setf name 'anoop)
`(my name is ,name)
`(,name has finally understood life at age of ,(+ 1 20))
(defmacro simple-incf (var &optional (amount 1))
  `(setq ,var (+ ,var ,amount)))
(simple-incf a)
(ppmx (simple-incf a))
;;templating backquote `
;; lets get rid of writing list ... in defmacros
`(setf foo 'bar)
(defmacro two-from-one (func object)
  `(,func ',object ',object))
(two-from-one cons anoop)
;;notice #' is not needed as defmacro doesnt eval its args
(defun f (x y)
  (showvar x)
  (showvar y)
  (* x y))
(defmacro showvar (var)
  `(format t "~&The value of ~A is ~A" ',var ,var))
(showvar a)
(setf x 8)
(format t "~&The value of ~A is ~A" 'x x)
(f 8 9)
(setf name 'anoop
      room '(jcb hall a235))
`(,name lives in ,room)
`(,name lives in ,@room)
(defmacro zeroed (&rest arguments)
  `(progn ,@(mapcar #'(lambda (var)
			(list `setf var 0))
		    `,arguments)
	  (format t "args is ~A" ',arguments)
	  `(zeroed ,@arguments)))
;;? How to debug above zeroed erroneous output
(setf a 8 b 6 c 9)
(zeroed a b c)
(ppmx (zeroed a b c))
;;compiled code runs faster and takes lesser memory
(defmacro bad-announce ()
  (format t "~&Hi mom!"))
(defun say-hi ()
  (bad-announce))
(compile 'say-hi)
(say-hi)
(dtrace say-hi)
(ppmx (bad-announce))
(defmacro good-announce ()
  `(format t "~&Hi mom!"))
(defun say-hi ()
  (good-announce))
(say-hi)
(ppmx (good-announce))
;;so in  good coding style macros themselves should not
;; execute something that causes side effects

;; finite state machine, skip for now, but should come back
;;  and read during second read
;;I skipped advanced section in this chapter
;; end of textbook
