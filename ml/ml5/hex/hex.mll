{
open Common;;

}

(* You can assign names to commonly-used regular expressions in this part
   of the code, to save the trouble of re-typing them each time they are used
#use "hex.ml";;
*)

let numeric = ['0' - '9']
let lowercase = ['a' - 'z']
let alpha = ['a' - 'z' 'A' - 'Z']
let alphanum = alpha | numeric
let binary = '0' | '1'

let whitespace = [' ' '\t' '\n']

(* let hexadecimal = "0x"(numeric | lowercase)+ *)

rule token = parse
  | [' ' '\t'] { token lexbuf }  (* skip over whitespace *)
  | ['\n']     { token lexbuf }  (* skip over whitespace *)
  | eof        { EOF }

  | "~"     { NEG }
  | "+"     { PLUS  }
  | "*"     { TIMES  }
  | "/"     { DIV  }
  | "+."    { DPLUS  }
  | "-."    { DMINUS  }
  | "*."    { DTIMES  }
  | "/."    { DDIV  }
  | "^"     { CARAT  }
  | "<"     { LT  }
  | ">"     { GT  }
  | "<="    { LEQ  }
  | "="     { EQUALS  }
  | "<>"    { NEQ }
  | "|"     { PIPE  }
  | "->"    { ARROW  }
  | "::"    { DCOLON  }
  | ";"     { SEMI }
  | ";;"    { DSEMI }
  | "@"     { AT  }
  | "let"   { LET  }
  | "rec"   { REC  }
  | "and"   { AND}
  | "end"   { END}
  | "then"  { THEN  }
  | "else"  { ELSE  }
  | "fun"   { FUN  }
  | "raise" { RAISE }
  | "try"   { TRY }
  | "with"  { WITH }
  | "not"   { NOT  }
  | "&&"    { LOGICALAND}
  | "||"    { LOGICALOR}
  | "["     { LBRAC  }
  | "]"     { RBRAC  }
  | "()"    { UNIT }
  | "("     { LPAREN  }
  | ")"     { RPAREN  }
  | ","     { COMMA  }
  | "_"     { UNDERSCORE }
  | "true"  { TRUE }
  | "false" { FALSE }
  | "()"    { UNIT }

  | numeric+ as s         { INT (int_of_string s) }
  | ("0b"(binary)+) as s  { INT (int_of_string s) }
  | ((numeric+)'.'(numeric*)('e'(numeric)+)?) as s { FLOAT (float_of_string s) }

  | "-" { MINUS }
  | ">=" { GEQ }
  | "[]" { NIL }
  | "in" { IN }
  | "if" { IF }
  | "mod" { MOD }

  | "0x"(numeric | lowercase)+ as h { INT (int_of_string h) }

  | (lowercase)(lowercase | numeric | '_' | '\'')* as ident { IDENT ident }

  | '\"' as s { string_detect "" lexbuf }


and string_detect collect = parse
  | '\"' { STRING collect }
  | '\''|'\"'|'\t'|'\n'|'\r'|'\b'|' ' as c { string_detect (collect^(String.make 1 c)) lexbuf }
  | "," as c { string_detect (collect^String.make 1 c) lexbuf }
  | (alphanum | "_")* as s { string_detect (collect^s) lexbuf}
  | "\\\"" { string_detect (collect^"\"") lexbuf }
  | '\\' { escape_char (collect^String.make 1 '\\') lexbuf }

and escape_char collect = parse
  (* | '\"' { string_detect (collect^String.make 1 '\"') lexbuf } *)
  (* | ['0' - '1']['0' - '5']['0' - '5'] as s { let int_c=(int_of_string s) in let char_c =(char_of_int int_c) in string_detect ( collect ^(String.make 1 char_c) ) lexbuf } *)
  | ['0' - '1']['0' - '5']['0' - '5'] as s { string_detect collect^s lexbuf }

{(* do not modify this function:

get_all_tokens "\"";;

empty string test:
get_all_tokens " \"\" ";;

special char:
get_all_tokens " \"  \" ";;
get_all_tokens " \" \\\" \" ";; -> get_all_tokens " \" \" \" ";;

get_all_tokens " \" \\ \" ";;
get_all_tokens " \"\t\r\" ";;
get_all_tokens " \" \\ \' \t \n \r \b  \" ";;
get_all_tokens " \" \\ \' \t \n \r \b abc  \" ";;

get_all_tokens " \" \\100 \" ";;

  *)
 let lextest s = token (Lexing.from_string s)
 (* let lexstdin= token (Lexing.from_channel stdin) *)

 let get_all_tokens s =
     let b = Lexing.from_string (s^"\n") in
     let rec g () =
     match token b with EOF -> []
     | t -> t :: g () in
     g ()

let try_get_all_tokens s =
    try (Some (get_all_tokens s), true)
    with Failure "unmatched open comment" -> (None, true)
       | Failure "unmatched closed comment" -> (None, false)
 }
