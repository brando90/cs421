(* CS421 - Fall 2017
 * gather_exp_ty_substitution_ifthenelse
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
      | BinOpAppExp (binop, e1, e2) ->
            gather_exp_ty_substitution_BinOpAppExp (binop, e1, e2) gamma tau gather_exp_ty_substitution
      | FunExp (x, e) -> gather_exp_ty_substitution_FunExp (x, e) gamma tau gather_exp_ty_substitution
      | AppExp (e1, e2) -> gather_exp_ty_substitution_AppExp (e1, e2) gamma tau gather_exp_ty_substitution
      | RaiseExp e -> gather_exp_ty_substitution_RaiseExp e gamma tau gather_exp_ty_substitution
      | LetInExp (x, e1, e2) -> gather_exp_ty_substitution_LetInExp (x, e1, e2) gamma tau gather_exp_ty_substitution
      | LetRecInExp (f, x, e1, e2) ->
            gather_exp_ty_substitution_LetRecInExp (f, x, e1, e2) gamma tau gather_exp_ty_substitution
      | TryWithExp (e, intopt1, e1, match_list) ->
            gather_exp_ty_substitution_TryWithExp (e, intopt1, e1, match_list) gamma tau gather_exp_ty_substitution

      | IfExp(e1,e2,e3) -> 
	let some_sigma1_proof1 = gather_exp_ty_substitution gamma e1 bool_ty in
	( match some_sigma1_proof1 with
	| None -> None
	| Some (proof1,sigma1) ->
	let sigma1_gamma = env_lift_subst sigma1 gamma in
	let sigma1_tau_monoty = monoTy_lift_subst sigma1 tau in
	let some_sigma2_proof2 = gather_exp_ty_substitution sigma1_gamma e2 sigma1_tau_monoty in
		( match some_sigma2_proof2 with
		| None -> None
		| Some (proof2,sigma2) -> 
		let sigma2_sigma1 = subst_compose sigma2 sigma1 in
		let sigma2_sigma1_gamma = env_lift_subst sigma2_sigma1 gamma in
		let sigma2_sigma1_tau = monoTy_lift_subst sigma2_sigma1 tau in
		let some_sigma3_proof3 = gather_exp_ty_substitution sigma2_sigma1_gamma e3 sigma2_sigma1_tau in
		( match some_sigma3_proof3 with
		| None -> None
		| Some (proof3,sigma3) -> 
		let sigma3_sigma2_sigma1 = subst_compose sigma3 sigma2_sigma1 in 
		Some( Proof([proof1;proof2;proof3],judgment), sigma3_sigma2_sigma1 )
				)	
			)
	)
