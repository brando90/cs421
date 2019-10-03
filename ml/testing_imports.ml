open Common;;

addk;;
addk (1,1) report_int;;

let rec sum_helper n accumulator =
match n with
| 0 -> accumulator
| _ -> sum_helper (n-1) (accumulator+n-1);;

let sum_tail n = sum_helper n 0;;

sum_tail 3;;
