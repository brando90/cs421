(*
* continuation = is an abstract representation of the control state of a
computer program.
    * the continuation is a data structure that represents the computational
    process at a given point in the process's execution; the created data
    structure can be accessed by the programming language, instead of
    being hidden in the runtime environment.
    * think of it as a GOTO. It tells you where the next control of the
    program goes to
    * Idea/example: use functions to represent the control flow of
    the program
*)

let report x = (print_int x; print_newline());;
let print x = (Printf.printf "%i\n" x);;

let addk (a,b) k = k (a + b);;
let add_cont (a,b) cont = cont (a + b);;

addk (2,3) report;;
add_cont (1,2) print;;

(* Nesting continuations *)

let add_triple (x,y,z) = (x + y) + z;;
let add_triple' (x,y,z) = let p=(x+y) in p + z;;

let add_triple_k (x,y,z) k = addk (x,y) (fun p -> addk (p,z) k);;

(* let add_triple_k_prints (x,y,z) k = addk (x,y) (fun p -> addk (p,z) k);; *)

add_triple_k (1,2,3) report;;

let add_triple2 x y z = x + (y + z);;

let add_triple_k_2 (x, y, z) k = addk (y,z) (fun p -> addk (z,p) k);;

add_triple_k_2 (5,5,5) report;;

(* is it true that with continuations we don't return anytihg? *)

let subk (a,b) k = k (a - b);;

let plus100 x = x + 100;;

Printf.printf "%i \n" (subk (7,5) plus100);;

(* factorial *)

let rec factorial_match n =
match n with
| 0 -> 1
| _ -> n * factorial_match (n-1);;

let rec factorial n =
if n=0 then
1 else
n * factorial (n-1);;

Printf.printf "%i\n" (factorial 3);;

let rec factorial' n =
let base_case=(n=0) in if base_case then 1 else
let rec_arg=(n-1) in let factorial_recursion=factorial rec_arg in
n * factorial_recursion;;

let rec factorial'' n =
let b=(n=0) in if b then 1 else
let s=(n-1) in let r=factorial s in
n*r;;

Printf.printf "%i\n" (factorial' 3);;

let reportb b = Printf.printf "%b\n" b;;
let eqk (a,b) k = k (a=b);;

eqk (2,1) reportb;;

let timesk (n,r) k = k (n*r);;

let rec factorialk n k =
eqk (n,0) (fun b -> if b then k 1 else
  subk (n,1) (fun s -> factorialk s (fun r ->
    timesk (n,r) k)));;

factorialk 4 report;;

(* Exception *)

exception Zero;;

let rec list_mult_aux list =
match list with
| [] -> 1
| x::xs -> if x=0 then
raise Zero
else
x * list_mult_aux xs;;

(* list_mult_aux [1;2;3;4];;
list_mult_aux [0];; *)

let list_mult list =
try list_mult_aux list
with Zero -> 0;;

Printf.printf "\n";;
list_mult [0];;

let multkp (m, n) k =
let r = m * n in
(print_string "product result: ";
print_int r;
print_string "\n";
 k r );;

multkp (-1, 2) report;;

let rec list_multk_rec list =
match list with
| [] -> 1
(* | x::xs -> x * list_mult_rec xs;; *)
| x::xs -> if x=0 then 0 else list_mult_rec xs;;

let rec list_multk_aux list k kexcp =
match list with
| [] -> k 1
| x::xs -> if x=0 then kexcp 0
else list_multk_aux xs (fun r -> multkp (x,r) k) kexcep;;

let rec list_multk list k = list_multk_aux list k k;;

list_multk [3;4;2] report;;
list_multk [7;4;0] report;;

let div (a,b) = a/b;;
let divk (a,b) k = k (a/b);;
(*
divk (3,1) report -> report (3/1);;
*)
