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
      | FunExp (x, e) ->
        (* create gamma_e *)
        let tau1 = fresh () in
        let gamma_e = ins_env gamma x (polyTy_of_monoTy tau1) in
        (* sigma *)
        let tau2 = fresh () in
        let some_proof_sigma = gather_exp_ty_substitution gamma_e e tau2 in
        (
          match some_proof_sigma with
            | None -> None
            | Some proof_sigma ->
            (
              match proof_sigma with
                | (proof, sigma) ->
                  (* return value *)
                  let sigma_tau = monoTy_lift_subst sigma tau in
                  let tau1_to_tau2 = mk_fun_ty tau1 tau2 in
                  let sigma_tau1_to_tau2 = monoTy_lift_subst sigma tau1_to_tau2 in
                  let some_unified_guess_with_fun_ty = unify [(sigma_tau, sigma_tau1_to_tau2)] in
                  (
                    match some_unified_guess_with_fun_ty with
                      | None -> None
                      | Some sigma' ->
                        let sigma_fun = subst_compose sigma' sigma in
                        Some( Proof([proof], judgment), sigma_fun)
                    )
              )
          )
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
      | LetInExp (x, e1, e2) ->
        let tau1 = fresh () in (* create fresh type variable for e1 to be infered later *)
        let some_proof_sigma_e1 = gather_exp_ty_substitution gamma e1 tau1 in
        (
          match some_proof_sigma_e1 with
            | None -> None
            | Some proof_sigma_e1 ->
              (
                match proof_sigma_e1 with
                  | (proof_e1,sigma_e1) ->
                    (* Some( Proof([proof_e1], judgment), sigma_e1) *)
                    (* get tau_x *)
                    let sigma1_gamma = env_lift_subst sigma_e1 gamma in
                    let sigma1_tau1 = monoTy_lift_subst sigma_e1 tau1 in
                    let tau_x = gen sigma1_gamma sigma1_tau1 in
                    (* get gamma_e *)
                    let gamma_e = ins_env sigma1_gamma x tau_x in
                    (* get sigma_e2 *)
                    let sigma1_tau = monoTy_lift_subst sigma_e1 tau in
                    let some_proof_sigma_e2 = gather_exp_ty_substitution gamma_e e2 sigma1_tau in
                    (* Some( Proof([proof_e1], judgment), sigma_e1) *)
                     (
                       match some_proof_sigma_e2 with
                        | None -> None
                        | Some proof_sigma_e2 ->
                          (* Some( Proof([proof_e1], judgment), sigma_e1) *)
                        (
                          match proof_sigma_e2 with
                            | proof_e2, sigma_e2 ->
                              (* Some( Proof([proof_e1], judgment), sigma_e1) *)
                              let sigma2_sigma1 = subst_compose sigma_e2 sigma_e1 in
                              Some( Proof([proof_e1;proof_e2], judgment), sigma2_sigma1)
                          )
                    )
                )
          )
      | TryWithExp (e, intopt1, e1, match_list) ->
            gather_exp_ty_substitution_TryWithExp (e, intopt1, e1, match_list) gamma tau gather_exp_ty_substitution
      | LetRecInExp (f, x, e1, e2) ->
            gather_exp_ty_substitution_LetRecInExp (f, x, e1, e2) gamma tau gather_exp_ty_substitution





(* *)
