(* 5 sub_list *)

(* let rec sub_list list1 list2 =
match list1 with
| [] -> match list2 with
  | [] -> true
  | l2::l2s -> false
| l1::l1s -> match list2 with
  | [] -> true
  | l2::l2s -> match l1=l2 with
    | true -> sub_list l1s l2s
    | false -> sub_list l1s list2
    ;; *)

let rec sub_list list1 list2 =
match list1,list2 with
| [],[] -> true
| [],_ -> false
| _,[] -> true
| l1::l1s,l2::l2s -> match l1=l2 with
  | true -> sub_list l1s l2s
  | false -> sub_list l1s list2
  ;;

sub_list [1;1;2;1;1;4;1] [1;2;1;1;1];;
