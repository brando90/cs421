(* File: ml6.ml *)

open Common;;

let rec match_lookup l n =
    match l with [] -> None
    | (Some m, v)::more -> if n = m then Some v else match_lookup more n
    | (None, v)::_ -> Some v

let rec app_exn_handler_cont env ce n =
    match ce with
    | EmptyExnContCPS -> UncaughtException n
    | ExnContVarCPS i ->
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
        | None -> Failed
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



(* cps_env_entry list -> exp_cps -> step_result *)
let rec one_step_exp_cps_eval env exp_cps =
  match exp_cps with
  | VarCPS (cps_cont,x) ->
    let some_v = lookup_value env x in
    ( match some_v with
      | None -> UncaughtException 0
      | Some v ->
        app_cont_to_value env cps_cont v
      )
  | ConstCPS (cps_cont,const) -> (* k v env *)
    let const_v = const_to_val const in
    let kv = app_cont_to_value env cps_cont const_v in kv
  | MonOpAppCPS (cps_cont,mon_op,x,exn_cont) ->
    let some_v = lookup_value env x in
    ( match some_v with
      | None -> UncaughtException 0
      | Some v ->
        let v_exn = monOpApply mon_op v in
        ( match v_exn with
          | Value v -> Final v
          | Exn n -> app_exn_handler_cont env exn_cont n
          )
      )
  | BinOpAppCPS (cps_cont,bin_op,x1,x2,exn_cont) ->
    let some_v1 = lookup_value env x1 in
    ( match some_v1 with
      | None -> UncaughtException 0
      | Some v1 ->
        let some_v2 = lookup_value env x2 in
        ( match some_v2 with
          | None -> UncaughtException 0
          | Some v2 ->
            let v_exn = binOpApply bin_op v1 v2 in
              match v_exn with
              | Value v -> app_cont_to_value env cps_cont v
              | Exn n -> app_exn_handler_cont env exn_cont n
          )
      )
  | IfCPS (x,exp_cps1,exp_cps2) ->
    let some_v_b = lookup_value env x in
    ( match some_v_b with
      | None -> Failed
      | Some v_b ->
        ( match v_b with
          | BoolVal b ->
            let current_exp_cps = if b then exp_cps1 else exp_cps2 in
            Intermediate ( (env), current_exp_cps )
          | _ -> UncaughtException 0
          )
      )
  | AppCPS (cps_cont,x1,x2,exn_cont) -> raise (Failure "Not yet implemented")
  | FunCPS (cps_cont,x,cont_var,i,exp_cps1) -> raise (Failure "Not yet implemented")
  | FixCPS (cps_cont,x1,x2,cont_var,i,exp_cps1) -> raise (Failure "Not yet implemented")
