fun srednji(a, b, c) = 
    if ((a > b andalso a < c) orelse (a < b andalso a > c))
    then a
    else if ((a > b andalso b < c) orelse (a < b andalso b < c))
    then b
    else c;

fun f1 (x : int, y : int, z : int) = 
     let val sr = srednji(x,y,z)
     in
         if x > 3*sr orelse y > 3*sr orelse z > 3*sr
         then true
         else false
     end;
     
f1(1,4,13);
    