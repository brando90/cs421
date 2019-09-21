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
| x::xs -> f x (fold_right f xs b);;

let my_print = (fun s -> fun () -> print_string s);;
fold_right my_print ["hi";"there"] ();;
(*
- first note that the whole call above | x::xs -> f x (fold_right f xs b);; in this case returns () unit.
This is crucial because its being called recursively. Once that has returned () then since the f in the above
needs that to print s, it has received it and then it prints and so on like domino effect.
- the base case is important cuz that case we have my_print x (fold_right my_print [] b) so the whole recursive expression
returns () (pretending that it was a print thingie since thats what the recursive case needs)
so to be consistent we return () in the base case to let things work at the bottom.
*)

fold_right (fun x list -> list @ [x]) [1;2;3] [];; (* reverses a list *)
