open Common
open Plsolution
(* PUT ANY HELPER FUNCTIONS YOU WANT UP HERE! *)


(* given two lists of monoTy combine them into a list of constraints*)
let rec combine_types sargs targs =
  match sargs with
    | [] -> []
    | s::rem_sargs ->
      match targs with
        | [] -> []
        | t::rem_targs ->
          (s,t)::(combine_types rem_sargs rem_targs)

(* union [1;2] [3;4];; *)

let rec unify constraints =
  match constraints with
    [] -> Some([])
  | (s,t)::rem_constraints ->
        if s = t then unify rem_constraints else (* Delete *)
      (match s with
        | TyVar ns -> (* Eliminate *)
            unify_eliminate ns t rem_constraints unify
        | TyConst(cs,argss) ->  (* Orient and Decompose *)
          (* we know s is not a variable *)
          match t with
            | TyVar nt -> (* t is a variable case, so orient! *)
              (* (s,t) but we have the variable on the right, so orient/rotate/switch to have variable on the left *)
              unify ((t,s)::rem_constraints)
            | TyConst(ct, argst) ->
              let new_constraints_from_matching_args = combine_types argss argst in
              unify (rem_constraints@new_constraints_from_matching_args)
  )
