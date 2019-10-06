(* *)

type weekday = Monday | Tuesday | Wednesday
| Thursday | Friday | Saturday | Sunday;;

let day_after day =
match day with
| Monday -> Tuesday
| Tuesday -> Wednesday
| Wednesday -> Thursday
| Thursday -> Friday
| Friday -> Saturday
| Saturday -> Sunday
| Sunday -> Monday;;

day_after Monday;; (* Monday -> Tuesday *)
day_after (day_after Monday);;

let rec days_later n day =
match n with
| 0 -> day
| _ -> if n > 0 then day_after (days_later (n - 1) day)
else days_later (n + 7) day;;

days_later 0 Monday;;
days_later 1 Monday;; (* day_after Monday;; *)
days_later 2 Monday;; (* day_after (day_after Monday);; *)
days_later 3 Monday;; (* day_after (day_after (day_after Monday));; *)

days_later (-1) Wednesday;;
days_later (6) Wednesday;;

let is_weekend day =
match day with
| Saturday -> true
| Sunday -> true
| _ -> false;;

is_weekend Monday;;
is_weekend Saturday;;

type bin_op = IntPlusOp | IntMinusOp | EqOp | CommaOp | ConsOp;;

type mon_op = HdOp | TlOp | FstOp | SndOp;;

(*
Disjoint Union Types
*)

(* Of type id value DriversLicense of int *)
type id = DriversLicense of int | SocialSecurity of int | Name of string;;

let check_id id =
match id with
| DriversLicense num -> not (List.mem num [13570; 99999])
| SocialSecurity num -> num < 900000000
| Name str -> not (str = "John Doe");;

type currency =
| Dollar of int
| Pound of int
| Euro of int
| Yen of int;;

type const =
| BoolConst of bool
| IntConst of int
| FloatConst of float
| StringConst of string
| NilConst
| UnitConst;;

(* Polymorphism*)

type 'a option = Some of 'a | None;;

let rec fist p list =
match list with
| [] -> None
| x::xs -> if p x then Some x else p xs;;

(* Mutually Recursive Types *)
type 'a tree =
| TreeLeaf of 'a treeList (* treeList define the way branching factor of an arbitrary tree *)
and 'a treeList = (* defines seperately another type so that we actually have the branching factor *)
| Last of 'a tree (* Last define the final branch of the tree *)
| More of ('a tree * 'a treeList) (* Its really just the Cons operator but the elements/values are trees (which can be TreeLists! )*)
;;

let rec fringe tree =
match tree with
| (TreeLeaf x) -> [x]
| (TreeNode list) -> list_fringe list
and list_fringe tree_list =
match tree_list with
| (Last tree) -> fringe tree
| (More (tree,list)) ->
(fringe tree) @ (list_fringe list);;

(* nested recursive types *)

type 'a labeled_tree =
| TreeNode of ('a * 'a labeled_tree list)
;;

let tree =
TreeNode
(More (TreeLeaf 5,
(More (TreeNode
(More (TreeLeaf 3,
Last (TreeLeaf 2))),
Last (TreeLeaf 7)))));;

let rec flatten_tree labtree =
match labtree with
| TreeNode(x,treelist) -> x::flatten_tree_list treelist
and flatten_tree_list treelist =
match treelist with
| [] -> []
| labtree::labtrees -> (flatten_tree labtree) @ (flatten_tree_list labtrees)
;;

flatten_tree tree;;
