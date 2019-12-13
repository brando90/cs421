open Common

(* CS421 - Fall 2017 sum_all
 *
 * Please keep in mind that there may be more than one way to solve a
 * problem. You will want to change how a number of these start.
 *)

(*****************************
* Continuation Passing Style *
*****************************)

(* Problems *)
let rec sum_all (p, l) =
    match l with
        | [] -> 0.0
        | x::xs ->
        let r = sum_all (p, xs) in
        let b = p x in
        if b then x +. r else r

(* let rec sum_allk (pk,l) k =
    match l with
      | [] -> k 0.0
      | x::xs ->
          pk x ( fun b -> if b
            then sum_allk (pk, xs) (fun r -> float_addk (x,r) k )
            else sum_allk (pk, xs) k
              ) *)

(* let rec sum_allk (pk,l) k =
    match l with
      | [] -> k 0.0
      | x::xs ->
          pk x ( fun b -> sum_allk (pk, xs) (
            fun r -> if b then float_addk (x,r) k else k r )
            ) *)

let rec sum_allk (pk,l) k =
    match l with
      | [] -> k 0.0
      | x::xs ->
      sum_allk (pk,xs) ( fun r -> pk x ( fun b -> if b then float_addk (x,r) k else k r ) )
