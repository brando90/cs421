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

(* 5 sub_list *)

(* let rec sub_list list1 list2 =
match list1 with
| [] -> match list2 with
  | [] -> true
  | l2::l2s -> false
| l1::l1s -> match list2 with
  | [] -> true
  | l2::l2s -> false;; *)

let rec f list1 list2 =
match list1 with
| [] -> match list2 with
  | [] -> true
  | l2::l2s -> false
| l1::l1s -> false;;

sub_list [1;1;2;1;1;4;1] [1;2;1;1;1];;

(* 6 count *)

let rec even_count_fr l =
match l with
| [] -> 0
| x::xs -> match x mod 2 with
  | 0 -> 1 + even_count_fr xs
  | _ -> even_count_fr xs
  ;;

even_count_fr [1;2;3];;

(* 7 pair sums *)

let rec pair_sums l =
match l with
| [] -> []
| x::xs -> match x with
  | (a,b) -> let rest_sum = (pair_sums xs) in (a+b) :: rest_sum;;

pair_sums [(1,6);(3,1);(3,2)];;

(* 8 remove_even *)

let rec remove_even list =
match list with
| [] -> []
| x::xs -> match x mod 2 with
  | 0 -> remove_even xs
  | 1 -> x :: remove_even xs;;

remove_even [1; 4; 3; 7; 2; 8];;

(* 9 sift *)

let rec sift p l =
match l with
| [] -> ([],[])
| x::xs -> let (yes,no) = (sift p xs) in
  match p x with
    | true -> ( x::yes, no )
    | false -> ( yes, x::no )
;;

sift (fun x -> x mod 2 = 0) [-3; 5; 2; -6];;
