
(* Iterating over lists *)

let rec fold_left f a list =
match list with
| [] -> a
| x::xs -> fold_left f (f a x) xs;;


fold_left
(fun () -> print_string)
()
["hi"; "there\n"];;

fold_left (fun () -> print_string) () ["hi"; "there\n"];;


let total = fold_left (fun x -> (fun y -> x + y)) 0 [1;2;3];;
Printf.printf "%i \n" total;;

(* Recursing over lists *)

let rec fold_right f list b =
match list with
| [] -> b
| x::xs -> f x (fold_right f xs b);; (* comibes with f x (RECURSE) *)

(* *)

let rec append list1 list2 =
match list1 with
| [] -> list2
| x::xs -> x :: append xs list2;;

let list1 = [1;2;3];;
let list2 = [3;4;5];;
fold_right (fun x -> fun list -> x :: list) list1 list2;;

fold_left (fun doubled_list -> fun new_val -> doubled_list @ [2*new_val]) [] [1;2;3];;
fold_right (fun x -> fun l -> 2*x::l ) [1;2;3] [];;

let rec my_map f list =
match list with
| [] -> []
| x::xs -> (f x) :: (my_map f xs);;

my_map (fun x -> 2*x) [1;2;3];;
