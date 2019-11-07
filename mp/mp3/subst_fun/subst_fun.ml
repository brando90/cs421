open Common

(* Type Variable exampme *)

type typeVar = int;;
let alpha = (2 : typeVar);;

(* Monomorphic Type example *)

type monoTy =
  | TyVar of typeVar
  | TyConst of (string * monoTy list);;

let int_ty = TyConst("int",[]);;
let pair_ints_ty = TyConst("*",[int_ty,int_ty])

let mk_fun_ty ty1 ty2 = TyConst("->",[ty1, ty2]);;

let f_int_2_int_ty = mk_fun_ty int_ty int_ty;;

(* let beta *)


(*
substitutions = (typeVar, monoTy)
typeVar = index/name of the type variable
monoTy = the type that should be substituted for that type variable
*)

let phi = [(5:typeVar), mk_fun_ty bool_ty (TyVar(2))];;

let rec do_subs sigma ty =
  match sigma with
  | [] -> TyVar ty
  | s::sigma' ->
    match s with
    | (type_var_name,actual_type) ->
      if type_var_name=ty then actual_type
      else do_subs sigma' ty;;

(* do_subs phi 1;; (* should return 2*)
do_subs phi 5;; (* should return the bool->2*) *)

(*
given a substitution, return the function it represents
(i.e. returns the substitution function represented by the subsitution list)
*)
let rec subst_fun sigma = fun ty -> do_subs sigma ty;;

let subst = subst_fun phi;;

subst 1;;
subst 5;;
