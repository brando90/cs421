(*
 * grader for mp3
 * This file will be preprocessed to generate the actual OCaml file.
 *)

#define TEST0ARG(WEIGHT, FNAME)\
    #FNAME, mptest WEIGHT (ss_pair0 Solution.FNAME Student.FNAME)
#define TEST1ARG(WEIGHT, FNAME, ARG1)\
    #FNAME^" "^#ARG1, mptest WEIGHT (ss_pair1 Solution.FNAME Student.FNAME (ARG1))
#define TEST2ARG(WEIGHT, FNAME, ARG1, ARG2)\
    #FNAME^" "^#ARG1^" "^#ARG2, mptest WEIGHT (ss_pair2 Solution.FNAME Student.FNAME (ARG1) (ARG2))
#define TEST3ARG(WEIGHT, FNAME, ARG1, ARG2, ARG3)\
    #FNAME^" "^#ARG1^" "^#ARG2^" "^#ARG3, mptest WEIGHT (ss_pair3 Solution.FNAME Student.FNAME (ARG1) (ARG2) (ARG3))
#define TEST4ARG(WEIGHT, FNAME, ARG1, ARG2, ARG3, ARG4)\
    #FNAME^" "^#ARG1^" "^#ARG2^" "^#ARG3^" "^#ARG4, mptest WEIGHT (ss_pair4 Solution.FNAME Student.FNAME (ARG1) (ARG2) (ARG3) (ARG4))
#define TEST5ARG(WEIGHT, FNAME, ARG1, ARG2, ARG3, ARG4, ARG5)\
    #FNAME^" "^#ARG1^" "^#ARG2^" "^#ARG3^" "^#ARG4^" "^#ARG5, mptest WEIGHT (ss_pair5 Solution.FNAME Student.FNAME (ARG1) (ARG2) (ARG3) (ARG4) (ARG5))

#define TEST1ARG_TWOFUN(WEIGHT, FNAME1, FNAME2, ARG1)\
    #FNAME1^" "^#ARG1, mptest WEIGHT (ss_pair1 FNAME1 FNAME2 (ARG1))
#define TEST2ARG_TWOFUN(WEIGHT, FNAME1, FNAME2, ARG1, ARG2)\
    #FNAME1^" "^#ARG1^" "^#ARG2, mptest WEIGHT (ss_pair2 FNAME1 FNAME2 (ARG1) (ARG2))
#define TEST3ARG_TWOFUN(WEIGHT, FNAME1, FNAME2, ARG1, ARG2, ARG3)\
    #FNAME1^" "^#ARG1^" "^#ARG2^" "^#ARG3, mptest WEIGHT (ss_pair3 FNAME1 FNAME2 (ARG1) (ARG2) (ARG3))
#define TEST4ARG_TWOFUN(WEIGHT, FNAME1, FNAME2, ARG1, ARG2, ARG3, ARG4)\
    #FNAME1^" "^#ARG1^" "^#ARG2^" "^#ARG3, mptest WEIGHT (ss_pair4 FNAME1 FNAME2 (ARG1) (ARG2) (ARG3) (ARG4))

open Grader
open Test
open Common

(*
 * use a timeout of 4 seconds
 *)

  let isEq i j = (i = j) (* Needs to be alpha equivalence *)

let mptest weight pair = compare isEq 4 weight pair

#include "tests"

let _ = Main.main rubric extra_rubric rubric_title rubric_version
