(* 1 product *)

let rec product l =
match l with
| [] -> 1.0
| x :: xs -> x *. (product xs);;

Printf.printf " %b\n" ((product [2.; 3.; 4.]) = 24.0);;

(* 2 double_all *)

let rec double_all l =
match l with
| [] -> []
| x :: xs -> 2.0 *. x :: double_all xs;;

double_all [1.5; -3.0; 0.; 2.2];;

(* 3 pair with all *)

let rec pair_with_all x l =
match l with
| [] -> []
| h::t -> (x,h):: pair_with_all x t;;

pair_with_all 1 ["a"; "b"; "c"];;

(* 4 interleave
The function is required to use (only) forward recursion (no other form of recursion)
*)

let rec interleave l1 l2 =
match l1 with
| [] -> l2
| x::xs -> match l2 with
  | [] -> l1
  | y::ys -> x :: y :: interleave xs ys
  ;;

interleave [] [];;
interleave [] [2;4];;
interleave [1;3;5] [];;
interleave [1;3;5] [2;4];;
interleave [0;2;4] [3;5;7];;
interleave [0;2] [3;5;7];;
interleave [0;2] [3;5;7;9;11;13;15];;
interleave [0;2;4;6;8;10;12] [3;5];;

(* 5 sub_list

TODO
*)
