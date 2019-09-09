(* one argument *)

let plus_one n = n + 1;;
print_int (plus_one 1);;
Printf.printf "\n%i \n" (plus_one 1);;

let plus_one' = fun n -> n + 1;;
print_int (plus_one' 2);;
Printf.printf "\n%i \n" (plus_one' 2);;

(* two arguments *)
let plus_two a b = a + b;;
print_int (plus_two 3 4);;
Printf.printf "\n%i \n" (plus_two 3 4);;

let plus_two' = fun a -> (fun b -> a + b);;
print_int (plus_two' 3 5);;
Printf.printf "\n%i \n" (plus_two' 3 5);;

(* three arguments *)

let plus_three a b c = a + b + c;;
print_int (plus_three 3 4 5);;
Printf.printf "\n%i \n" (plus_three 3 4 5);;

let plus_three' = fun a -> (fun b -> (fun c -> a + b + c));;
print_int (plus_three' 3 4 5);;
Printf.printf "\n%i \n" (plus_three' 3 4 5);;
