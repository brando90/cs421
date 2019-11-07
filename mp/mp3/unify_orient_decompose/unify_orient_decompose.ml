open Common
open Plsolution

(* let phi = [(5:typeVar), mk_fun_ty bool_ty (TyVar(2))];; (* (typeVar, monoTy) list *) *)

(* let tau0 = TyVar(0);;
let tau1 = TyVar(1);;
let int_list = TyConst("list", TyConst("int",[]));; (* int list *)
let tau0_to_tau0 = TyConst("->",tau0,tau0);; (* tau0 -> tau0 *)
let tau0_t0_tau1 = TyConst("->",tau0,tau1);; (* tau0 -> tau1 *)

let eq0 = (tau0, int_list ) (* tau0 = int list *)
let eq1 = (tau0_to_tau0, tau0_t0_tau1 ) (* tau0->tau0 = tau0->tau1 *)

type substitution = (typeVar * monoTy) list
let subst = ( [eq0; eq1] : substitution);; *)

(* A substitution phi, when lifted, replaces all the type variables occuring in its
  input type with the corresponding types. *)
(* PUT ANY HELPER FUNCTIONS YOU WANT UP HERE! *)

let rec apply (sub:(monoTy->monoTy)) (constraints:(monoTy*monoTy) list) =
  match constraints with
    | [] -> []
    | (s,t)::rem_constraints ->
      (sub s, sub t)::(apply sub rem_constraints)
    ;;

let unify_eliminate (x:typeVar) (t:monoTy) (rem_constraints:(monoTy*monoTy) list) (unify:(monoTy * monoTy) list -> substitution option) =
let var_phi=(monoTy_lift_subst [(x,t)]) in
  (let c'' = apply var_phi rem_constraints in
   (
     let some_phi = unify c'' in
     (
       match some_phi with
        | None -> None
        | Some phi -> Some( (x,monoTy_lift_subst phi t)::phi  )
       )
    )
  );;

let rec union sargs targs =
  match sargs with
    | [] -> []
    | s::rem_sargs ->
      match targs with
        | [] -> []
        | t::rem_targs ->
          (s,t)::(union rem_sargs rem_targs)
;;

(*
(monoTy * monoTy) list -> substitution option
(monoTy * monoTy) list -> (typeVar * monoTy) list  <-> substitution  option
*)
let rec unify constraints =
  match constraints with
  | [] -> Some([])
  | (s,t)::rem_constraints ->
    (* Delete *)
    if s = t then unify rem_constraints
    else
      (match s with
        | TyVar x -> (* if s is a variable, let it be x*)
          if not (occurs x t) (* if x is not in t *)
            then unify_eliminate x t rem_constraints unify
          else None
        | TyConst(sc,sargs) ->  (* Orient and Decompose *)
          match t with
            | TyVar tn -> (* t is a variable but is not *)
              unify ((t,s)::rem_constraints)
            | TyConst(tc, targs) -> (* decompose rule *)
              unify (rem_constraints)@(union sargs targs)
  );;

(* *)

let Some(subst) =
   unify [(TyVar 0,
           TyConst ("list",
             [TyConst ("int", [])]));
          (TyConst ("->", [TyVar 0; TyVar 0]),
           TyConst ("->", [TyVar 0; TyVar 1]))];;
