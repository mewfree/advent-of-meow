#lang racket
(define file (open-input-file "day-01.input"))
(define input (string->list (port->string file)))
(define count 0)

(define to-sum (map (lambda (s)
       (if
         (eq? s #\()
         (+ 1)
         (- 1)))
     input))

(apply + to-sum)

(close-input-port file)
