(* triple pairs
where each pair has the first element is the first input argument
and the second element is from the corresponding position in the input triple.
'a -> 'b * 'c * 'd ->
('a * 'b) * ('a * 'c) * ('a * 'd)
*)

let triple_pairs a trp =
match trp with
| (b,c,d) -> ((a,b),(a,c),(a,d));;

triple_pairs 2 (false, 3, true);;

(*
swap_eq
that takes two pairs and determines whether the second is the left-right swap
of the first.

'a * 'b -> 'b * 'a -> bool
*)

let swap_eq t1 t2 =
match t1 with
| (a1,a2) -> match t2 with
  | (b1, b2) -> a1 = b2 && a2 = b1;;

let t1 = (1.,0.);; let t2 = (0.,1.);;
Printf.printf "%b \n" (swap_eq t1 t2);;
let t1 = (0.,0.);; let t2 = (0.,1.);;
Printf.printf "%b \n" (swap_eq t1 t2);;

let t1 = (0.,1.);; let t2 = (1.,0.);;
Printf.printf "%b \n" (swap_eq t1 t2);;
let t1 = (1.,2.);; let t2 = (3.,4.);;
Printf.printf "%b \n" (swap_eq t1 t2);;

(*
closer_to_origin

float * float ->
fLoat * float ->
int

If the first point is closer, it should evaluate to -1,
if the second is closer, it should evaluate to 1, and
if the points are equidistant from the origin, it should evaluate to 0.
*)

let norm2 p =
match p with
| (x1,x2) -> x1 *. x1 +. x2 *. x2;;

let closer_to_origin p1 p2 =
if (norm2 p1) < (norm2 p2) then (-1) else if (norm2 p1) > (norm2 p2) then 1 else 0;;

Printf.printf "%f \n" (norm2 (3.,4.));;

Printf.printf "\n%i \n" (closer_to_origin (2., 0.) (0., -1.));;
Printf.printf "%i \n" (closer_to_origin (1.,1.) (3.,4.) );;
Printf.printf "%i \n" (closer_to_origin (3.,4.) (1.,1.) );;
Printf.printf "%i \n" (closer_to_origin (1.,1.) (1.,1.) );;

(* twist


('a * 'b) * ('c * 'd) -> ('d * 'a) * ('c * 'b)
*)

let twist pp =
match pp with
| ((a,b),(c,d)) -> ((d,a),(c,b));;

twist (("hi",true),(2, 17.3));;

(* triple_xprod
triple_xprod :
'a * 'b * 'c ->
'd * 'e ->

(('a * 'd) * ('b * 'd) * ('c * 'd)) * (('a * 'e) * ('b * 'e) * ('c * 'e))
*)

let triple_xprod trp pr =
match trp with
| (a,b,c) -> match pr with
  | (d,e) -> ((a , d) , (b , d) , (c , d)) , ((a , e) , (b , e) , (c , e));;

triple_xprod (1,true,33.5) ("hi",17);;

(* triple_app

*)

let triple_app (f,g,h) x =
 f( g( (h x) ) );;

triple_app (print_string, string_of_int, (fun n -> n + 4)) 21;;

(* *)
let same_arg_twice f x =
(f x) x;;

same_arg_twice (fun s1 -> fun s2 -> string_of_int (s1 + s2 + 12)) 3;;

(* *)

let map_triple f (a,b,c) =
( f a, f b, f c );;

map_triple float_of_int (1,5,10);;

(* two_funs *)

let two_funs fns ins =
match fns with
| (f1,f2) -> match ins with
  | (x1,x2) -> (f1 x1, f2 x2);;

two_funs (not, abs) (true, -5);;

(* rev_app *)

let rev_app x f =
f x;;

rev_app true not;;
rev_app 2 (fun x -> x + 2);;


(* naive_fibonacci
The Fibonacci number for any integer less than or equal to 1 is 1 and after that, the
nth
Fibonacci number is the sum of the two preceding Fibonacci numbers in the sequence, for
n>1
*)

let rec naive_fibonacci n =
match n>1 with
| false -> 1
| true -> (naive_fibonacci (n-1)) + (naive_fibonacci (n-2));;
(* | false -> (naive_fibonacci n-1) + (naive_fibonacci n-2);; *)

let rec naive_fibonacci n =
if n <= 1 then 1
else (naive_fibonacci (n-1) ) + (naive_fibonacci (n-2) );;

(* Printf.printf "\n%i \n" (naive_fibonacci (-1));;
Printf.printf "%i \n" (naive_fibonacci 0);;
Printf.printf "%i \n" (naive_fibonacci 1);;
Printf.printf "%i \n" (naive_fibonacci 2);;
Printf.printf "%i \n" (naive_fibonacci 3);;
Printf.printf "%i \n" (naive_fibonacci 4);;
Printf.printf "%i \n" (naive_fibonacci 7);; *)

(* *)
let rec delannoy (m, n) =
if m == 0 || n == 0 then 1 else
delannoy (m - 1, n - 1) + delannoy (m - 1, n) + delannoy (m, n - 1);;

delannoy (1, 2);;

Printf.printf "\n---\n%i \n" (delannoy (0, 0));;
Printf.printf "%i \n"  (delannoy (0, 1));;
Printf.printf "%i \n" (delannoy (1, 0));;
Printf.printf "%i \n" (delannoy (1, 1));;
Printf.printf "%i \n" (delannoy (1, 2));;

(* ackermann *)

let rec ackermann m n =
if m = 0 then n+1 else
if m>0 && n=0 then ackermann (m-1) 1 else
ackermann (m - 1) (ackermann m (n - 1) );;

ackermann 3 4;;

(* sum_evens_less_eq*)

let rec sum_evens_less_eq n =
if n <= 0 then 0 else
if n mod 2 = 0 then n + sum_evens_less_eq (n - 1) else
sum_evens_less_eq (n - 1);;

sum_evens_less_eq 17;;

Printf.printf "%i \n" (sum_evens_less_eq 17);;

(* Collatz

-  if the number is even, divide by 2 to get the next number in the sequence.
- If it is odd, multiply by 3 and add 1.
- given an integer n returns the number of steps its Collatz sequence takes to reach 1
*)

let rec collatz n =
if n = 1 then 0 else
if n mod 2 = 0 then (collatz (n/2)) + 1 else (collatz (3*n + 1)) + 1;;

Printf.printf "\n%i \n " (collatz 27);;
