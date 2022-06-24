(* CS421 - Fall 2017
 * gather_exp_ty_substitution_fun
 *)


open Common
open Plsolution

(* type_env -> exp -> monoTy -> (proof * substitution) option *)
let rec gather_exp_ty_substitution gamma exp tau =
    let judgment = ExpJudgment(gamma, exp, tau) in
    match exp
    with ConstExp c ->
         let tau' = const_signature c in
         (match unify [(tau, freshInstance tau')]
          with None       -> None
             | Some sigma -> Some(Proof([],judgment), sigma))
      | VarExp x -> gather_exp_ty_substitution_VarExp x gamma tau gather_exp_ty_substitution
      | MonOpAppExp (monop, e1) ->
            gather_exp_ty_substitution_MonOpAppExp (monop, e1) gamma tau gather_exp_ty_substitution
      | IfExp (e1, e2, e3) -> gather_exp_ty_substitution_IfExp (e1, e2, e3) gamma tau gather_exp_ty_substitution
      | BinOpAppExp (binop, e1, e2)->
            gather_exp_ty_substitution_BinOpAppExp (binop, e1, e2) gamma tau gather_exp_ty_substitution
      | AppExp (e1, e2) -> gather_exp_ty_substitution_AppExp (e1, e2) gamma tau gather_exp_ty_substitution
      | RaiseExp e -> gather_exp_ty_substitution_RaiseExp e gamma tau gather_exp_ty_substitution 
      | LetInExp (x, e1, e2) -> gather_exp_ty_substitution_LetInExp (x, e1, e2) gamma tau gather_exp_ty_substitution 
      | LetRecInExp (f, x, e1, e2) ->
            gather_exp_ty_substitution_LetRecInExp (f, x, e1, e2) gamma tau gather_exp_ty_substitution 
      | TryWithExp (e, intopt1, e1, match_list) ->
            gather_exp_ty_substitution_TryWithExp (e, intopt1, e1, match_list) gamma tau gather_exp_ty_substitution 

      | FunExp (x, e) ->
	let tau1 = fresh () in
	let tau2 = fresh () in
	(* let x_tau1_gamma = make_env x tau1 in *)
	let x_tau1_plus_gamma = ins_env gamma x tau1 in
	let some_sigma = gather_exp_ty_substitution x_tau1_plus_gamma e tau2 in
	( match some_sigma with
	| None -> None
	| Some (proof,sigma) ->
	let 
	)