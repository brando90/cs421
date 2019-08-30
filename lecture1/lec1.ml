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
