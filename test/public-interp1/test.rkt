#lang racket

(require "../../match-hash.rkt")

(render-hash (interpret-command '(swap x y) (hash 'x 3 'y 10)))
(render-hash (interpret-command '(swap y z) (hash 'x 5 'y 93 'z 15)))

(with-output-to-file "output"
  (lambda ()
    (render-hash (interpret-command '(swap x y) (hash 'x 3 'y 10)))
    (render-hash (interpret-command '(swap y z) (hash 'x 5 'y 93 'z 15))))
  #:exists 'replace)
