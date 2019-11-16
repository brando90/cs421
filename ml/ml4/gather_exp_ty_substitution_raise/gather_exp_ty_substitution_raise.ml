(* CS421
 * gather_exp_ty_substitution_app
 *)

open Common
open Plsolution

let rec gather_exp_ty_substitution gamma exp tau =
    let judgment = ExpJudgment(gamma, exp, tau) in
    match exp with
      | ConstExp c -> (* Gamma |- c:tau | unify (tau, freshInstance tau') *)
         let tau' = const_signature c in
         (match unify [(tau, freshInstance tau')] with
             | None       -> None
             | Some sigma -> Some(Proof([],judgment), sigma))
      | VarExp x -> gather_exp_ty_substitution_VarExp x gamma tau gather_exp_ty_substitution
      | MonOpAppExp (monop, e1) ->
          let tau1 = fresh () in (* create fresh type variable for e1 to be infered later *)
          let some_proof_sigma_e1 = gather_exp_ty_substitution gamma e1 tau1 in (* some_sigma = Gamma |- e1: tau1 *)
          (
            match some_proof_sigma_e1 with
              | None -> None
              | Some proof_sigma_e1 -> ( match proof_sigma_e1 with
                | (proof_e1,sigma_e1) -> (* sigma = Gamma |- e1: tau1 *)
                  (* mon op judgement here *)
                  let tau' = monop_signature monop in
                  let sig_tau1_2_tau2 = monoTy_lift_subst sigma_e1 (mk_fun_ty tau1 tau) in
                  let some_sigma' = unify [(sig_tau1_2_tau2, freshInstance tau')] in
                  ( match some_sigma' with
                    | None -> None
                    | Some sigma' ->
                      let sigma'_sigma = subst_compose sigma' sigma_e1 in
                      Some( Proof([proof_e1],judgment), sigma'_sigma)
                    )
                )
            )
      | IfExp (e1, e2, e3) -> gather_exp_ty_substitution_IfExp (e1, e2, e3) gamma tau gather_exp_ty_substitution
      | FunExp (x, e) -> gather_exp_ty_substitution_FunExp (x, e) gamma tau gather_exp_ty_substitution
      | BinOpAppExp (binop, e1, e2)->
            gather_exp_ty_substitution_BinOpAppExp (binop, e1, e2) gamma tau gather_exp_ty_substitution
      | AppExp (e1, e2) -> gather_exp_ty_substitution_AppExp (e1, e2) gamma tau gather_exp_ty_substitution
      | RaiseExp e ->
        let some_proof_sigma_e = gather_exp_ty_substitution gamma e int_ty in
          (match some_proof_sigma_e with
            | None -> None
            | Some proof_sigma_e -> ( match proof_sigma_e with
              | (proof_e,sigma_e) -> Some( Proof([proof_e], judgment), sigma_e)
              )
            )
      | LetInExp (x, e1, e2) -> gather_exp_ty_substitution_LetInExp (x, e1, e2) gamma tau gather_exp_ty_substitution
      | TryWithExp (e, intopt1, e1, match_list) ->
            gather_exp_ty_substitution_TryWithExp (e, intopt1, e1, match_list) gamma tau gather_exp_ty_substitution
      | LetRecInExp (f, x, e1, e2) ->
            gather_exp_ty_substitution_LetRecInExp (f, x, e1, e2) gamma tau gather_exp_ty_substitution
