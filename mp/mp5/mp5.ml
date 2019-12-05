open Common;;

(* raise (Failure "Not implemented yet.") *)

let const_to_val c =
  match c with
    | BoolConst b -> BoolVal b
    | IntConst i -> IntVal i
    | FloatConst f -> FloatVal f
    | StringConst s -> StringVal s
    | NilConst -> UnitVal (* TODO *)
    | UnitConst -> UnitVal

let rec my_tl (lst:value list) =
  match lst with
    | [] -> None
    | x::xs -> if xs=[] then Some x else my_tl xs

let my_hd lst =
  match lst with
    | [] -> None
    | x::xs -> Some x

(*  mon op -> value -> value *)
let monOpApply op v =
  (* print_value v;print_string "HERE!!!"; *)
  match op with
    | HdOp ->
      ( match v with
        | ListVal(value_list) ->
          ( match my_hd value_list with
              | None -> Exn(0)
              | Some v -> v
            )
        | _ -> Exn(0) (* is this right? *)
      )
    | TlOp ->
      ( match v with
        | ListVal(value_list) ->
          ( match my_tl value_list with
              | None -> Exn(0)
              | Some v -> v
            )
        | _ -> Exn(0) (* is this right? *)
      )
    | PrintOp ->
      ( match v with
        | StringVal s -> print_string s;UnitVal
        | _ -> Exn(0) (* is this right? *)
      )
    | IntNegOp ->
      ( match v with
        | IntVal i -> IntVal(-i)
        | _ -> Exn(0) (* is this right? *)
      )
    | FstOp ->
      ( match v with
        | PairVal(v1,v2) -> v1
        | _ -> Exn(0) (* is this right? *)
      )
    | SndOp ->
      ( match v with
        | PairVal(v1,v2) -> v2
        | _ -> Exn(0) (* is this right? *)
      )

(* bin op -> (value * value) -> value *)
let binOpApply binop (v1,v2) =
  match binop with
    | IntPlusOp ->
      ( match v1 with
          | IntVal i1 ->
          ( match v2 with
            | IntVal i2 -> IntVal( i1 + i2 )
            | _ -> Exn(0)
            )
          | _ -> Exn(0)
        )
    | IntMinusOp ->
      ( match v1 with
          | IntVal i1 ->
          ( match v2 with
            | IntVal i2 -> IntVal( i1 - i2 )
            | _ -> Exn(0)
            )
          | _ -> Exn(0)
        )
    | IntTimesOp ->
      ( match v1 with
          | IntVal i1 ->
          ( match v2 with
            | IntVal i2 -> IntVal( i1 * i2 )
            | _ -> Exn(0)
            )
          | _ -> Exn(0)
        )
    | IntDivOp ->
      ( match v1 with
          | IntVal i1 ->
          ( match v2 with
            | IntVal i2 -> if i2=0 then Exn(0) else IntVal( i1 / i2 )
            | _ -> Exn(0)
            )
          | _ -> Exn(0)
        )
    | FloatPlusOp -> raise (Failure "Not implemented yet.")
    | FloatMinusOp -> raise (Failure "Not implemented yet.")
    | FloatTimesOp -> raise (Failure "Not implemented yet.")
    | FloatDivOp -> raise (Failure "Not implemented yet.")
    | ConcatOp -> raise (Failure "Not implemented yet.")
    | ConsOp -> raise (Failure "Not implemented yet.")
    | CommaOp -> raise (Failure "Not implemented yet.")
    | EqOp -> raise (Failure "Not implemented yet.")
    | GreaterOp -> raise (Failure "Not implemented yet.")
    | ModOp -> raise (Failure "Not implemented yet.")
    | ExpoOp -> raise (Failure "Not implemented yet.")

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
      let v=eval_exp (e, m) in
      let v'=monOpApply mon_op v in v'
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
