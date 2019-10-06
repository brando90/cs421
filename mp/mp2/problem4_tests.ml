
(* just a variable *)

freeVarsInExp (VarExp "x");;
List.length (freeVarsInExp (ConstExp (StringConst "hi")));;
freeVarsInExp (MonOpAppExp(IntNegOp, VarExp "x"));;
freeVarsInExp (BinOpAppExp(IntTimesOp, VarExp "x", ConstExp(IntConst 3)));;
freeVarsInExp (IfExp(ConstExp (BoolConst true), VarExp "x", VarExp "y"));;
freeVarsInExp (AppExp(VarExp "f", VarExp "y"));;
freeVarsInExp (LetInExp("x", VarExp "y", VarExp "x"));;
