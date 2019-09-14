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

(* higher order functions
A function is higher-order if it takes a
function as an argument or returns one as
a result.
*)


let compose f g = fun x -> f (g x);; (* returns a function that composes f and g *)

let add_2 x = x + 2;;
let add_4 = compose add_2 add_2;;
Printf.printf "\n%i \n" (add_4 1);;

(* Folding Recursion *)

let rec length list = match list
with [ ] -> 0 (* Nil case *)
| x :: xs -> 1 + length xs;; (* Cons case *)

Printf.printf "\n%i \n" (length [5; 4; 3]);;
Printf.printf "%i \n" (length [5; 4; 3; 2]);;
