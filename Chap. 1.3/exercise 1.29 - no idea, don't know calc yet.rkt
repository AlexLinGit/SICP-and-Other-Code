#lang sicp

 (define (round-to-next-even x) 
   (+ x (remainder x 2))) 
 (define (simpson f a b n) 
   (define fixed-n (round-to-next-even n)) 
   (define h (/ (- b a) fixed-n)) 
   (define (simpson-term k) 
     (define y (f (+ a (* k h)))) 
     (if (or (= k 0) (= k fixed-n)) 
         (* 1 y) 
         (if (even? k) 
             (* 2 y) 
             (* 4 y)))) 
   (* (/ h 3) (sum simpson-term 0 inc fixed-n))) 

(define (sum term a next b)
  (if (> a b)
      0
      (sum term (next a) next b)))