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

let rec eval_exp (exp, m) =
  match exp with
    | VarExp s -> raise (Failure "Not implemented yet.")
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
      (Some "_", v)
    | Let (s,e) -> raise (Failure "Not implemented yet.")
    | LetRec (s1,s2,e) -> raise (Failure "Not implemented yet.")
