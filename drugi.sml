fun boba (a : int , b : int, i : int) = 
  if b - i < 0
  then b::[]
  else i::boba(a, b-i, i+1);

fun suma(x : int, xs : int list, i: int, b: int) = 
  if null xs
  then 0
  else if i mod b = x
  then hd xs + suma(x, tl xs, i+1, b)
  else suma(x,tl xs, i+1, b);

fun fija(a:int, b:int, xs: int list) = 
  if a = b
  then []
  else (suma (a, xs, 0, b))::fija(a+1, b, xs);

fun f(a:int, b:int) = 
  let val xs = boba(a, b, 1)
  in
   fija(0, a, xs)
  end

val ucenici = 3;
val bobe = 11;
val rez = f(ucenici, bobe);
