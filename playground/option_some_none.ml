(*
Option is used to encode partial function.
Partial function = a function that maps a subset of the domain to.
f:X'->Y, X'<=X. If X=X' then f is called a total function.

f(x) \in Y  or
f(x) is undefined. Sometimes this is mapped to bottom.

https://discuss.ocaml.org/t/basic-questions-in-ocaml/910
*)


(* Which means that it either holds a value of some unspecified ('a) type (Some) or it is empty (None). *)
type 'a option =
  | Some of 'a
  | None;;

let some_ten =  Some 10;;

let get_option some_val =
  match some_val with
    | Some a -> a
    | None -> None;;

let ten = get_option some_ten;;
