(*
https://discuss.ocaml.org/t/what-this-mean-let-in-let-in/932

The construct let v = e1 in e2 defines the variable v which is local to the expression e2.
The expression e1 may be a function.
*)

let v = 2 in v*4;; (* note does NOT update environment *)

(*
# let v = 2 in v*4;;
- : int = 8
*)

(* Printf.printf "%i \n" (v);; *)

let x = let v = 2 in v * 4;;

Printf.printf "%i \n" (x);; (* this does print 8 *)
