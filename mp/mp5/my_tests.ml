(* 1 const_to_val *)
print_string "\n----> 1 const_to_val\n";;
const_to_val (IntConst 2);;

(* 2 Constats *)
print_string "\n----> 2 Constats\n";;
let const_exp_2 = ConstExp (IntConst 2);;
let empty_memory = [];;
eval_exp (const_exp_2, empty_memory);;

let anon_dec1 =  Anon(ConstExp(IntConst 2));;
eval_dec (anon_dec1, empty_memory);;

(* 3 Let Declaration *)
print_string "\n----> 3 Let Declaration\n";;
eval_dec (Let("x", ConstExp(IntConst 2)), []);;

(* 4 identifiers *)
print_string "\n----> 4 identifiers\n";;
eval_exp (VarExp "x", [("x", IntVal 2)]);;

(* 5 monOp *)
monOpApply IntNegOp (IntVal 2);;
eval_exp (MonOpAppExp(IntNegOp, ConstExp (IntConst 2)), []);;
