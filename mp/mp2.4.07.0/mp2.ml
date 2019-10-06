(* File: ml3.ml *)

open Common

Printf.printf "Hi \n";;
(* Problem 1 *)
let tuple_to_pico_tuple t =
match t with
| v1,v2 -> BinOpAppExp( CommaOp, ConstExp( IntConst(v1)), ConstExp( IntConst(v2)));;

let rec import_list lst =
match lst with
| [] -> ConstExp( NilConst )
| x::xs -> BinOpAppExp( ConsOp,  tuple_to_pico_tuple x, import_list xs );;

(* Problem 2 *)
let f = VarExp("pair_sums");;
let x = VarExp("lst");;
let b = BinOpAppExp(EqOp,VarExp("lst"),ConstExp(NilConst));;
let t1 = ConstExp(NilConst);;
let p1 = MonOpAppExp(HdOp,VarExp("lst"));;
let a1 = BinOpAppExp(IntPlusOp, MonOpAppExp(FstOp,VarExp("x")), MonOpAppExp(SndOp,VarExp("x")) );;
let a2 = AppExp(f,AppExp(VarExp("tl"),VarExp("lst")));;
let p2 = BinOpAppExp(ConsOp,a1,a2);;
let t2 = LetInExp("x",p1,p2);;
let e1 = IfExp(b,t1,t2);;
let e2 = AppExp(f, import_list [(7,1);(4,2);(6,3)] );;

let pair_sums = LetRecInExp("pair_sums","lst",e1,e2);;

Printf.printf "\n\n\n";;
let ans = "let rec pair_sums lst = if lst = [] then [] else let x = hd lst in ((fst x) + (snd x)) :: (pair_sums (tl lst)) in pair_sums (((7,1)) :: (((4,2)) :: (((6,3)) :: [])))";;

let my_ans = (string_of_exp pair_sums);;
ans = my_ans;;

(* Problem 3 *)
let rec count_const_in_exp exp =
match exp with
| VarExp s -> 0
| ConstExp c -> 1
| MonOpAppExp (mon_op, exp) -> count_const_in_exp exp
| BinOpAppExp (bin_op, exp1, exp2) -> (count_const_in_exp exp1) + (count_const_in_exp exp2)
| IfExp (exp1, exp2, exp3) -> (count_const_in_exp exp1) + (count_const_in_exp exp2) + (count_const_in_exp exp3)
| AppExp (exp1, exp2) -> (count_const_in_exp exp1) + (count_const_in_exp exp2)
| FunExp (s, exp) -> (count_const_in_exp exp)
| LetInExp (s, exp1, exp2) -> (count_const_in_exp exp1) + (count_const_in_exp exp2)
| LetRecInExp (s1, s2, exp1, exp2) -> (count_const_in_exp exp1) + (count_const_in_exp exp2)
;;

(* Problem 4 *)
let rec remove_var var lst =
match lst with
| [] -> []
| x::xs -> if x=var then remove_var var xs else x::(remove_var var xs)
;;

let rec freeVarsInExp exp =
match exp with
| VarExp s -> [s]
| ConstExp c -> []
| MonOpAppExp (mon_op, exp) -> freeVarsInExp exp
| BinOpAppExp (bin_op, exp1, exp2) -> (freeVarsInExp exp1) @ (freeVarsInExp exp2)
| IfExp (exp1, exp2, exp3) -> (freeVarsInExp exp1) @ (freeVarsInExp exp2) @ (freeVarsInExp exp3)
| AppExp (exp1, exp2) -> (freeVarsInExp exp1) @ (freeVarsInExp exp2)
| FunExp (s, exp) -> remove_var s (freeVarsInExp exp)
| LetInExp (s, exp1, exp2) -> (freeVarsInExp exp1) @ (remove_var s (freeVarsInExp exp2))
| LetRecInExp (f, x, exp1, exp2) -> (remove_var x (remove_var f (freeVarsInExp exp1))) @ (remove_var f (freeVarsInExp exp2))
;;

