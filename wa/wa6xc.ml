(* *)

let repeat = fun f -> (fun x -> f (f x));;
let rr = (repeat repeat) (fun y -> y + 1);;

let repeat = fun f -> (fun x -> f (f x)) in (repeat repeat) (fun y -> y + 1);;

(* it does return 4 *)
let repeat = fun f -> (fun x -> f (f x)) in (repeat repeat) (fun y -> y + 1) 0;;
