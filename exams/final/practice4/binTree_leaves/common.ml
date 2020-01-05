(* File: common.ml *)

type bintree =
  Node of (int * (bintree option) * (bintree option))
