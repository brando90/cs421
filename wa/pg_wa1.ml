let v = 2 in v*4;; (* note does NOT update environment *)

(*
# let v = 2 in v*4;;
- : int = 8
*)

(* Printf.printf "%i \n" (v);; *)

let x = let v = 2 in v * 4;;

Printf.printf "%i \n" (x);; (* this does print 8 *)

(* *)

let f y = y + x;;
let f' = fun y -> y + x;;

(* *)

let g u v = (f (u - v)) + x;;
let g' = fun u -> fun v -> (f (u - v)) + x;;
