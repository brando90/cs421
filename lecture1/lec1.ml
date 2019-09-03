(* comment. *)
(* comment can be (* nested *).*)
(*
https://ocaml.org/learn/tutorials/compiling_ocaml_projects.html
ocamlopt
ocamlopt lec1.ml ; ./a.out
http://xahlee.info/ocaml/ocaml_basics.html
*)

print_int (2 + 3);;
print_string "\n";;

(*
print_bool (2 < 3);;
print_string "\n";;
*)

Printf.printf "%B\n" (3 < 4);;

print_int (15 * 2);;
print_string "\n";;

(*
1.35 + 0.23;;
Error: This expression has type float but an
expression
*)

print_float (1.35 +. 0.23);;
print_string "\n";;

(*
1.0 * 2;; (* No Implicit Coercion *)
Error: This expression has type float but an expression was expected of type
         int
*)

print_string "Hi there";;
print_string "\n";;

print_string "Hello world";;
print_string "\n";;

(* sequencing expressions *)
(print_string "Bye\n"; 25);;
(print_string "\nhell1\n"; print_string "hello2\n");;
(print_string "cs42\n"; print_int (2-3); print_string "ocaml\n");;

(* Declarationsl Sequencing of declarations *)
let x = 1 + 10;; (* declaration *)
print_int x;;
let test = 3 < 2;;
Printf.printf "\n%B\n" test;;
let a = 1 let b = a + 4;;
Printf.printf "\n%i %i\n" a b;;

Printf.printf "\nOld value of test = %b \n" test;;
let test = 3.7;;
Printf.printf "\nNew value of test  = %f \n" test;;

(*
The construct let v = e1 in e2 defines the variable v
which is local to the expression e2.
The expression e1 may be a function.
*)
Printf.printf "\nb = %i" b;;
let e = let b = 20 in 2*b;;
Printf.printf "\nb = %i" b;;
Printf.printf "\ne = %i \n" e;;

Printf.printf "a = %i\n" a;;
let c =
  let b = a + a (* b = 1 + 1 = 2 *)
  in b * b;; (* 4 = 2x2 *)
Printf.printf "c = %i\n" c;;
Printf.printf "b = %i\n" b;;

(* *)
Printf.printf "%b\n" true;;
Printf.printf "%b\n\n" false;;

Printf.printf "a = %i b = %i\n" a b;;
let cond = if b > a then 25 else 0;;
Printf.printf "cond = %i\n" cond;;

Printf.printf "%b\n" (3 > 1 && 4 > 6);;
Printf.printf "%b\n" (3 > 1 || 4 > 6);;

(*
short-circuit evals
if the first argument is enough for eval, then we don't
eval the second
*)
let x  = (print_string "\n\nHi\n"; 3 > 1) || 4 > 6;;
Printf.printf "%b\n" x;;
(* since the first is true then we do not print bye *)
let y = 3 > 1 || (print_string "Bye\n"; 4 > 6);;
Printf.printf "%b\n" y;;

(* tuplesas values *)
let s = (5,"hi",3.2);;
(*Printf.printf "%a\n" s;;*)
(* Printf.printf "(%i,%s,%f)\n" s;;*)
let (a,b,c) = s;;
let x = 2,9.3;;
let d = ((1,4,62),("bye",15),73.95);;
let (p,(st,_),f) = d;;
Printf.printf "\n";;

(* Functions *)
let plus_two n = n + 2;;
Printf.printf "%i\n" (plus_two 17);;
(* nameless functions aka lambda terms *)
Printf.printf "%i\n" ( (fun n -> n+2) 17 );;
let plus_one = fun n -> n + 1;;
Printf.printf "%i\n" (plus_one 17);;
Printf.printf "%i\n" ( (fun x -> x * 3) 5);;
(*
Note: in fun v -> exp(v), scope of variable is
only the body exp(v)
*)
let funcs = ((fun y -> y +. 2.0), (fun z -> z * 3));;

(* Values fixed at declaration time *)
let x = 12;;
let plus_x y = y + x;;
Printf.printf "\n%i\n" (plus_x 12);;

let x = 7;;
Printf.printf "%i\n" (plus_x 12);;
