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
