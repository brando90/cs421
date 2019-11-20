(* CS421 - Fall 2017
 * app
 *
 * Please keep in mind that there may be more than one
 * way to solve a problem.  You may want to change how this starts.
 *)

open Common
open Plsolution

(* Problem 4 *)
let rec freeVarsInExp exp =
  match exp
  with VarExp x -> freeVarsInVarExp x freeVarsInExp
    | ConstExp c -> freeVarsInConstExp c freeVarsInExp
    | MonOpAppExp (m,e) -> freeVarsInMonOpAppExp (m,e) freeVarsInExp
    | BinOpAppExp (b,e1,e2) -> freeVarsInBinOpAppExp (b,e1,e2) freeVarsInExp
    | IfExp (e1,e2,e3) -> freeVarsInIfExp (e1,e2,e3) freeVarsInExp
    | FunExp (f,e) -> freeVarsInFunExp (f,e) freeVarsInExp
    | LetRecInExp (f,x,e1,e2) -> freeVarsInLetRecInExp (f,x,e1,e2) freeVarsInExp
    | LetInExp (x,e1,e2) -> freeVarsInLetInExp (x,e1,e2) freeVarsInExp
(* Remove the raise and put your code where it is now. *) 
    | AppExp (e1,e2) -> raise(Failure "Not implemented yet")
