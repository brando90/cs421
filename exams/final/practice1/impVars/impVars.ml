(* CS421 - Fall 2017
 * impVars
 *
 * Please keep in mind that there may be more than one
 * way to solve a problem.  You may want to change how this starts.
 *)

open Common

let get_vars_of_values v =
( match v with
  | Var y -> [y]
  | _ -> []
  )

let rec vars program =
  match program with
    | Seq (s1,s2) -> (vars s1) @ (vars s2)
    | Assign(x,v) ->
      let vars_v = get_vars_of_values v in
      [x]@vars_v
    | IfThenElse (v,s1,s2) ->
      let vars_statements = (vars s1) @ (vars s2) in
      let vars_v = get_vars_of_values v in
      vars_v @ vars_statements
