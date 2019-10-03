(* resource: http://xahlee.info/ocaml/types.html *)

(* you can put types in functions *)
let f (n:int) = n + 1;;

(*
TYPES

You can define your own type, by assigning a type expression to a name.
The syntax is this:
type name = type_expression.
*)

(*
Type constructor:
The simplest type is just a arbitrary letter sequence,
which is called “type constructor”.
A type constructor's first letter must be Capitalized.
*)

type t1 = X;; (* this defines the type t1 and only values of this type is the Symbol "X"*)
type t2 = Alice;; (* t2 is also a type and only value is Alice *)

(*
Type expression can use the operator |, which means “alternative”, “one of”, or “or”.
*)

type my_brothers = Andres | Alonso;;
type my_dogs = Max | Obamita;;
type my_girls = Shani | Yasmin | Ashley | Monika;;

(* *)

type foo =
  | Nothing (* Constnat *)
  | Int of int (* Int constructor with value int *)
  | Pair of int * int (* Pair constructor with value as pair of ints *)
  | String of string;; (* constructor String that has the value string *)

let nada = Nothing;;
let pair12 = Pair (1, 2);;
let hello = String "Hello!!!";;

(* Recursive variants *)

(* type linked_list =
  | nil
  | Cons of int * *)

type binary_tree =
  | Leaf of int
  | Tree of binary_tree * binary_tree;;
