(* File: one_step_exp_cps_eval.ml *)

open Common
open Plsolution

(* cps_env_entry list -> cps_cont -> value -> step_result *)
let app_cont_to_value = app_cont_to_value (* Provided *)

(* cps_env_entry list -> exp_cps -> step_result  *)
let rec one_step_exp_cps_eval env exp_cps = 
  match exp_cps with
    ConstCPS (k,c) ->
     one_step_exp_cps_eval_const env k c app_cont_to_value one_step_exp_cps_eval
  | VarCPS(k, x) ->
     one_step_exp_cps_eval_var env k x app_cont_to_value one_step_exp_cps_eval
  | MonOpAppCPS (k, monop, x, ke) ->
     one_step_exp_cps_eval_monop env k monop x ke app_cont_to_value one_step_exp_cps_eval
  | BinOpAppCPS (k, binop, x, y, ke) -> 
     one_step_exp_cps_eval_binop env k binop x y ke app_cont_to_value one_step_exp_cps_eval
  | IfCPS (b, e1, e2) ->
     one_step_exp_cps_eval_if env b e1 e2 app_cont_to_value one_step_exp_cps_eval
  | FunCPS (k, x, Kvar, i, ecps) ->
     one_step_exp_cps_eval_fun env k x i ecps app_cont_to_value one_step_exp_cps_eval
  | AppCPS (k, f, x, ke) ->
     one_step_exp_cps_eval_app env k f x ke app_cont_to_value one_step_exp_cps_eval
  | FixCPS (k, f, x, Kvar, i, ecps) ->
	let cps_rec_closure = CPSRecClosureVal(f,x,Kvar,i,ecps, env) in
	app_cont_to_value env k cps_rec_closure
