(* Session in OCaml *)

(* Read-eval-print loop; expressions and declarations *)

2 + 3;;  (* expression *)
3 < 2;;  (* declaration *)

(* Sequencing Expressions and Declarations *)
"Hi there";;  (* has type string *)

print_string "Hello world\n";;  (* has type unit *)

(print_string "Bye\n"; 25);;  (* Sequence of exp *)

(* Declarations *)
let test = 3 < 2;;  (* declaration *)

let a = 1 let b = a + 4;; (* Sequence of dec *)

(* New Bindings Hide Old *)
let test = 3.7;;

(* Local let binding *)
let b = 5 * 4 in 2 * b;;
let c =
    let b = a + a
    in b * b;;
b;;

(* Booleans (aka Truth Values) *)

true;;
false;;
if b > a then 25 else 0;;

(* Booleans *)

3 > 1 && 4 > 6;;
3 > 1 || 4 > 6;;
(print_string "Hi\n"; 3 > 1) || 4 > 6;;
3 > 1 || (print_string "Bye\n"; 4 > 6);;
not (4 > 6);;


(* Tuples *)

let s = (5,"hi",3.2);;
let (a,b,c) = s;;
let x = 2, 9.3;; (* tuples don't require parens in Ocaml *)

(* Tuples *)

let d = ((1,4,62),("bye",15),73.95);;
let (p,(st,_),_) = d;;

(* Functions *)

let plus_two n = n + 2;;
plus_two 17;;
fun n -> n + 2;;
(fun n -> n + 2) 17;;
let plus_two n = n + 2;;
plus_two 17;;
let plus_two = fun n -> n + 2;;
plus_two 14;;

(* Using a nameless function *)

(fun x -> x * 3) 5;;   (* An application *)
((fun y -> y +. 2.0), (fun z -> z * 3));;  (* As data *)

(* Values fixed at declaration time *)

let x = 12;;
let plus_x y = y + x;;
plus_x 3;;

(* Values fixed at declaration time *)

let x = 7;;  (* Redecaration, Not an update *)
plus_x 3;;

(* Fuctions with more than one argument *)

let add_three x y z = x + y + z;;
let t = add_three 6 3 2;;

(* Partial application of functions *)

let h = add_three 5 4;;
h 3;;
h 7;;

(* Functions as arguments and results *)

let thrice f x = f (f (f x));;
let g = thrice plus_two;;
g 4;;
thrice (fun s -> "Hi! " ^ s) "Good-bye!";;

(* Recursive Functions *)

let rec factorial n =
    if n = 0 then 1 else n * factorial (n - 1);;
factorial 5;;

(* better *)
let rec factorial n =
    match n
    with 0 -> 1
  | _ -> n * factorial (n - 1);;
factorial 5;;

(* rec is needed for recursive function declarations *)
(* More on this later *)

(* Tuples *)

let fst_of_3 (x,_,_) = x;;
s;;
fst_of_3 s;;
fst_of_3 d;;

(* Curried vs Uncurried *)

let add_triple (u,v,w) = u + v + w;;
add_triple (6,3,2);;
add_triple 5 4;;
fun x -> add_triple (5,4,x);;

(* Match Expression *)

let triple_to_pair triple =
  match triple
  with (0, x, y) -> (x, y)
  | (x, 0, y) -> (x, y)
  | (x, y, 0) -> (x, y)
  | (x, y, _) -> (x, y);;

(* Recursive Types - Lists *)

let fib5 = [8;5;3;2;1;1];;
let fib6 = 13 :: fib5;;
(8::5::3::2::1::1::[]) = fib5;;
fib5 @ fib6;;

(* Lists are Homogenous *)

let bad_list = [1; 3.2; 7];;

(* Functions Over Lists *)

let rec double_up list =
    match list
    with [] -> []  (* pattern before ->, expression after *)
       | (x :: xs) -> (x :: x :: double_up xs);;
let fib5_2 = double_up fib5;;

(* Functions Over Lists *)

let silly = double_up ["hi"; "there"];;
let rec poor_rev list =
  match list
  with [] -> []
     | (x::xs) -> poor_rev xs @ [x];;
poor_rev silly;;

(* Functions Over Lists *)

let rec map f list =
  match list
  with [] -> []
  | (h::t) -> (f h) :: (map f t);;
map plus_two fib5;;
map (fun x -> x - 1) fib6;;

(* Iterating over lists *)
let rec fold_left f a list =
  match list
  with [] -> a
  | (x :: xs) -> fold_left f (f a x) xs;;
fold_left
 (fun () -> print_string)
 ()
 ["hi"; "there"];;
let rec fold_right f list b =
  match list
  with [] -> b
  | (x :: xs) -> f x (fold_right f xs b);;
fold_right
 (fun s -> fun () -> print_string s)
 ["hi"; "there"]
 ();;
  
