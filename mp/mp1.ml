(* *)

let rec product l =
match l with
| [] -> 1.0
| x :: xs -> x *. (product xs);;

Printf.printf " %b\n" ((product [2.; 3.; 4.]) = 24.0);;

(* *)

let rec double_all l =
match l with
| [] -> []
| x :: xs -> 2.0 *. x :: double_all xs;;

double_all [1.5; -3.0; 0.; 2.2];;

(* *)
