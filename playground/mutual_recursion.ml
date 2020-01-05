(*
https://ocaml.org/learn/tutorials/labels.html#Mutually-recursive-functions
*)

let rec even n =
  match n with
    | 0 -> true
    | x -> odd (x-1)
and odd n =
  match n with
    | 0 -> false
    | x -> even (x-1);;

even 2;; (* true *)
even 3;; (* false *)
