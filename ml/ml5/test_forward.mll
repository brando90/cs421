{
  type result = Int of int | Float of float |
  String of string
}
(* regexps *)
let digit = ['0'-'9'] (* a single digit btw 0 to 9 *)
let digits = digit+ (* at least 1 digit i.e. regex digit digit* *)
let lower_case = ['a'-'z']
let upper_case = ['A'-'Z']
let letter = upper_case | lower_case
let letters = letter+
(*
Rules, what to do when we read the longest char seq from the lexbuffers
note: lexbuf is the implied argument
*)
rule main = parse
  | (digits) '.' digits as f { Float(float_of_string f)::main lexbuf }
  | digits as n { Int (int_of_string n) }
  | letters as s { String s::main lexbuf}
  | eof {[]}
  | _ {main lexbuf }
{
  let newlexbuf = (Lexing.from_channel stdin) in
    print_newline ();
    main newlexbuf
}
