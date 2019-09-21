(* Booleans *)

Printf.printf "%b \n" true;;
Printf.printf "%b \n" false;;

let (a,b) = (3,4);;
let truth_val = if b > a then 25 else 0;;

Printf.printf "%i \n" truth_val;;

let a = 1 let b = 0;;
let truth_val = if b > a then 25 else 0;;

Printf.printf "%i \n" truth_val;;

let a = 1 let b = 0;;
let truth_val = if b > a then 25 else 0;;

Printf.printf "%i \n" truth_val;;

(*
Booleans and Short-Circuit Evaluation

Short-circuit evaluation means that when evaluating boolean expressions
(logical AND and OR ) you can stop as soon as you find
the first condition which satisfies or negates the expression.
*)

3 > 1 || (print_string "Bye\n"; 4 > 6);;


(* Tuples as Values *)

let s = (5,"hi",3.2);;

(* Pattern Matching with Tuples *)

let (a,b,c) = s;; (* (a,b,c) is a pattern *)
let x = 2, 9.3;; (* tuples don't require parens in Ocaml *)

(* Nested Tuples *)

let d = ((1,4,62),("bye",15),73.95);;
let (p,(st,_),_) = d;; (* _ matches all, binds nothing *)

(* Functions on tuples *)

let plus_pair (n,m) = n + m;;
plus_pair (3,4);;


(* Save the Environment!

< (v1,…,vn) → exp, rho >

*)


(* Curried vs Uncurried *)

let add_three x y z = x + y + z;; (* curried *)

let add_triple (u,v,w) = u + v + w;; (* uncurried *)


(* higher order functions
A function is higher-order if it takes a
function as an argument or returns one as
a result.
*)


let compose f g = fun x -> f (g x);; (* returns a function that composes f and g *)

let add_2 x = x + 2;;
let add_4 = compose add_2 add_2;;
Printf.printf "\n%i \n" (add_4 1);;

(* thrice *)

let thrice f x = f (f (f x));;

let ff = compose f f;;
let fff = compose ff f;;

let fff' = compose f (compose f f);;

(* Lambda Lifting *)

let add1 x = x+1;;
let add1' = (+) 1;; (* this is not the same as above because it actually does partial applicaiton, while above defines a function *)
let add_1' = fun x -> x + 1;;

(* the reason the following actually immediately printed is because of currying, *)
let add_two = (+) (print_string "test\n" 2);; (* in this case it prints out test immediately *)
(* *)
let add2 = (* lambda lifted = delaying of application by delaying applicaiton *)
  fun x -> (+) (print_string "test\n" 2) x;;


(* Folding Recursion *)

let rec length list = match list
with [ ] -> 0 (* Nil case *)
| x :: xs -> 1 + length xs;; (* Cons case *)

Printf.printf "\n%i \n" (length [5; 4; 3]);;
Printf.printf "%i \n" (length [5; 4; 3; 2]);;

(* *)


let rec same_length list1 list2 =
match list1 with
| [] -> match list2 with
  | [] -> true
  | y:ys -> false
| x::xs -> match list2 with
  | [] -> false
  | y::ys -> (y=x) && same_length xs ys;;
