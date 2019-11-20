{
open Common;;

}

(* You can assign names to commonly-used regular expressions in this part
   of the code, to save the trouble of re-typing them each time they are used *)

let numeric = ['0' - '9']
let lowercase = ['a' - 'z']
let alpha = ['a' - 'z' 'A' - 'Z']
let alphanum = alpha | numeric
let hexadec = ['a' - 'f'] | numeric

let whitespace = [' ' '\t' '\n']

let ddd = ['0' - '2'] ['0' - '5'] ['0' - '5']

rule token = parse
  | [' ' '\t'] { token lexbuf }  (* skip over whitespace *)
  | ['\n']     { token lexbuf }  (* skip over whitespace *)
  | eof        { EOF          }

  | "~"     { NEG }
  | "-"     { MINUS  }
  | "*"     { TIMES  }
  | "/"     { DIV  }
  | "+."    { DPLUS  }
  | "-."    { DMINUS  }
  | "*."    { DTIMES  }
  | "/."    { DDIV  }
  | "^"     { CARAT  }
  | "<"     { LT  }
  | "<="    { LEQ  }
  | ">="    { GEQ  }
  | "="     { EQUALS  }
  | "<>"    { NEQ }
  | "|"     { PIPE  }
  | "->"    { ARROW  }
  | "::"    { DCOLON  }
  | ";"     { SEMI }
  | ";;"    { DSEMI }
  | "@"     { AT  }
  | "[]"    { NIL }
  | "let"   { LET  }
  | "and"   { AND}
  | "end"   { END}
  | "in"    { IN  }
  | "if"    { IF  }
  | "then"  { THEN  }
  | "else"  { ELSE  }
  | "mod"   { MOD  }
  | "try"   { TRY }
  | "with"  { WITH }
  | "not"   { NOT  }
  | "&&"    { LOGICALAND}
  | "||"    { LOGICALOR}
  | "["     { LBRAC  }
  | "()"    { UNIT }
  | "("     { LPAREN  }
  | ")"     { RPAREN  }
  | ","     { COMMA  }
  | "_"     { UNDERSCORE }
  | "true"  { TRUE }
  | "false" { FALSE }
  | "()"    { UNIT }

  | numeric+ as s         { INT (int_of_string s) }
  | ("0x"(hexadec)+) as s { INT (int_of_string s) }
  | ((numeric+)'.'(numeric*)('e'(numeric)+)?) as s       { FLOAT (float_of_string s) }
(* your rules go here *)

  | "+" { PLUS }
  | ">" { GT }
  | "]" { RBRAC }
  | "rec" { REC }
  | "fun" { FUN }
  | "raise" { RAISE }

  | "0b" ['0' - '1']+ as s { INT (int_of_string s)  }

  | lowercase (alphanum | "\'" | "_")* as s { IDENT s }

  | "\"" { get_str "" lexbuf }

(* and get_str accumulator:string = parse *)
and get_str accumulator = parse
  | "\"" { STRING accumulator }
  | '\\' { get_stuff_after_backslash accumulator lexbuf }
  | (alphanum|whitespace|",")* as s { get_str (accumulator^s) lexbuf }

and get_stuff_after_backslash accumulator = parse
  | ddd as s {
      let n=int_of_string s in
      let c=char_of_int n in
      let s=String.make 1 c in
      get_str (accumulator^s) lexbuf
    }
  | ['\\' '\'' '\"' '\t' '\n' '\r' '\b' ' '] as c { let s=(String.make 1 c) in get_str (s^accumulator) lexbuf }

(*
get_all_tokens "\" \"";;
get_all_tokens "\\";;
get_all_tokens "\"some string\"";;
get_all_tokens "\" she said, \\\"hello\\\"\"";;
get_all_tokens "\" \\100 \\001 \"";;
get_all_tokens "\" \\100 \\001 \"";;
*)

{(* do not modify this function: *)
 let lextest s = token (Lexing.from_string s)

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
