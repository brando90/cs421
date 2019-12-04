open Common;;

let const_to_val c =
  match c with
    | BoolConst b -> BoolVal b
    | IntConst i -> IntVal i
    | FloatConst f -> FloatVal f
    | StringConst s -> StringVal s
    | NilConst -> UnitVal (* TODO *)
    | UnitConst -> UnitVal

let rec my_tl lst =
  match lst with
    | [] -> []
    | x::xs -> if xs==[] then x else my_tl xs

(*  mon op -> value -> value *)
let monOpApply op v =
  print_value v;print_string "HERE!!!";
  match op with
    | HdOp ->
      match v with
        | ListVal(v,lst) -> v
        | _ -> raise (Failure "Not implemented yet.")
    | TlOp ->
      match v with
        | ListVal(v,lst) -> my_tl (v::lst) (* TODO: is there a better solution *)
        | _ -> raise (Failure "Not implemented yet.")
    | PrintOp ->
      match v with
        | StringVal s -> print_string s;UnitVal
        | _ -> raise (Failure "Not implemented yet.")
    | IntNegOp ->
      match v with
        | IntVal i -> IntVal(-i)
        | _ -> raise (Failure "Not implemented yet.")
    | FstOp ->
      match v with
        | PairVal(v1,v2) -> v1
        | _ -> raise (Failure "Not implemented yet.")
    | SndOp ->
      match v with
        | PairVal(v1,v2) -> v2
        | _ -> raise (Failure "Not implemented yet.")

let binOpApply binop (v1,v2) = raise (Failure "Not implemented yet.")

(* exp * memory -> value *)
let rec eval_exp (exp, m) =
  match exp with
    | VarExp x ->
      let some_v=lookup_env m x in
      (match some_v with
        | None -> raise (Failure "Not implemented yet.") (* TODO what do we do here? *)
        | Some v ->
          (match v with
            | RecVarVal(f,y,e,m') -> raise (Failure "Not implemented yet.")
            | _ -> v
              )
        )
    | ConstExp c -> const_to_val c
    | MonOpAppExp (mon_op, e) ->
      let v=eval_exp e m in
      let v'=monOpApply v in v'
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
