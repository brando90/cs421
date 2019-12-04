open Common;;

let const_to_val c =
  match c with
    | BoolConst b -> BoolVal b
    | IntConst i -> IntVal i
    | FloatConst f -> FloatVal f
    | StringConst s -> StringVal s
    | NilConst -> UnitVal (* TODO *)
    | UnitConst -> UnitVal

let monOpApply op v = raise (Failure "Not implemented yet.")

let binOpApply binop (v1,v2) = raise (Failure "Not implemented yet.")

(* exp * memory -> value *)
let rec eval_exp (exp, m) =
  match exp with
    | VarExp x ->
      let some_v=lookup_env m x in
      ( match some_v with
        | None -> raise (Failure "Not implemented yet.") (* TODO what do we do here? *)
        | Some v ->
      (* let v=(match [lookup_env m x] with None -> None | Some v -> v) in *)
          ( match v with
            | RecVarVal(f,y,e,m') -> raise (Failure "Not implemented yet.")
            | _ -> v
              )
        )
    | ConstExp c -> const_to_val c
    | MonOpAppExp (mon_op, e)         -> raise (Failure "Not implemented yet.")
    | BinOpAppExp (bin_op, e1, e2)   -> raise (Failure "Not implemented yet.")
    | IfExp (e1, e2, e3)            -> raise (Failure "Not implemented yet.")
    | AppExp (e1,e2)                -> raise (Failure "Not implemented yet.")
    | FunExp (s,e)             -> raise (Failure "Not implemented yet.")
    | LetInExp (s,e1,e2)      -> raise (Failure "Not implemented yet.")
    | LetRecInExp (s1,s2,e1,e2) -> raise (Failure "Not implemented yet.")
    | RaiseExp (e)                            -> raise (Failure "Not implemented yet.")
    | TryWithExp (e1,some_i,e2, lst) -> raise (Failure "Not implemented yet.") (* of (exp * int option * exp * (int option * exp) list) *)

(*  dec * memory -> (string option * value ) * memory  *)
let eval_dec (dec, m) =
  match dec with
    | Anon e ->
      let v=eval_exp (e, m) in
      let new_binding=(None, v) in
      (new_binding, m)
      (* (Some "_", v) *)
    | Let (x,e) ->  (* let x = e;; in memory m *)
      (* if condition for proof rule *)
      let v=eval_exp (e, m) in (* (e,m)=>v*)
      (* conclusion for proof rule *)
      let new_binding = (Some x,v) in
      let new_memory = ins_env m x v in
      (new_binding,new_memory)
    | LetRec (s1,s2,e) -> raise (Failure "Not implemented yet.")
