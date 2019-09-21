(* Functions *)
let plus_two n = n + 2;;

let times_13 n = n * 13;;

Printf.printf "%i \n" (times_13 7);;

(* *)
let square n = n*n;;

Printf.printf "%i \n" (square 7);;

(* *)
let cube n = n*n*n;;

Printf.printf "%i \n" (cube 5);;

let myFirstFun n = (n+3)*4;;

Printf.printf "%i \n" (myFirstFun 17);;

let firstFun n = (n*2)+5;;

Printf.printf "%i \n" (firstFun 12);;

(* *)

let a = 17.5;;

let add_a n = n +. a;;

Printf.printf "%f \n" (add_a 13.0);;

(* *)
let x  = 32.7;;
let square_plus_x n = x +. n*.n;;
Printf.printf "%f \n" (square_plus_x 23.17);;

(* *)

let e = 2.71828;;
let divide_e_by n = e /. n;;
Printf.printf "%f \n" (divide_e_by e);;

(* *)
let quarter = 0.25;;
let plus_quarter_times_3 n = 3.0*. (n+.quarter);;
Printf.printf "%f \n" (plus_quarter_times_3 23.5);;

(* *)
let pi = 3.14159;;
let circumference r = 2.0 *. pi *. r;;
Printf.printf "%f \n" (circumference 1.0);;

(* *)
"abc" = "abc";;
"abc" = "abd";;

let greet s =
if s = "Elsa" then
Printf.printf "Hey Elsa, cool man!"
else
Printf.printf "Hello, %s. I hope you enjoy CS421.\n" s;;

greet "Elsa";;
greet "Brando";;
greet "Angela";;

print_string "\n\n";;
(* *)
let salutations s =
if s = "Elsa" then
print_string "Halt! Who goes there!\n"
else
(print_string "Hail, ";
print_string s;
print_string ". We warmly welcome you!\n");;

salutations "Elsa";;
print_string "\n";;
salutations "Malisa";;

(* *)
let hail s =
if s = "Elsa" then
print_string "Wayell, hah theya, Ayelsa!"
else
(
  print_string "Dear, ";
  print_string s;
  print_string ". I wish you the best in CS421.\n";
  );;

hail "Thomas";;

(* *)
let salute s =
if s = "Elsa" then
print_string "What's the low-down, man?"
else
(
  print_string "Hey, ";
  print_string s;
  print_string "! Give me five, man.";
  );;

salute "Ali";;

print_string "\n\n";;
(* *)
let welcome s =
if s = "Elsa" then
print_string "Can you come out to play?\n"
else
(
  print_string "Aw, come on, ";
  print_string s;
  print_string ". We're going to have a wonderful time!\n";
  );;

welcome "John";;

(* *)
let rectangle_area h w =
if h >= 0.0 && w >= 0.0 then
h *. w
else
(-1.0);;

Printf.printf "%f \n" (rectangle_area 25.3 19.2);;
Printf.printf "%f \n" (rectangle_area 25.3 (-1.0));;
Printf.printf "%f \n" (rectangle_area (-1.0) 19.2);;
Printf.printf "%f \n\n\n" (rectangle_area (-1.0)(-1.0));;

(* *)
let sign_times a b =
if a*b > 0 then
1
else
if a*b = 0 then
0
else
(-1);;

Printf.printf "%i \n" (sign_times 4 3);;
Printf.printf "%i \n" (sign_times 1 (-1));;
Printf.printf "%i \n\n\n" (sign_times 0 123);;

(* *)
let has_smallest_square a b =
if a*a > b*b then
b
else
if a*a < b*b then
a
else
if a < b then a else b;;

Printf.printf "%i \n" (has_smallest_square 4 6);;
Printf.printf "%i \n" (has_smallest_square 6 4);;
Printf.printf "%i \n" (has_smallest_square 2 3);;
Printf.printf "%i \n" (has_smallest_square 10 12);;
Printf.printf "%i \n" (has_smallest_square 10 (-10));;

(* *)
let make_bigger a b =
if a > 0.0 then a +. b
else
if not(a > 0.0) && b < 1.0 then 1.0 +. b
else b *. b;;

Printf.printf "%f \n" (make_bigger (-5.2) 12.0);;
Printf.printf "%f \n" (make_bigger (2.0) 1.0);;
Printf.printf "%f \n" (make_bigger (-5.2) 0.1);;
Printf.printf "%f \n" (make_bigger (-5.2) 12.0);;
Printf.printf "%f \n\n\n" (make_bigger (-5.2) 12.0);;

(* *)
let diff_square_9 a b =
(* if the first float is strictly smaller than the second,
then it returns the result of subtracting nine from the square of the second *)
if a < b then b *. b -. 9.0
else
(*
If the first float is not strictly smaller than the second,
and half the first is strictly larger than the second,
return result of subtracting nine from the square of the first.
*)
if not(a < b) && (a /. 2.0) > b then a *. a -. 9.0
(*
If the first float is not strictly smaller than the second,
and half the first is not strictly larger than the second,
then return result of subtracting nine from the square of
the difference of the first and the second
*)
else
(a-.b) *. (a-.b) -. 9.0
;;

Printf.printf "%f \n" (diff_square_9 5.5 (-17.2));;
