(*
filter p l returns all the elements of the list l that satisfy the predicate p.
The order of the elements in the input list is preserved.

So filter THROUGH (not filter out)
*)

let l = [1;2;3;4;4;4;5;6;6];;

let x = 4;;
List.filter (fun y -> (y = x)) l;;
