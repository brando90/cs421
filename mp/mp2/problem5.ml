(* *)
let e1 = VarExp "x" let e2 = VarExp "y" let e3 = VarExp "z";;
getAllVarsInExp e2;;
getAllVarsInExps [e1];;
getAllVarsInExps [e1;e2];; (* -> ["x"; "y"] *)
freshFor ["x"; "y"];;
freshFor (getAllVarsInExps [e1;e2]);;
let getFreshVariable lst = (freshFor (getAllVarsInExps lst));;
let get2 lst = (freshFor (getAllVarsInExps lst));;
let get lst = let l=getAllVarsInExps lst in (freshFor l);;
getFreshVariable [e1;e2];;

let ce1 = VarCPS( ContVarCPS(Kvar) , "a");;
getAllVarsInExpCPS ce1;;
let ce2 = VarCPS( ContVarCPS(Kvar) , "cy");;

getFreshVariable [e1;e2;e3] [ce1;ce2];;

(* *)

string_of_exp_cps (cps_exp (VarExp "x") (ContVarCPS Kvar));;
string_of_exp_cps (cps_exp (ConstExp (BoolConst true)) (ContVarCPS Kvar));;

string_of_exp_cps (cps_exp (IfExp (VarExp "b", ConstExp (IntConst 2),
ConstExp (IntConst 5)))
(ContVarCPS Kvar));;

string_of_exp_cps (cps_exp (AppExp (VarExp "f", VarExp "x"))
(ContVarCPS Kvar));;
