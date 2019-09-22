
(*
Example from: https://stackoverflow.com/questions/33923/what-is-tail-recursion
*)
(* forward rec *)
let rec sum_forward n =
match n with
| 1 -> 1
| _ -> n + sum_forward (n-1);;

let rec sum_forward' n = let recursion = sum_forward (n-1) in
match n with
| 1 -> 1
| _ -> n + recursion;;

Printf.printf "%b \n" ((sum_forward 5) = 15);;
Printf.printf "%b \n" ((sum_forward' 5) = 15);;

(* tail rec *)
let rec sum_tail n tot =
match n with
| 0 -> tot
| _ -> sum_tail (n-1) (tot+n);;

Printf.printf "%b \n" ((sum_tail 5 0) = 15);;
