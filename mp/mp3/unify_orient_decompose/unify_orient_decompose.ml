open Common
open Plsolution

type 'a option = Some of 'a | None ;;

type typeVar = int;;
type monoTy =
  | TyVar of typeVar
  | TyConst of (string * monoTy list);;

(* A substitution phi, when lifted, replaces all the type variables occuring in its
  input type with the corresponding types. *)
(* PUT ANY HELPER FUNCTIONS YOU WANT UP HERE! *)

let unify_eliminate x t rem_constraints unify =
let var_phi = [(x,t)] in
  (let c'' = subst_fun var_phi rem_constraints in
   (
     let phi = unify c'' in
     (
       (x,subst_fun phi t)::phi
       )
    )
  );;

let rec union sargs targs =
  match sargs with
    | s:rem_sargs ->
      match targs with
        | t:rem_targs ->
          (s,t)::(union rem_sargs rem_targs);;

let rec unify constraints =
  match constraints with
  | [] -> Some([])
  | (s,t)::rem_constraints ->
    (* Delete *)
    if s = t then unify rem_constraints
    else
      (match s with
        | TyVar x ->
          if not (occur x t) then unify_eliminate x t rem_constraints unify
          else None
        | TyConst(sc,sargs) ->  (* Orient and Decompose *)
          match t with
            | TyVar tn -> (* t is a variable but is not *)
              unift ((t,s)::rem_constraints)
            | TyConst(tc, targs) -> (* decompose rule *)
              unify (rem_constraints)@(union sargs targs)
  )

(* *)

let phi = [(5:typeVar), mk_fun_ty bool_ty (TyVar(2))];; (* (typeVar, monoTy) list *)

let tau0 = (0:typeVar);;
let tau1 = (1:typeVar);;

let eq0 = (tau0, TyConst ("list", [TyConst ("int", [])]) )
let eq1 = (tau1, TyConst ("list", [TyConst ("int", [])]) )

type substitution = (typeVar * monoTy) list

let subst = ( [eq0; eq1] : substitution);;
