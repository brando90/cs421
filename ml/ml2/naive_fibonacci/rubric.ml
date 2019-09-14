(*
 * This file will be preprocessed to generate the actual OCaml file.
 *)
open Grader
open Test

(*
 * use a timeout of 4 seconds
 *)

let mptest weight pair = compare (=) 4 weight pair


let rubric_version = "1.0"
let rubric_title = "CS421 Fall 2017 MP1"

(**************************************************************************
 * You can add new test cases by adding new elements to the following lists
 * Format is:
 * TEST<X>ARG(<weight>, <function_name>, <arg1>, <arg2>, ..., <argX>)
 *
 * <X> is the number of argument that the function being tested takes.
 **************************************************************************)

(* This list is for regular problems *)
let rubric =
[
(* Problem 14, 3 pts *)
    "naive_fibonacci"^" "^"7", mptest 1 (ss_pair1 Solution.naive_fibonacci Student.naive_fibonacci 7);
    "naive_fibonacci"^" "^"0", mptest 1 (ss_pair1 Solution.naive_fibonacci Student.naive_fibonacci 0);
    "naive_fibonacci"^" "^"10", mptest 1 (ss_pair1 Solution.naive_fibonacci Student.naive_fibonacci 10);
]

(* Note: the last entry should not be followed by a semicolon. *)

let extra_rubric =
[
]

let _ = Main.main rubric extra_rubric rubric_title rubric_version
