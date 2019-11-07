open Common

let rec occurs v ty =
  match ty with
    | TyVar ty_var -> ty_var=v
    | TyConst (name_ty_const, list_mono_ty) ->
      list_occurs v list_mono_ty
and list_occurs v list_mono_ty =
  match list_mono_ty with
    | [] -> false
    | mono_ty_x::list_mono_ty_xs ->
      (occurs v mono_ty_x) || (list_occurs v list_mono_ty_xs)
;;


occurs 0 (TyConst ("->", [TyVar 0; TyVar 0]));;
occurs 0 (TyConst ("->", [TyVar 1; TyVar 2]));;
