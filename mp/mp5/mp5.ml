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
    | FloatPlusOp ->
      ( match v1 with
          | FloatVal f1 ->
          ( match v2 with
            | FloatVal f2 -> FloatVal( f1 +. f2 )
            | _ -> Exn(0)
            )
            | _ -> Exn(0)
          )
    | FloatMinusOp ->
      ( match v1 with
          | FloatVal f1 ->
          ( match v2 with
            | FloatVal f2 -> FloatVal( f1 -. f2 )
            | _ -> Exn(0)
            )
            | _ -> Exn(0)
          )
    | FloatTimesOp ->
      ( match v1 with
          | FloatVal f1 ->
          ( match v2 with
            | FloatVal f2 -> FloatVal( f1 *. f2 )
            | _ -> Exn(0)
            )
            | _ -> Exn(0)
          )
    | FloatDivOp ->
      ( match v1 with
          | FloatVal f1 ->
          ( match v2 with
            | FloatVal f2 -> if f2=0.0 then Exn(0) else FloatVal( f1 /. f2 )
            | _ -> Exn(0)
            )
            | _ -> Exn(0)
          )
    | ConcatOp ->
      ( match v1 with
          | StringVal s1 ->
          ( match v2 with
            | StringVal s2 -> StringVal( s1^s2 )
            | _ -> Exn(0)
            )
            | _ -> Exn(0)
          )
    | ConsOp ->
      ( match v2 with
        | ListVal v_list -> ListVal( v1::v_list )
        | _ -> Exn(0)
        )
    | CommaOp -> PairVal(v1,v2) (* TODO same Q as above *)
    | EqOp -> BoolVal(v1=v2)
    | GreaterOp -> BoolVal(v1>v2)
    | ModOp ->
      ( match v1 with
          | IntVal i1 ->
          ( match v2 with
            | IntVal i2 -> IntVal( i1 mod i2 )
            | _ -> Exn(0)
            )
            | _ -> Exn(0)
          )
    | ExpoOp ->
      ( match v1 with
          | FloatVal f1 ->
          ( match v2 with
            | FloatVal f2 -> FloatVal( f1**f2 )
            | _ -> Exn(0)
            )
            | _ -> Exn(0)
          )

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
    | BinOpAppExp (bin_op, e1, e2)   ->
      let v1=eval_exp (e1,m) in
      let v2=eval_exp (e2,m) in
      let v=binOpApply bin_op (v1,v2) in v
    | IfExp (e1, e2, e3) ->
      let bool_guard=eval_exp (e1,m) in
      ( match bool_guard with
          | BoolVal b ->
          ( match b with
            | true -> let v=eval_exp (e2,m) in v
            | false -> let v=eval_exp (e3,m) in v
            )
          | _ -> Exn(0)
        )
    | AppExp (e1,e2) ->
      let e1_closure=eval_exp (e1,m) in
        ( match e1_closure with
            | Closure (x,e',m') ->
              let v'=eval_exp (e2,m) in
              let m''=ins_env m' x v' in
              let v=eval_exp (e',m'') in v
            | _ -> Exn(0)
          )
    | FunExp (x,e) -> Closure(x,e,m)
    | LetInExp (x,e1,e2) ->
      let v1=eval_exp (e1,m) in
      let m'=ins_env m x v1 in
      let v2=eval_exp (e2,m') in v2
    | LetRecInExp (s1,s2,e1,e2) -> raise (Failure "Not implemented yet.")
    | RaiseExp (e)                            -> raise (Failure "Not implemented yet.")
    | TryWithExp (e1,some_i,e2, lst) -> raise (Failure "Not implemented yet.") (* of (exp * int option * exp * (int option * exp) list) *)

(*  dec * memory -> (string option * value ) * memory  *)
let eval_dec (dec, m) =
  match dec with
    | Anon e ->
      let variable=None in
      let v=eval_exp (e, m) in
      let new_binding=(variable, v) in
      (new_binding, m)
      (* (Some "_", v) *)
    | Let (x,e) ->  (* let x = e;; in memory m *)
      (* if condition for proof rule *)
      let v=eval_exp (e, m) in (* (e,m)=>v*)
      (* conclusion for proof rule *)
      let new_binding = (Some x,v) in
      let new_memory = ins_env m x v in
      (new_binding,new_memory)
    | LetRec (f,x,e) ->
      let variable=Some f in
      let v=RecVarVal(f,x,e,m) in
      let new_binding=(variable,v) in
      let m'=ins_env m f v in
      (new_binding, m')
