open Common;;
open Plsolution;;
(* PUT ANY HELPER FUNCTIONS YOU WANT UP HERE! *)

(* exp * memory -> value *)
let rec eval_exp (exp, m) =
  match exp with
    ConstExp t ->  eval_exp_ConstExp t m eval_exp
  | VarExp x   -> eval_exp_VarExp x m eval_exp 
  | AppExp(e1, e2) -> eval_exp_AppExp(e1, e2) m eval_exp
  | MonOpAppExp(monop, e1) -> eval_exp_MonOpAppExp(monop, e1) m eval_exp
  | BinOpAppExp(binop, e1, e2) -> 
   eval_exp_BinOpAppExp(binop, e1, e2) m eval_exp
  | LetRecInExp(f, x, e1, e2) ->
   eval_exp_LetRecInExp(f, x, e1, e2) m eval_exp
  | FunExp(x, e) -> eval_exp_FunExp(x, e) m eval_exp
  | IfExp(e1, e2, e3) -> eval_exp_IfExp(e1, e2, e3) m eval_exp 
  | RaiseExp e -> eval_exp_RaiseExp e m eval_exp
  | TryWithExp(e1, intopt1, exp1, match_list) ->
  eval_exp_TryWithExp(e1, intopt1, exp1, match_list) m eval_exp 

(* Put your code here: *)
| LetInExp(x, e1, e2)->
	let v1 = eval_exp (e1,m) in
	(* *)
	let new_mem = (x,v1)::m in
	let v2 = eval_exp (e2,new_mem) in v2



(* NOTE: DO NOT PUT YOUR CODE HERE!!! THIS IS THE WRONG FUNCTION! *)
(* This function is only to ficilitate your testing *)

(* dec * memory -> (string option * value) * memory *)
let eval_dec (dec, m) =
 (match dec with
    Anon e -> ((None, eval_exp (e, m)), m)
  | Let(x, e) -> (
    match eval_exp (e, m) with
      Exn i -> ((None, Exn i), m)
    | v     -> ((Some x, v), ins_mem m x v)
    )
  | LetRec(f, x, e) -> ((Some f, RecVarVal(f, x, e, m)), ins_mem m f (RecVarVal(f, x, e, m))))


(* NOTE: DO NOT PUT YOUR CODE HERE!!! THIS IS THE WRONG FUNCTION! *)
