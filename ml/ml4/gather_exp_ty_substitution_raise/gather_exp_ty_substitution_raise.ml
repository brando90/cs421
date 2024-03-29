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
      | VarExp x ->
        let some_tau_gamma_x = lookup_env gamma x in
        (
          match some_tau_gamma_x with
            | None -> None
            | Some tau_gamma_x ->
            let tau_x = freshInstance (tau_gamma_x) in
              (match unify [(tau, tau_x)] with
                | None -> None
                | Some sigma -> Some( Proof([], judgment), sigma )
                )
          )
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
      | IfExp (e1, e2, e3) ->
        let some_proof_sigma_e1 = gather_exp_ty_substitution gamma e1 bool_ty in
        (
          match some_proof_sigma_e1 with
            | None -> None
            | Some proof_sigma_e1 ->
              (
                match proof_sigma_e1 with
                  | (proof1,sigma1) ->
                    let sigma1_gamma = env_lift_subst sigma1 gamma in
                    let sigma1_tau = monoTy_lift_subst sigma1 tau in
                    let some_proof_sigma_e2 = gather_exp_ty_substitution sigma1_gamma e2 sigma1_tau in
                    (
                      match some_proof_sigma_e2 with
                        | None -> None
                        | Some proof_sigma_e2 ->
                        (
                          match proof_sigma_e2 with
                            | (proof2,sigma2) ->
                              let sigma2_sigma1 = subst_compose sigma2 sigma1 in
                              let sigma2_sigma1_gamma = env_lift_subst sigma2_sigma1 gamma in
                              let sigma2_sigma1_tau = monoTy_lift_subst sigma2_sigma1 tau in
                              let some_proof_sigma_e3 = gather_exp_ty_substitution sigma2_sigma1_gamma e3 sigma2_sigma1_tau in
                              (
                                match some_proof_sigma_e3 with
                                  | None -> None
                                  | Some proof_sigma_e3 ->
                                  (
                                    match proof_sigma_e3 with
                                      | (proof3,sigma3) ->
                                        let sigma_if_exp = subst_compose sigma3 sigma2_sigma1 in
                                        Some( Proof([proof1;proof2;proof3], judgment), sigma_if_exp)
                                    )
                                )
                          )
                      )
                )
          )
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
            let tau1 = fresh () in
            let some_proof_sigma_e1 = gather_exp_ty_substitution gamma e1 tau1 in
            (
              match some_proof_sigma_e1 with
                | None -> None
                | Some proof_sigma_e1 ->
                (
                  match proof_sigma_e1 with
                    | (proof1,sigma1) ->
                      let sigma1_gamma = env_lift_subst sigma1 gamma in
                      let tau2 = fresh () in
                      let some_proof_sigma_e2 = gather_exp_ty_substitution sigma1_gamma e2 tau2 in
                      (
                        match some_proof_sigma_e2 with
                          | None -> None
                          | Some proof_sigma_e2 ->
                          (
                            match proof_sigma_e2 with
                              | (proof2,sigma2) ->
                                let tau' = binop_signature binop in
                                let tau' = freshInstance tau' in
                                let sigma2_sigma1 = subst_compose sigma2 sigma1 in
                                let tau2_to_tau = mk_fun_ty tau2 tau in
                                let tau1_to_tau2_to_tau = mk_fun_ty tau1 tau2_to_tau in
                                let s2_s1_t1_t2_t = monoTy_lift_subst sigma2_sigma1 tau1_to_tau2_to_tau in
                                let some_unified = unify [(s2_s1_t1_t2_t, tau')] in
                                (
                                  match some_unified with
                                    | None -> None
                                    | Some unified_sigma ->
                                    let unisigma_sigma2_sigma1 = subst_compose unified_sigma sigma2_sigma1 in
                                    Some( Proof([proof1;proof2], judgment), unisigma_sigma2_sigma1)
                                  )
                            )
                        )
                  )
              )
      | AppExp (e1, e2) ->
        let tau1 = fresh () in
        let tau1_to_tau = mk_fun_ty tau1 tau in
        let some_proof_sigma_e1 = gather_exp_ty_substitution gamma e1 tau1_to_tau in
          (
            match some_proof_sigma_e1 with
              | None -> None
              | Some proof_sigma_e1 ->
                (
                  match proof_sigma_e1 with
                    | (proof1,sigma1) ->
                      let sigma1_gamma = env_lift_subst sigma1 gamma in
                      let sigma1_tau1 = monoTy_lift_subst sigma1 tau1 in
                      let some_proof_sigma_e2 = gather_exp_ty_substitution sigma1_gamma e2 sigma1_tau1 in
                      (
                        match some_proof_sigma_e2 with
                          | None -> None
                          | Some proof_sigma_e2 ->
                          (
                            match proof_sigma_e2 with
                              | (proof2,sigma2) ->
                                let sigma2_sigma1 = subst_compose sigma2 sigma1 in
                                Some( Proof([proof1;proof2],judgment), sigma2_sigma1)
                            )
                        )
                  )
            )
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
            (* gather_exp_ty_substitution_LetRecInExp (f, x, e1, e2) gamma tau gather_exp_ty_substitution *)
            let tau1 = fresh () in
            let tau2 = fresh () in
            let gamma' = ins_env gamma x (polyTy_of_monoTy tau1) in
            let tau1_to_tau2 = mk_fun_ty tau1 tau2 in
            let gamma' = ins_env gamma' f (polyTy_of_monoTy tau1_to_tau2) in
            let some_proof_sigma_e1 = gather_exp_ty_substitution gamma' e1 tau2 in
              (
                match some_proof_sigma_e1 with
                  | None -> None
                  | Some proof_sigma_e1 ->
                    (
                      match proof_sigma_e1 with
                        | (proof1,sigma1) ->
                          let sigma1_gamma = env_lift_subst sigma1 gamma in
                          let sigma1_tau1_to_tau2 = monoTy_lift_subst sigma1 tau1_to_tau2 in
                          let gen_ty = gen sigma1_gamma sigma1_tau1_to_tau2 in
                          let gamma'' = ins_env sigma1_gamma f gen_ty in
                          let sigma1_tau = monoTy_lift_subst sigma1 tau in
                          let some_proof_sigma_e2 = gather_exp_ty_substitution gamma'' e2 sigma1_tau in
                          (
                            match some_proof_sigma_e2 with
                              | None -> None
                              | Some proof_sigma_e2 ->
                              (
                                match proof_sigma_e2 with
                                  | (proof2,sigma2) ->
                                    let sigma2_sigma1 = subst_compose sigma2 sigma1 in
                                    Some( Proof([proof1;proof2], judgment), sigma2_sigma1)
                                )
                            )
                      )
                )






(* *)
