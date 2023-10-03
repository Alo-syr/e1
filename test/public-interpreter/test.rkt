#lang racket

(require "../../match-hash.rkt")

(render-hash (interpret-commands '((assign x 0) (assign y 1) (swap x y))))

(with-output-to-file "output"
  (lambda ()
    (render-hash (interpret-commands '((assign x 0) (assign y 1) (swap x y)))))
  #:exists 'replace)
