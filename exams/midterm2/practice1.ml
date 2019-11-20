open Common
open Plsolution
(* Leave these lines here! *)
(* Put code for let at the bottom, after removing the raise. *)
let rec freeVarsInExp exp =
  match exp with
    | VarExp x -> freeVarsInVarExp x freeVarsInExp
    | ConstExp c -> freeVarsInConstExp c freeVarsInExp
    | MonOpAppExp (m,e) -> freeVarsInMonOpAppExp (m,e) freeVarsInExp
    | BinOpAppExp (b,e1,e2) -> freeVarsInBinOpAppExp (b,e1,e2) freeVarsInExp
    | IfExp (e1,e2,e3) -> freeVarsInIfExp (e1,e2,e3) freeVarsInExp
    | FunExp (f,e) -> freeVarsInFunExp (f,e) freeVarsInExp
    | LetRecInExp (f,x,e1,e2) -> freeVarsInLetRecInExp (f,x,e1,e2) freeVarsInExp
    | LetInExp (x,e1,e2) -> freeVarsInLetInExp (x,e1,e2) freeVarsInExp
(* Remove the raise and put your code where the raise is now. *)
    | AppExp (e1,e2) ->
      let free_vars_e1 = freeVarsInExp e1 in
      let free_vars_e2 = freeVarsInExp e2 in
      free_vars_e1 @ free_vars_e2

(* *)
freeVarsInExp (AppExp(VarExp "f", VarExp "y"));;
