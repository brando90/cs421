open Common
open Plsolution
(*
A substitution phi, when lifted, replaces all the type variables occuring in its
input type with the corresponding types.
*)

let rec do_subs sigma ty =
  match sigma with
  | [] -> TyVar ty
  | s::sigma' ->
    match s with
    | (type_var_name,actual_type) ->
      if type_var_name=ty then actual_type
      else do_subs sigma' ty;;

(*
A substitution phi, when lifted, replaces all the type variables occuring in its input type with the corresponding types.
val monoTy_lift_subst : (typeVar * monoTy) list -> monoTy -> monoTy =
*)
let rec monoTy_lift_subst sigma mono_ty =
match mono_ty with
  | TyVar ty_v -> do_subs sigma ty_v
  | TyConst (name_ty_const, list_mono_ty) ->
  TyConst(name_ty_const , monoTy_lift_list_tys sigma list_mono_ty)
and monoTy_lift_list_tys sigma list_mono_tys =
  match list_mono_tys with
  | [] -> []
  | mono_ty_x::list_mono_ty_xs ->
    (monoTy_lift_subst sigma mono_ty_x)::(monoTy_lift_list_tys sigma list_mono_ty_xs)
;;

let phi = [(5, mk_fun_ty bool_ty (TyVar(2)))];;
let tau = (TyConst ("->", [TyVar 1; TyVar 5]));;
monoTy_lift_subst phi tau;;
(*
- : monoTy = TyConst ("->", [TyVar 1; TyConst ("->", [TyConst ("bool", []); TyVar 2])])
*)
let x = TyVar 5;;
monoTy_lift_subst phi x;;
(*
- : monoTy = TyConst ("->", [TyConst ("bool", []); TyVar 2])
*)
let lifted_sub = momoTy_lift subst phi;;
(* val lifted_sub : monoTy -> monoTy = <fun> *)
