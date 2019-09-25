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

add_triple_k (1,2,3) report;;
