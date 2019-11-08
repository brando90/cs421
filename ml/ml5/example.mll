{
  (*
  We can put (ocaml) code here that can be used in the actions below.
  We won't use it here.

  #use "example.ml";;
  *)
}
rule main = parse
  | ['0'-'9']+ { print_string "Int\n"}
  | ['0'-'9']+'.'['0'-'9'] {print_string "Float\n"}
  | ['a'-'z']+ { print_string "String\n"}
  | _{ main lexbuf }
  {
    let newlextbuf = (Lexing.from_channel stdin) in
    main newlextbuf
  }
