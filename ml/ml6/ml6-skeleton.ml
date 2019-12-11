(* File: ml6.ml *)

open Common;;

let rec match_lookup l n =
    match l with [] -> None
    | (Some m, v)::more -> if n = m then Some v else match_lookup more n
    | (None, v)::_ -> Some v

let rec app_exn_handler_cont env ce n =
    match ce with EmptyExnContCPS -> UncaughtException n
    |  ExnContVarCPS i ->
      (match lookup_exn_cont env i with None -> Failed
       | Some (ke',env') -> app_exn_handler_cont env' ke' n)
    | UpdateExnContCPS (handler, ce') -> 
      (match match_lookup handler n with
         None -> app_exn_handler_cont env ce' n
       | Some ecps -> Intermediate(env, ecps))

let rec app_cont_to_value env k v = raise (Failure "Not implemented yet")

let rec one_step_exp_cps_eval env exp_cps = raise (Failure "Not implemented yet")
