(* CS421 - Fall 2017
 * delannoy
 *
 * Please keep in mind that there may be more than one
 * way to solve a problem.  You may want to change how this starts.
 *)


(*Problem*)
let rec delannoy (m, n) =
if m == 0 && n == 0 then 1 else
if m <= 0 || n <= 0 then 0 else
(* delannoy (m - 1, n) + delannoy (m, n - 1) + delannoy (m - 1, n - 1);; *)
(* ( 3 * delannoy (m - 1, n - 1) ) + delannoy (m - 1, n) + delannoy (m, n - 1);; *)
delannoy (m - 1, n - 1) + delannoy (m - 1, n) + delannoy (m, n - 1);;
