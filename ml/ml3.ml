open Common

(*
 if you are using a given module heavily, you may want to make its contents directly accessible. For this, we use the open directive.
 *)

(* CPS *)

let addk (a,b) k = k (a + b);;

(*
consk creates a new list by adding an element to the front of a list.
*)

let cons (x, l) = x::l;;

let consk (x, l) k = k (x::l);;

consk (1, []) (List.map string_of_int);;

(* concatk concatenates two strings in the order they are provided. *)

let concatk (s1, s2) k = k (s1 ^ s2);;

concatk ("hello", "world") (fun s -> (s, String.length s));;

(* string_of_intk takes an integer and converts it into a string. *)

let string_of_intk n k = k (string_of_int n);;

string_of_intk 0 (fun s -> (s, String.length s));;

(* truncatek takes a float n and truncates it in the same way as the truncate
function which can be found in the pervasives module. *)

let truncatek x k = k (int_of_float x);; (* TODO *)

truncatek 3.14 string_of_int;;

(* TODO *)

let addk (a,b) k = k (a + b);;
let subk (a,b) k = k (a - b);;
let mulk (a,b) k = k (a * b);;

let diff_flipk p k = subk (1,p) (fun v1 -> mulk (v1,p) (fun v2 -> mulk (2,v2) k));;

diff_flipk 1 report_int;;

(*
- v1 = 4*b
- v2 = a*a
- v3 = 2 * v2
- v4 = v3 + v1
- v5 = v4 + c
*)
let quadk (a,b,c) k = mulk (4,b) ( fun v1 ->
  mulk (a,a) (fun v2 -> mulk (2,v2) (fun v3 -> addk (v3,v1) (fun v4 -> addk (v4,c) k ) ) ) );;

quadk (1,1,1) report_int;;

let three_freeze (s, p) =  let sp=s^p in sp^sp^sp;;

let three_freezek (s, p) k = concatk (s,p) (fun sp -> concatk (sp,sp) (fun spsp -> concatk (spsp,sp) k ) );;

three_freezek ("muda", "plop") (fun s -> (s , String.length s));;


(* let shiftk (s, q) k = let v = (q +. 1.57) in k ( s ^ string_of_int (truncate (v*.v) ) ^ s );; *)

(*
- v1 = q + 1.57
- v2 = v1*v1
- v3 = truncate v2
- v4 = string_of_int v3
- v5 = concat s v4
- v6 = concat v5 s
*)

let float_addk (a,b) k = k (a +. b);;

let shiftk (s,q) k = float_addk (q,1.57) (fun v1 -> float_mulk (v1,v1)
  (fun v2 -> truncatek v2 (fun v3 -> string_of_intk v3 (fun v4 -> concatk (s,v4)
  (fun v5 -> concatk (v5,s) k ) ) ) ) );;

shiftk ("##", 3.14) (fun s -> s);;

(* let shiftk (s, q) k = *)

shiftk ("##", 3.14) (fun s -> s);;
shiftk ("", 17.0) (fun s -> (grab_trace s, String.length s));;

let rec all_positive_tail l b =
match l with
| [] -> b
| x::xs -> all_positive_tail xs (b && (x > 0));;

let rec all_positive l = all_positive_tail l true;;

let rec all_positive_tailk l b k =
match l with
| [] -> k b
| x::xs -> gtk (x,0) (fun b1 -> all_positive_tailk xs (b && b1) k );;

let rec all_positivek l k = all_positive_tail l true;;

all_positive [5;3;6;(-1);7];;
all_positivek [5;3;6;(-1);7] (fun b -> if b then "true" else "false");;

(* TODO *)

let report_int i = Printf.printf "%i\n" i;;

let rec even_count l =
match l with
| [] -> 0
| x::xs -> let r=even_count xs in if x mod 2 = 0 then 1 + r else r ;;

let rec even_countk l k =
match l with
| [] -> k 0
(* | x::xs -> modk (x,2) (fun m -> eqk (m,0) (fun b -> even_countk xs (fun r -> if b then k (r + 1) else k r ) ));; *)
(* | x::xs -> modk (x,2) (fun m -> eqk (m,0) (fun b -> even_countk xs (fun r -> if b then addk (r,1) (fun ans -> k ans ) else k r ) ));; *)
(* | x::xs -> modk (x,2) (fun m -> eqk (m,0) (fun b -> even_countk xs (fun r -> addk (r,1) (fun ans -> if b then k ans else k r ) ) ));; *)
| x::xs -> even_countk xs (fun r -> modk (x,2) (fun m -> eqk (m,0) (fun b -> if b then addk (1,r) k else k r) ) );;

(* even_count [1;2;3];; *)
even_countk [1;2;3] report_int;;

(* *)

let report_float f = Printf.printf "%f\n" f;;
let geqk (a,b) k = k (a >= b);;

let report_bool b = Printf.printf "%b\n" b;;

let rec sum_all (p,l) =
match l with
| [] -> 0.0
| x::xs -> let r=sum_all (p,xs) in if p x then x +. r else r;;

sum_all ( (fun x -> 1.5 <= x),  [1.3;2.5;3.9] );;

let rec sum_allk (pk,l) k =
match l with
| [] -> k 0.0
(* | x::xs -> sum_allk (p,xs) ( fun r -> if p x then k (x +. r) else k r );; *)
(* | x::xs -> pk x ( fun b -> sum_allk (pk,xs) (fun r -> if b then k (x +. r) else k r ) );; *)
(* | x::xs -> pk x ( fun b -> sum_allk (pk,xs) (fun r -> if b then float_addk (x, r) k else k r ) );; *)
(* | x::xs -> pk x ( fun b -> sum_allk (pk,xs) (fun r -> float_addk (x, r) (fun addition -> if b then k addition else k r ) ) );; *)
| x::xs -> sum_allk (pk,xs) (fun r -> pk x (fun b -> if b then float_addk (x,r) k else k r) ) ;;

(* geqk (1.0, 1.0) report_bool;; *)

(* let f = (fun x -> fun k -> geqk (x,1.5) k);;
sum_allk ( f, [1.3;2.5;3.9] ) report_float;; *)
sum_allk ( (fun x -> fun k -> geqk (x,1.5) k), [1.3;2.5;3.9] ) report_float;;

(* *)

let mulk (a,b) k = k (a*b);;
let addk (a,b) k = k (a+b);;

let rec list_compose fs =
match fs with
| [] -> 0
| fn::fns -> let r=list_compose fns in fn r;;

let rec list_composek fks k =
match fks with
| [] -> k 0
| fnk::fns -> list_composek fns (fun r -> fnk r k ) ;;


list_compose [(fun x -> x * x) ; (fun x -> x + 2)];;
list_composek [(fun x -> fun k -> mulk (x, x) k) ;
                 (fun x -> fun k -> addk (x, 2) k)] report_int;;
