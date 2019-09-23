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

let rec sub_list list1 list2 =
match list1,list2 with
| [],[] -> true
| [],_ -> false
| _,[] -> true
| l1::l1s,l2::l2s -> match l1=l2 with
  | true -> sub_list l1s l2s
  | false -> sub_list l1s list2
  ;;

sub_list [1;1;2;1;1;4;1] [1;2;1;1;1];;

(* 6 count *)

let rec even_count_fr l =
match l with
| [] -> 0
| x::xs -> let count_even = (even_count_fr xs) in match x mod 2 with
  | 0 -> 1 + count_even
  | _ -> count_even
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
| x::xs -> let no_even = (remove_even xs) in match x mod 2 with
  | 0 -> no_even
  | _ -> x :: no_even;;

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

(* 10 apply even odd *)

let rec length list = match list
with [ ] -> 0
| x :: xs -> 1 + length xs;;

let rec apply_even_odd l f g =
match l with
| [] -> []
| x::xs -> let list=(apply_even_odd xs f g) in match (length xs) mod 2 with
  | 0 -> (f x) :: list
  | _ -> (g x) :: list
;;

apply_even_odd [1;2;3] (fun x -> x+1) (fun x -> x - 1);;
apply_even_odd [(1, 1);(15, 7)] (fun (x, y) -> x + y) (fun (x, y) -> x - y)

(* 11 even count tr *)

let rec even_count_tr2 l running_total =
match l with
| [] -> running_total
| x::xs -> match x mod 2 with
  | 0 -> even_count_tr2 xs (running_total+1)
  | _ -> even_count_tr2 xs running_total
;;

let rec even_count_tr l = even_count_tr2 l 0;;

even_count_tr [1;2;3];;

(* 12 count element *)

let rec count_element2 l m running_total =
match l with
| [] -> running_total
| x::xs -> match x=m with
  | true -> count_element2 xs m (running_total + 1)
  | false -> count_element2 xs m running_total
;;

let rec count_element l m = count_element2 l m 0;;

count_element [0;1;2;4;2;5;4;2] 2;;

(* 13 all nonneg *)

let rec all_nonneg2 list all_nonnegative =
match list with
| [] -> all_nonnegative
| x::xs -> all_nonneg2 xs (all_nonnegative && x >= 0)
;;

let rec all_nonneg list = all_nonneg2 list true;;

all_nonneg [4; 7; -3; 5];;

(* 14 split sum *)

let rec split_sum2 l f sum1 sum2 =
match l with
| [] -> (sum1,sum2)
| x::xs -> match f x with
  | true -> split_sum2 xs f (sum1+x) sum2
  | false -> split_sum2 xs f sum1 (sum2+x)
;;

let rec split_sum l f = split_sum2 l f 0 0;;

split_sum [1;2;3] (fun x -> x>1);;

(* 15 *)

let rec concat2 s list acc_str =
match list with
| [] -> acc_str
| x::xs -> if acc_str="" then
  concat2 s xs (acc_str ^ x)
  else
  concat2 s xs (acc_str ^ s ^ x)
;;

let rec concat s list =
match list with
| [] -> ""
| x::xs -> if xs=[] then
x else
concat2 s list ""
;;

concat " * " ["3"; "6"; "2"];;

(* 16 let even_count_fr_base *)

let even_count_fr_base = 0 ;;

let even_count_fr_rec x rec_val =
match (x mod 2) with
| 0 -> 1 + rec_val
| _ ->  rec_val;;

(fun l -> List.fold_right even_count_fr_rec l even_count_fr_base) [1; 2; 3];;

(* 17 pair_sums_map_arg *)

let pair_sums_map_arg p =
match p with
| (a,b) -> a + b
;;

List.map pair_sums_map_arg [(1,6);(3,1);(3,2)];;

(* 18 remove even base *)

let remove_even_base = [];;
let remove_even_rec new_potential_val odd_list =
match new_potential_val mod 2 with
| 0 -> odd_list
| _ -> new_potential_val :: odd_list
;;

(fun list -> List.fold_right remove_even_rec list remove_even_base)
[1; 4; 3; 7; 2; 8];;

(* 19 even count tr start *)

let even_count_tr_start = 0 ;;
let even_count_tr_step acc_val x =
match x mod 2 with
| 0 -> 1 + acc_val
| _ -> acc_val
;;
List.fold_left even_count_tr_step even_count_tr_start [1; 2; 3];;

(* 20 split sum start *)

let split_sum_start = (0,0);;
let split_sum_step = fun f -> fun p -> fun x ->
match p with
| (true_f,false_f) ->
  match f x with
  | true -> (true_f+x,false_f)
  | false -> (true_f,false_f+x)
;;

(fun l -> fun f -> List.fold_left (split_sum_step f) split_sum_start l) [1;2;3] (fun x -> x>1);;
