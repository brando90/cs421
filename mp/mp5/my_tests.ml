(* tests: const_to_val*)
const_to_val (IntConst 2);;

(* 2 Constats *)
let const_exp_2 = ConstExp (IntConst 2);;
let empty_memory = [];;
eval_exp (const_exp_2, empty_memory);;

let anon_dec1 =  Anon(ConstExp(IntConst 2));;
eval_dec (anon_dec1, empty_memory);;

(* 3 Let Declaration *)
eval_dec (Let("x", ConstExp(IntConst 2)), []);;

(* 4 identifiers *)
eval_exp (VarExp "x", [("x", IntVal 2)]);;
