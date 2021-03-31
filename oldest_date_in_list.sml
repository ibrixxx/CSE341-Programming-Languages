fun is_older (date1 : (int * int * int), date2 : (int * int * int)) =
    let
        val d1 = #1 date1
        val m1 = #2 date1
        val y1 = #3 date1

        val d2 = #1 date2
        val m2 = #2 date2
        val y2 = #3 date2
    in
        y1 < y2
        orelse (y1 = y2 andalso m1 < m2)
        orelse (y1 = y2 andalso m1 = m2 andalso d1 < d2)
    end;


fun oldest (dates : (int * int * int) list, max : int*int*int) =
    if null dates then max
    else if is_older(hd dates, max) then oldest(tl dates, hd dates)
    else oldest(tl dates, max);

fun f(dates : (int * int * int) list) = 
  oldest(tl dates, hd dates);


val x = f([(1,14,1999), (1,2,2000), (4,14,1994)]);
