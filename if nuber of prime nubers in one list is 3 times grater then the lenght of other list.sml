fun prost(n : int, i : int) = 
    if i * i > n
    then true
    else if n mod i = 0
    then false
    else prost(n, i+1);

fun brojProstih(xs : int list) = 
  if null xs
  then 0
  else if prost(hd xs, 2)
  then 1 + brojProstih(tl xs)
  else brojProstih(tl xs);

fun brEl(xs : int list) = 
  if null xs 
  then 0
  else 1 + brEl(tl xs);


fun fija(a : int list, b : int list) = 
  if brEl(a)*2 = brojProstih(b)
  then true
  else if brEl(b)*2 = brojProstih(a)
  then true
  else false;

fija([1,2,3], [1,2,11,11,7,2]);
