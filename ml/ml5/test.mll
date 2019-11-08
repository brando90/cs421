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
let letters = letter +
(*
Rules, what to do when we read the longest char seq from the lexbuffers
*)
rule main = parse
  | (digits) '.' digits as f { Float(float_of_string f) }
  | letters as s { String s }
  | _ {main lexbuf }
{
  let newlexbuf = (Lexing.from_channel stdin) in
  (
    print_newline ();
    main newlexbuf
    )
}
