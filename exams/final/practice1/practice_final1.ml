
let rec sum_all (p, l) =
  match l with
    | [] -> 0.0
    | x::xs -> if p x then x +. sum (p, xs) else sum (p, xs)
