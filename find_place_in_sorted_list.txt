fun ind (a : int list, b : int, i : int) = 
  if null a then i
  else if hd a = b then i
  else if hd a < b then ind(tl a, b, i+1)
  else ind(tl a, b, i);

fun f(xs : int list, n : int)= 
  ind(xs, n, 0);

val x = f([4,5,7], 6);
