
(* problem 1 *)

let rec ackermann m n =
if m=0 then n+1 else
if m>0 && n=0 then ackermann (m-1) 1 else
ackermann (m-1) (ackermann m (n-1))
;;

ackermann 3 4;;

(* probem 2 *)

let rec product l =
match l with
| [] -> 1.0
| x::xs -> x *. (product xs)
;;

product [2.; 3.; 4.];;

(* problem 3 *)


let test x y = (print_string "HELLO"); x + y;;

let test2 = test 2;;
let test23 = test2 3;;

(* tail recursion *)

(* add first n intergers *)

let rec add_until_forward n =
match n with
| 0 -> 0
| _ -> n + (add_until_forward (n - 1));;


let rec add_until_tail' n acc =
match n with
| 0 -> acc
| _ -> (add_until_tail (n-1) (acc+n));;

add_until_tail n = add_until_tail n 0;;

(* *)

let exists_between_start = true;;

let exists_between_step m n b x = b || (m <= x) && (x <= n);;

(fun m -> fun n -> fun l -> List.fold_left (exists_between_step m n) exists_between_start l) 5 10 [1; 20; 7; 9];;
