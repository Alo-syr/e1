;; Exercise 1
;; CIS 352 -- Fall 2023
#lang racket

(provide (all-defined-out))

;;
;; Practice with hashes, sets, and basics of interpreters.
;;

;; !Do not change!
;;
;; print out a hash in a canonical order--assume keys are symbols
;; used by the test scripts to ensure hashes are written consistently
(define (render-hash h)
  ;; notice that this code uses `for`. Generally, the usage of `for`
  ;; in this class is strongly discouraged. This is because `for` is
  ;; often useless without `set!` and similar mutable features, which
  ;; are explicitly disallowed. However, in this instance all we care
  ;; about is displaying the hash via writing to the console. Because
  ;; of this, we do care about the effect, but don't need to keep
  ;; track of a variable--so this is kind of a special case where
  ;; using `for` is probably the more obvious thing.
  (for ([key (sort (hash-keys h) symbol<?)])
    (displayln (format "~a,~a" key (hash-ref h key)))))

;; TODO TODO TODO 
;;
;; (zeroes 'x 'y ...) => (hash 'x 0 'y 0 ...)
;; 
;; Produces a map from each element in lst to the number zero. Note
;; that hashes are *unordered*. Specifically: (equal? (hash 'x 0 'y 0)
;; (hash 'y 0 'x 0)) is #t.
(define (zeroes lst)
  (match lst
    ['() 'todo]
    [`(,hd . ,tl) 'todo]))

;; TODO TODO TODO
;; 
;; (add-to-each hsh n) => (hash ...)
;; 
;; add n to each value of the hash, for each of its keys. Hint: write
;; a recursive function (or foldl, if you know / would like to use it)
;; to walk over each of the keys in `hash-keys`.
(define (add-to-each h n)
  ;; My advice to you is to consider using a recursive helper
  ;; function, which walks over each of the keys in the hash. If you
  ;; imagine the keys of the hash as a list, you should iterate (i.e.,
  ;; recur) over each element of the list, `hash-set`ing its value to
  ;; be n + the value in the input hash `h` (hint: you should get this
  ;; value using `hash-ref`).
  (define (helper lst)
    'todo)
  ;; Now call the helper function on the list of keys
  (helper (hash-keys h)))

;; We now define a minimal language, essentially a tiny subset of
;; assembly with three commands which act on global registers
;; (represented as symbols). The three commands in the language are
;; `swap`, which swaps registers, `assign`, which assigns a constant
;; to a register, and `add`, which adds two registers y+z and stores
;; the result in (possibly) a third register x.
;; 
;; This language is sub-Turing, it can only express a small set of
;; straight-line addition expressions. But it is reasonable enough for
;; us to see the vision of why maps and matching are useful
;; longer-term in building interpreters.
;; 
;; We will build an interpreter in this language to help us understand
;; the core mechanics of using matching and recursive functions to
;; build interpreters and similar tools which manipulate and
;; understand programs.

;; The following are acceptable commands
(define (command? c)
  (match c
    ;; swap x and y's value
    [`(swap ,(? symbol? x) ,(? symbol? y)) #t]
    ;; assign x to the value of y
    [`(assign ,(? symbol? x) ,(? number? y)) #t]
    ;; assign x to the value of y+z
    [`(add ,(? symbol? x) ,(? symbol? y) ,(? symbol? z)) #t]
    ;; nothing else
    [_ #f]))

;; TODO TODO TODO
;; 
;; (interpret-command e h) => (hash ...)
;; 
;; "interpret" a single command: return the resulting hash. The input
;; hash `h` is a mapping from registers to their values
;; (numbers). Swap should swap the values in x and y. Assign should
;; assign to the value x. Add should assign to the value x with the
;; value of y plus the value of z.
(define (interpret-command e h)
  (match e
    [`(swap ,x ,y) 'todo]
    [`(assign ,x ,y) 'todo]
    [`(add ,x ,y ,z) 'todo]
    [_ (error (format "invalid command ~a" (pretty-format e)))]))

;; (interpret-commands es)
;; 
;; Interpret each command one at a time, starting from the empty
;; register state.
;; 
;; We provide this one for you. Notice that the program's "state" is
;; represented by a hash. The only variables in our language are
;; global registers, and there are no functions (whose dynamic
;; invocations necessitate new, delimited scopes).
;; 
;; To interpret our language, we just want to interpret it line by
;; line. There is no conditional control, and the instruction advances
;; immediately to the next. We represent instruction sequences by
;; lists, and thus to execute each instruction, we write a helper
;; function which consumes (a) the current register state and (b) the
;; remaining list of instructions. When there are no remaining
;; instructions (the base case), we simply return the hash. When there
;; are more instructions, we run the `interpret-command`
;; function--this interprets one instruction and gives us an updated
;; state. We then use that updated state to execute the rest of the
;; instructions.
(define (interpret-commands es)
  (define (h hsh lst)
    (match lst
      ['() 'todo]
      [`(,hd . ,tl) 'todo]))
  ;; notice that the initial call to `h`, `hsh` is (hash). This
  ;; represents the "empty register map."
  (h (hash) es))

