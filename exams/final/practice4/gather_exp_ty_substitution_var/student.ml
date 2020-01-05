(* CS 421
 * gather_exp_ty_substitution_var
 *)


open Common
open Plsolution

(*
type ’a env = (string * ’a) list

type type_env = polyTy env

which ends up being:
type polyTy env = (string * polyTy) list
*)

(* type env -> exp -> monoTy -> (proof * substitution) option *)
let rec gather_exp_ty_substitution gamma exp tau =
    let judgment = ExpJudgment(gamma, exp, tau) in
    match exp
    with ConstExp c ->
         let tau' = const_signature c in
         (match unify [(tau, freshInstance tau')]
          with None       -> None
             | Some sigma -> Some(Proof([],judgment), sigma))
      | MonOpAppExp (monop, e1) ->
            gather_exp_ty_substitution_MonOpAppExp (monop, e1) gamma tau gather_exp_ty_substitution
      | IfExp (e1, e2, e3) -> gather_exp_ty_substitution_IfExp (e1, e2, e3) gamma tau gather_exp_ty_substitution
      | BinOpAppExp (binop, e1, e2)->
            gather_exp_ty_substitution_BinOpAppExp (binop, e1, e2) gamma tau gather_exp_ty_substitution
      | FunExp (x, e) -> gather_exp_ty_substitution_FunExp (x, e) gamma tau gather_exp_ty_substitution
      | AppExp (e1, e2) -> gather_exp_ty_substitution_AppExp (e1, e2) gamma tau gather_exp_ty_substitution
      | RaiseExp e -> gather_exp_ty_substitution_RaiseExp e gamma tau gather_exp_ty_substitution
      | LetInExp (x, e1, e2) -> gather_exp_ty_substitution_LetInExp (x, e1, e2) gamma tau gather_exp_ty_substitution
      | LetRecInExp (f, x, e1, e2) ->
            gather_exp_ty_substitution_LetRecInExp (f, x, e1, e2) gamma tau gather_exp_ty_substitution
      | TryWithExp (e, intopt1, e1, match_list) ->
            gather_exp_ty_substitution_TryWithExp (e, intopt1, e1, match_list) gamma tau gather_exp_ty_substitution
      | VarExp x ->
        let some_ty_gamma_x = lookup_env gamma x in
        ( match some_ty_gamma_x with
            | None -> None
            | Some ty_gamma_x ->
              let tau_x = freshInstance ty_gamma_x in
              let some_subs = unify [ (tau, tau_x) ] in
              ( match some_subs with
                  | None -> None
                  | Some sub ->
                    Some( Proof([],judgment), sub )
                )
          )
