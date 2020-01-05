(* *)

type term =
  | Variable of string
  | Const of (string * term list);;

let x = Variable "x";;
(*
# let x = Variable "x";; declares a variable x of type term with value Variable "x"
val x : term = Variable "x"
*)
let a = Variable "a" let b = Variable "b" let c = Variable "c";;
let term_list = [a,b,c];;

(* let k = Const ("x",) *)
