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
