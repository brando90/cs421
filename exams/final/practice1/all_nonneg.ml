(* Put code for all_nonneg, all_nonneg_start and all_nonneg_step here. Function headers are given below.
   Change the bodies to finish them.
   When you are testing one function, please do not remove the unimplemented function headers to prevent parsing errors. *)

let rec all_nonneg l =
    match l with
      | [] -> true
      | x::xs -> (x>=0)&&(all_nonneg xs)

let rec all_nonneg l =
    match l with
      | [] -> true
      | x::xs ->
        let b = x>=0 in b&&(all_nonneg xs)

let rec all_nonneg l = all_nonneg_tail l true

let rec all_nonneg_tail l b =
  match l with
    | [] -> b
    | x::xs -> all_nonneg_tail xs (x>=0&&b)

let all_nonneg_start = true;;

let all_nonneg_step r x = r&&(x>=0)

(* *)
