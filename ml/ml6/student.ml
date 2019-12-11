(* File: ml6.ml *)

open Common;;

let rec match_lookup l n =
    match l with [] -> None
    | (Some m, v)::more -> if n = m then Some v else match_lookup more n
    | (None, v)::_ -> Some v

let rec app_exn_handler_cont env ce n =
    match ce with
    | EmptyExnContCPS -> UncaughtException n
    |  ExnContVarCPS i ->
      (match lookup_exn_cont env i with None -> Failed
       | Some (ke',env') -> app_exn_handler_cont env' ke' n)
    | UpdateExnContCPS (handler, ce') ->
      (match match_lookup handler n with
         None -> app_exn_handler_cont env ce' n
       | Some ecps -> Intermediate(env, ecps))

(* cps_env_entry list -> cps_cont -> value -> step_result *)
let rec app_cont_to_value env k v =
  match k with
    | External ->  Final v
    | ContVarCPS _k ->
      let some_cont_k = lookup_cont env _k in
      ( match some_cont_k with
        | None -> UncaughtException 0
        | Some (cont, cont_env) ->
          app_cont_to_value cont_env cont v
        )
    | FnContCPS (y, exp_cps) ->
      let new_cps_env_entry = ValueBinding (y,v) in
      let new_env =  new_cps_env_entry::env in
        Intermediate(new_env,exp_cps)
    | ExnMatch (k_exn_cont) ->
      ( match v with
        | IntVal i ->
          app_exn_handler_cont env k_exn_cont i
        | _ -> UncaughtException 0
        )




let rec one_step_exp_cps_eval env exp_cps = raise (Failure "Not implemented yet")
