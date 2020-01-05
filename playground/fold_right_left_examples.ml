

(*

fold left = iterating over lists = tail recursion

*)

(* our version *)
(* ('a -> 'b -> 'a) -> 'a -> 'b list -> 'a *)
let rec fold_left f a list =
    match list with
    | [] -> a
    | (x :: xs) -> fold_left f (f a x) xs;;

(* example, all ints are nonnegative *)

let rec all_nonneg l =
    match l with
      | [] -> true
      | x::xs -> (x>=0)&&(all_nonneg xs)

let all_nonneg_start = true;;

let all_nonneg_step r x = r&&(x>=0)

List.fold_left all_nonneg_step all_nonneg_start;;

List.fold_left all_nonneg_step all_nonneg_start [4; 7; -3; 5];;

(*

fold right = recursion over lists = forward recursion

*)

(* ('a -> 'b -> 'b) -> 'a list -> 'b -> 'b *)
let rec fold_right f lst b =
  match lst
    with [] -> b
      | (x :: xs) -> f x (fold_right f xs b);;
