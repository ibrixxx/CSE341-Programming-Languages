fun par(x : int) =
  if x mod 2 = 0
  then true
  else false;


fun suma(xs : int list) = 
  if null xs
  then 0
  else if par(hd xs)
  then hd xs + suma(tl xs)
  else suma(tl xs);

suma([1,2,3,4,5,6]);