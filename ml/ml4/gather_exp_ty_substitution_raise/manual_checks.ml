open Common;;
open Plsolution;;


print_string(string_of_proof(get_proof(infer_exp gather_exp_ty_substitution [] (ConstExp (BoolConst true)))));;