(* Problem 5 *)
let rec getAllVarsInExp exp =
match exp with
| VarExp s -> [s]
| ConstExp c -> []
| MonOpAppExp (mon_op, exp) -> getAllVarsInExp exp
| BinOpAppExp (bin_op, exp1, exp2) -> (getAllVarsInExp exp1) @ (getAllVarsInExp exp2)
| IfExp (exp1, exp2, exp3) -> (getAllVarsInExp exp1) @ (getAllVarsInExp exp2) @ (getAllVarsInExp exp3)
| AppExp (exp1, exp2) -> (getAllVarsInExp exp1) @ (getAllVarsInExp exp2)
| FunExp (s, exp) -> (getAllVarsInExp exp)
| LetInExp (s, exp1, exp2) -> (getAllVarsInExp exp1) @ (getAllVarsInExp exp2)
| LetRecInExp (f, x, exp1, exp2) -> (getAllVarsInExp exp1) @ (getAllVarsInExp exp2)
;;

let rec getAllVarsInExps exps =
match exps with
| [] -> []
| x::xs -> (getAllVarsInExp x) @ (getAllVarsInExps xs)
;;

let rec getAllVarsInExpCPS cont =
match cont with
| VarCPS (k, x) -> x :: getAllVarsInContCPS k
| ConstCPS (k, c) -> getAllVarsInContCPS k
| MonOpAppCPS (k,m,s) -> s :: getAllVarsInContCPS k
| BinOpAppCPS (k,b,r,s) -> r :: s :: getAllVarsInContCPS k
| IfCPS (r,e1,e2) -> r :: ((getAllVarsInExpCPS e1) @ (getAllVarsInExpCPS e2))
| AppCPS (k,x1,x2) -> x1::x2::(getAllVarsInContCPS k)
| FunCPS (k,x,Kvar,e) -> (getAllVarsInContCPS k) @ (getAllVarsInExpCPS e)
| FixCPS (k,f,x,Kvar,e) -> (getAllVarsInContCPS k) @ (getAllVarsInExpCPS e)
  and
getAllVarsInContCPS k =
match k with
| External -> []
| ContVarCPS _ -> []
| FnContCPS (x, e) -> x::(getAllVarsInExpCPS e)

let rec getAllVarsInExpCPSs cexps =
match cexps with
| [] -> []
| x::xs -> (getAllVarsInExpCPS x) @ (getAllVarsInExpCPSs xs)
;;

let rec getAllVarsInContCPSs ks =
match ks with
| [] -> []
| k::tail_ks -> (getAllVarsInContCPS k) @ (getAllVarsInContCPSs tail_ks)
;;

let getFreshVariable exps cexps ks  = (freshFor ((getAllVarsInExps exps)@(getAllVarsInExpCPSs cexps)@(getAllVarsInContCPSs ks) ) );;

let cps_exp_dd = VarCPS(ContVarCPS(Kvar) , "s");;
let cps_cont_dd = FnContCPS("s", cps_exp_dd);;

let rec cps_exp e k = (* cps_exp: exp -> cps_cont -> exp_cps *)
match e with
| VarExp v -> VarCPS(k,v)
| ConstExp c -> ConstCPS(k,c)
| MonOpAppExp (mon_op, e) -> let v=getFreshVariable [] [] [k] in
  cps_exp e (FnContCPS(v, MonOpAppCPS(k,mon_op,v)) )
| BinOpAppExp (bin_op, e1, e2) -> let v2=getFreshVariable [e1] [] [k] in let v1=getFreshVariable [VarExp(v2)] [] [k] in
  cps_exp e2 (FnContCPS(v2, cps_exp e1 (FnContCPS(v1, BinOpAppCPS(k,bin_op,v1,v2))) ) )
| IfExp (e1, e2, e3) -> let v=getFreshVariable [e1;e2;e3] [] [k] in
  cps_exp e1 (FnContCPS(v, IfCPS(v, cps_exp e2 k, cps_exp e3 k) ))
| AppExp (e1, e2) -> let v2=getFreshVariable [e1] [] [k] in let v1=getFreshVariable [VarExp(v2)] [] [k] in
  cps_exp e2 (FnContCPS(v2, (cps_exp e1 (FnContCPS(v1, AppCPS(k,v1,v2))) ) ) )
| FunExp (x, exp) -> FunCPS(k,x,Kvar,cps_exp exp (ContVarCPS(Kvar)))
| LetInExp (x, e1, e2) -> cps_exp e1 (FnContCPS(x, cps_exp e2 k ))
| LetRecInExp (f, x, e1, e2) -> FixCPS(FnContCPS(f, cps_exp e2 k),f,x,Kvar, cps_exp e1 (ContVarCPS(Kvar)) )
;;
