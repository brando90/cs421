(* File: common.ml *)

type value =
    IntVal of int
  | BoolVal of bool
  | Var of string

type imp =
    Seq of (imp * imp)
  | Assign of (string * value)
  | IfThenElse of (value * imp * imp)

let rec mergesort list =
let split l =
  let rec split_aux l left right = 
    match l,left,right with
    | ([] | [_]),_,_ -> (List.rev left),right
    | (_::_::t),_,h::right_t -> split_aux t (h::left) right_t
    | _ -> assert false
  in
  split_aux l [] l
  in
let rec merge l1 l2 =
  match l1,l2 with
  | [],l | l,[] -> l
  | h1::t1,h2::t2 ->
    if h1 < h2  then h1::(merge t1 l2)
    else if h2 < h1 then h2::(merge l1 t2)
    else merge t1 l2
  in match list with
  | ([] | [_]) as l -> l
  | l ->  let left,right = split l in 
          merge (mergesort left) (mergesort right)
