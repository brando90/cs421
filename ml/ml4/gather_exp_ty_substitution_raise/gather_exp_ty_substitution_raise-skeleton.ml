(* CS421
 * gather_exp_ty_substitution_app
 *)


open Common
open Plsolution

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
      | FunExp (x, e) -> gather_exp_ty_substitution_FunExp (x, e) gamma tau gather_exp_ty_substitution
      | BinOpAppExp (binop, e1, e2)->
            gather_exp_ty_substitution_BinOpAppExp (binop, e1, e2) gamma tau gather_exp_ty_substitution
      | AppExp (e1, e2) -> gather_exp_ty_substitution_AppExp (e1, e2) gamma tau gather_exp_ty_substitution
      | RaiseExp e -> raise (Failure "Not implemented yet")
      | LetInExp (x, e1, e2) -> gather_exp_ty_substitution_LetInExp (x, e1, e2) gamma tau gather_exp_ty_substitution 
      | TryWithExp (e, intopt1, e1, match_list) ->
            gather_exp_ty_substitution_TryWithExp (e, intopt1, e1, match_list) gamma tau gather_exp_ty_substitution 
      | LetRecInExp (f, x, e1, e2) ->
            gather_exp_ty_substitution_LetRecInExp (f, x, e1, e2) gamma tau gather_exp_ty_substitution

