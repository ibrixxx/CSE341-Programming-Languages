fun brEl x = 
  if x = 0 then 0
  else 1 + brEl(x div 10)

fun f(xs: int list, m: int, br: int) = 
  if null (tl xs) then m
  else if brEl(hd xs) = brEl(hd (tl xs))
  then
      let fun p(x, s) = if x > s then x else s
        in 
           f(tl xs, p(m, br+1), br+1)
        end
  else 
      f(tl xs, m, 1);


 
val r = f([12, 33, 1, 4, 99, 233, 234, 234, 991, 1, 2], 0, 1);
