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
monOpApply HdOp (ListVal []);;
monOpApply TlOp (ListVal []);;

monOpApply IntNegOp (IntVal 2);;

eval_exp (MonOpAppExp(IntNegOp, ConstExp (IntConst 2)), []);;

(* 6 binOp *)
eval_exp (BinOpAppExp(IntPlusOp, ConstExp(IntConst(3)), ConstExp(IntConst(4))), []) ;;

(* 7 if *)
eval_exp (IfExp(ConstExp(BoolConst true), ConstExp(IntConst 1), ConstExp(IntConst 0)), []);;

(* 8 let-in *)
eval_exp (LetInExp ("y", ConstExp (IntConst 5), VarExp "y"), []);;

(* 9 functions -> Closures *)
eval_exp (FunExp ("x", VarExp "x"), []);;

(* 10 function application *)
eval_exp (AppExp (FunExp ("x", VarExp "x"), ConstExp (IntConst 7)), []);;

(* 11 recursive declaraions*)
eval_dec (LetRec ("even", "x",
IfExp (BinOpAppExp (EqOp, VarExp "x", ConstExp (IntConst 0)),
ConstExp (BoolConst true),
IfExp (BinOpAppExp (EqOp, VarExp "x", ConstExp (IntConst 1)),
ConstExp (BoolConst false),
AppExp (VarExp "even",
BinOpAppExp (IntMinusOp, VarExp "x", ConstExp (IntConst 2)))))), []);;

(* 15 explicit exceptions *)
eval_exp(RaiseExp (ConstExp (IntConst 1)),[]);;

(* 16 implicit div *)
eval_dec (Anon
(BinOpAppExp(IntDivOp, ConstExp (IntConst 4), ConstExp (IntConst 0))), []);;
