
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
