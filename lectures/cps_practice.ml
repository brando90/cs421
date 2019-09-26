(* *)

let rec mult_list list =
match list with
| [] -> 1
| x::xs -> x * mult_list xs;;

(* Printf.printf "%i\n" (mult_list [2]);; *)

let report n = Printf.printf "%i\n" n;;

let multk (a,b) k = k (a*b);;

multk (-1,3) report;;

(* let rec mult_listk list k =
match list with
| [] -> k 1
| x::xs -> mult_listk xs k;; *)

let rec mult_listk' list k =
match list with
| [] -> k 1
| x::xs -> mult_listk xs (fun r -> k (r*x));;

mult_listk [2] report;;
mult_listk' [2] report;;
