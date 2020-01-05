(* CS421
 * binTree_leaves
 *
 * Please keep in mind that there may be more than one
 * way to solve a problem. You may want to create
 * helper functions.
 *)

open Common

let rec leaves tree =
    match tree with
        | Node (i,s_t1,s_t2) ->
            match s_t1 with
                | None ->
                    match s_t2 with
                        | None -> 1
                        | Some t2 -> leaves t2 
                | Some t1 -> 
                    match s_t2 with
                        | None -> leaves t1
                        | Some t2 -> (leaves t1) + (leaves t2) 
