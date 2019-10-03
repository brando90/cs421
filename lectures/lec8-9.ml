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

type binary_tree =
    | Leaf of int
    | Tree of binary_tree * binary_tree;;
