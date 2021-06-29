#lang racket
(require math/number-theory)

(define (najveci x y)
  (if(= x 0) y
  (najveci (round(/ x 10)) (max(remainder x 10) y))))


(define (zbir x)
  (if(< x 1) 0
     (+ (remainder x 10) (zbir (round(/ x 10)))))); 


(define (fija x)
  (cond [(= x 0) 0]
        [(> x 0) (najveci x 0)]
        [(< x 0) (zbir (abs x))]))


(define (faktr x)
  (if(= x 0) 1
     (* x (faktr(- x 1)))))

(define (sumf x)
  (if(= x 0) 0
     (+ (faktr x) (sumf(- x 1)))))



(println(string #\a #\ #\b))


(define (binomni n k)
  (/ (faktr n) (*(faktr k) (faktr (- n k)))));



(define (prolaz x y)
  (cond [(null? x) y]
        [(= (car x) 10) (prolaz (cdr x) (+ y 1))]
        [#t (prolaz (cdr x) y)]))



(define (najmanji x y)
  (if(= x 0) (if(odd? y) (error 'failed) y)
  (if(even? (remainder x 10)) (najmanji (round(/ x 10)) (min(remainder x 10) y))
     (najmanji(floor(/ x 10)) y))))

(define (prvi x)
  (println(najmanji x 11)))

(define (suma x y s)
  (cond [(>= y x) s]
        [(= (remainder y 3) 0) (suma x (+ y 1) (+ y s))]
        [(= (remainder y 5) 0) (suma x (+ y 1) (+ y s))]
        [#t (suma x (+ y 1) s)]))


(define (peti x xs)
  (if(= x 1) (append xs (list 1))
     (if(even? x) (peti (/ x 2) (append xs (list x)))
        (peti (+ (* 3 x) 1) (append xs (list x))))))



(define (fib n y x p)
  (cond [(= y x) p]
        [(even? n) (fib (+ n p) (+ y 1) x n)]
        [#t (fib (+ n p) y x n)]))

(define(nth n)
  (fib 2 0 n 1))

(define (maxProd xs m)
  (let ([a (* (car xs) (car (cdr xs)) (car (cdr (cdr xs))))])
    (cond [(and (=(length xs) 3) (= m 0)) a] 
          [(null? (cdr (cdr (cdr xs)))) (max a m)]
          [(> a m) (maxProd (cdr xs) a)]
          [#t (maxProd (cdr xs) m)])))

(define (bigtr xs)
  (println(maxProd xs 0)))



(define (priv s1 s2 i l b flag)
  (cond [(or (= i l) flag) b]
        [(char-ci=? (string-ref s1 i) (string-ref s2 i)) (priv s1 s2 (+ i 1) l (+ b 1) flag)]
        [#t (priv s1 s2 (+ i 1) l b #t)]))

(define (f1 s1 s2)
  (priv s1 s2 0 (min (string-length s1) (string-length s2)) 0 #f))



(define (dru m n s)
  (if(= m 0) s
     (dru (- m 1) n (+ s (/ (expt m n) n)))))

(define (f2 m n)
  (dru m n 0))


(define (humm s1 s2 i l1 l2 b)
  (cond [(= i l1) (+ b (- l2 l1))]
        [(char-ci=? (string-ref s1 i) (string-ref s2 i)) (humm s1 s2 (+ i 1) l1 l2 b)]
        [#t (humm s1 s2 (+ i 1) l1 l2 (+ b 1))]))

(define (humming s1 s2)
  (humm s1 s2 0 (min (string-length s1) (string-length s2)) (max (string-length s1) (string-length s2)) 0))

  

(define (fafa f1 f2 xs ns)
  (cond [(null? xs) ns]
        [(or (f1 (car xs)) (f2 (car xs))) (fafa f1 f2 (cdr xs) (append ns (list (car xs))))]
        [#t (fafa f1 f2 (cdr xs) ns)]))


(define (mfaf xs f1 f2)
  (fafa f1 f2 xs (list)))

(define (pom xs)
  (if (odd-prime? xs) #t #f))

(println (mfaf (list 1 2 3 4 5 6 7) even? pom))


(define (zbirKvad x y)
  (if (= x 0) #f
      (if (and (integer? (sqrt x)) (integer? (sqrt (- y x)))) #t
          (zbirKvad (- x 1) y))))

(define (zbirKvadrata x)
  (zbirKvad x x))

(define (randomlist n mx)
  (for/list ((i n))
    (add1 (random mx))))

(define (zadnji xs fx nl)
  (cond [(null? xs) nl]
        [(fx (car xs)) (zadnji (cdr xs) fx (append nl (list (car xs))))]
        [#t (zadnji (cdr xs) fx nl)]))

(println (zadnji (randomlist 10 100) zbirKvadrata (list)))
  
  

