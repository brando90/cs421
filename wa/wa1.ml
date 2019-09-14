let x = 3;;

let w = 2*x  in (w,x);;

let f y = y + x;;

let c = 7 + x;; (* 10 *)

let c = f c;; (* 13 *)

Printf.printf "%i \n" c;;

let g u v = (f (u - v)) + x;;
let g' = fun u -> fun v -> (f (u - v)) + x;;
let g'' = fun u -> (fun v -> (f (u - v)) + x) ;;

Printf.printf "%i \n" (g 2 1);; (* 7 *)
Printf.printf "%i \n" (g 4 1);; (* 9 *)
Printf.printf "%i \n" (g' 4 1);; (* 9 *)
Printf.printf "%i \n" (g'' 4 1);; (* 9 *)

(*
{c -> 13, f -> <y -> y + x, {x -> 3}>, x -> 3,
g -> < u -> fun v -> (f (u - v)) + x , {c -> 13, f -> <y -> y + x, {x -> 3}>, x -> 3}> }
*)

Printf.printf "%i \n" (g x c);;
Printf.printf "%i \n" (g 3 13);;

(*let xx =*)
let b = (g x c)
(* b = g 3 13 =  f ( 3 - 13 ) + 3 = f(-10) + 3 = -7 + 3 = -4 *)
in
(let x = 5
in
(* 5 + -4 + 13 = 14*)
x + b + c );;

(* Printf.printf "%i \n" (xx);; *)

let c = (g (f 1) (f 5));;
Printf.printf "%i \n" c;;
