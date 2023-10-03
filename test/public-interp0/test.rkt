#lang racket

(require "../../match-hash.rkt")



(render-hash (interpret-command '(assign x 5) (hash 'x 3)))
(render-hash (interpret-command '(assign y 10) (hash 'y 15)))

(with-output-to-file "output"
  (lambda ()
    (render-hash (interpret-command '(assign x 5) (hash 'x 3)))
    (render-hash (interpret-command '(assign y 10) (hash 'y 15))))
  #:exists 'replace)
