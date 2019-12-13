type token =
  | INT of (int)
  | FLOAT of (float)
  | STRING of (string)
  | IDENT of (string)
  | TRUE
  | FALSE
  | NEG
  | PLUS
  | MINUS
  | TIMES
  | DIV
  | DPLUS
  | DMINUS
  | DTIMES
  | DDIV
  | MOD
  | EXP
  | CARAT
  | LT
  | GT
  | LEQ
  | GEQ
  | EQUALS
  | NEQ
  | PIPE
  | ARROW
  | SEMI
  | DSEMI
  | DCOLON
  | NIL
  | LET
  | REC
  | AND
  | IN
  | IF
  | THEN
  | ELSE
  | FUN
  | RAISE
  | TRY
  | WITH
  | NOT
  | LOGICALAND
  | LOGICALOR
  | LBRAC
  | RBRAC
  | LPAREN
  | RPAREN
  | COMMA
  | UNDERSCORE
  | UNIT
  | HEAD
  | TAIL
  | PRINT
  | FST
  | SND
  | EOF

open Parsing;;
let _ = parse_error;;
# 3 "student.mly"
  open Common

(* You may want to add extra code here *)

# 68 "student.ml"
let yytransl_const = [|
  261 (* TRUE *);
  262 (* FALSE *);
  263 (* NEG *);
  264 (* PLUS *);
  265 (* MINUS *);
  266 (* TIMES *);
  267 (* DIV *);
  268 (* DPLUS *);
  269 (* DMINUS *);
  270 (* DTIMES *);
  271 (* DDIV *);
  272 (* MOD *);
  273 (* EXP *);
  274 (* CARAT *);
  275 (* LT *);
  276 (* GT *);
  277 (* LEQ *);
  278 (* GEQ *);
  279 (* EQUALS *);
  280 (* NEQ *);
  281 (* PIPE *);
  282 (* ARROW *);
  283 (* SEMI *);
  284 (* DSEMI *);
  285 (* DCOLON *);
  286 (* NIL *);
  287 (* LET *);
  288 (* REC *);
  289 (* AND *);
  290 (* IN *);
  291 (* IF *);
  292 (* THEN *);
  293 (* ELSE *);
  294 (* FUN *);
  295 (* RAISE *);
  296 (* TRY *);
  297 (* WITH *);
  298 (* NOT *);
  299 (* LOGICALAND *);
  300 (* LOGICALOR *);
  301 (* LBRAC *);
  302 (* RBRAC *);
  303 (* LPAREN *);
  304 (* RPAREN *);
  305 (* COMMA *);
  306 (* UNDERSCORE *);
  307 (* UNIT *);
  308 (* HEAD *);
  309 (* TAIL *);
  310 (* PRINT *);
  311 (* FST *);
  312 (* SND *);
    0 (* EOF *);
    0|]

let yytransl_block = [|
  257 (* INT *);
  258 (* FLOAT *);
  259 (* STRING *);
  260 (* IDENT *);
    0|]

let yylhs = "\255\255\
\001\000\001\000\001\000\002\000\003\000\003\000\003\000\004\000\
\004\000\005\000\005\000\000\000"

let yylen = "\002\000\
\002\000\005\000\007\000\004\000\003\000\003\000\001\000\003\000\
\001\000\001\000\001\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\000\000\000\000\012\000\000\000\000\000\000\000\
\000\000\001\000\000\000\000\000\000\000\000\000\000\000\010\000\
\011\000\000\000\000\000\009\000\002\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\008\000\003\000"

let yydgoto = "\002\000\
\005\000\006\000\018\000\019\000\020\000"

let yysindex = "\015\000\
\233\254\000\000\252\254\013\255\000\000\247\254\255\254\016\255\
\254\254\000\000\244\254\023\255\008\255\001\255\007\255\000\000\
\000\000\002\255\021\255\000\000\000\000\244\254\008\255\008\255\
\008\255\004\255\021\255\021\255\000\000\000\000"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\005\255\249\254\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\251\254\253\254\000\000\000\000"

let yygindex = "\000\000\
\000\000\252\255\000\000\246\255\009\000"

let yytablesize = 34
let yytable = "\007\000\
\007\000\007\000\005\000\005\000\006\000\006\000\014\000\003\000\
\016\000\023\000\024\000\017\000\027\000\028\000\004\000\001\000\
\009\000\026\000\010\000\012\000\007\000\011\000\005\000\013\000\
\006\000\004\000\015\000\008\000\021\000\022\000\025\000\030\000\
\004\000\029\000"

let yycheck = "\004\001\
\008\001\009\001\008\001\009\001\008\001\009\001\011\000\031\001\
\001\001\008\001\009\001\004\001\023\000\024\000\038\001\001\000\
\004\001\022\000\028\001\004\001\028\001\023\001\028\001\026\001\
\028\001\038\001\004\001\032\001\028\001\023\001\010\001\028\001\
\028\001\025\000"

let yynames_const = "\
  TRUE\000\
  FALSE\000\
  NEG\000\
  PLUS\000\
  MINUS\000\
  TIMES\000\
  DIV\000\
  DPLUS\000\
  DMINUS\000\
  DTIMES\000\
  DDIV\000\
  MOD\000\
  EXP\000\
  CARAT\000\
  LT\000\
  GT\000\
  LEQ\000\
  GEQ\000\
  EQUALS\000\
  NEQ\000\
  PIPE\000\
  ARROW\000\
  SEMI\000\
  DSEMI\000\
  DCOLON\000\
  NIL\000\
  LET\000\
  REC\000\
  AND\000\
  IN\000\
  IF\000\
  THEN\000\
  ELSE\000\
  FUN\000\
  RAISE\000\
  TRY\000\
  WITH\000\
  NOT\000\
  LOGICALAND\000\
  LOGICALOR\000\
  LBRAC\000\
  RBRAC\000\
  LPAREN\000\
  RPAREN\000\
  COMMA\000\
  UNDERSCORE\000\
  UNIT\000\
  HEAD\000\
  TAIL\000\
  PRINT\000\
  FST\000\
  SND\000\
  EOF\000\
  "

let yynames_block = "\
  INT\000\
  FLOAT\000\
  STRING\000\
  IDENT\000\
  "

let yyact = [|
  (fun _ -> failwith "parser")
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'expression) in
    Obj.repr(
# 27 "student.mly"
                                 ( (Anon ( _1)) )
# 249 "student.ml"
               : Common.dec))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'expression) in
    Obj.repr(
# 28 "student.mly"
                                                  ( (Let (_2,_4)) )
# 257 "student.ml"
               : Common.dec))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 4 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _6 = (Parsing.peek_val __caml_parser_env 1 : 'expression) in
    Obj.repr(
# 29 "student.mly"
                                                   ( (LetRec (_3, _4, _6)) )
# 266 "student.ml"
               : Common.dec))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : 'nof) in
    Obj.repr(
# 32 "student.mly"
                        ( FunExp(_2, _4) )
# 274 "student.ml"
               : 'expression))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'nof) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'nofpm) in
    Obj.repr(
# 35 "student.mly"
                   ( BinOpAppExp(IntPlusOp, _1, _3) )
# 282 "student.ml"
               : 'nof))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'nof) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'nofpm) in
    Obj.repr(
# 36 "student.mly"
                    ( BinOpAppExp(IntMinusOp, _1, _3) )
# 290 "student.ml"
               : 'nof))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'nofpm) in
    Obj.repr(
# 37 "student.mly"
          ( _1 )
# 297 "student.ml"
               : 'nof))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'nofpm) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'ident_num) in
    Obj.repr(
# 40 "student.mly"
                          ( BinOpAppExp(IntTimesOp, _1, _3) )
# 305 "student.ml"
               : 'nofpm))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'ident_num) in
    Obj.repr(
# 41 "student.mly"
              ( _1 )
# 312 "student.ml"
               : 'nofpm))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 44 "student.mly"
        ( ConstExp( IntConst(_1) ) )
# 319 "student.ml"
               : 'ident_num))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 45 "student.mly"
          ( VarExp(_1) )
# 326 "student.ml"
               : 'ident_num))
(* Entry main *)
; (fun __caml_parser_env -> raise (Parsing.YYexit (Parsing.peek_val __caml_parser_env 0)))
|]
let yytables =
  { Parsing.actions=yyact;
    Parsing.transl_const=yytransl_const;
    Parsing.transl_block=yytransl_block;
    Parsing.lhs=yylhs;
    Parsing.len=yylen;
    Parsing.defred=yydefred;
    Parsing.dgoto=yydgoto;
    Parsing.sindex=yysindex;
    Parsing.rindex=yyrindex;
    Parsing.gindex=yygindex;
    Parsing.tablesize=yytablesize;
    Parsing.table=yytable;
    Parsing.check=yycheck;
    Parsing.error_function=parse_error;
    Parsing.names_const=yynames_const;
    Parsing.names_block=yynames_block }
let main (lexfun : Lexing.lexbuf -> token) (lexbuf : Lexing.lexbuf) =
   (Parsing.yyparse yytables 1 lexfun lexbuf : Common.dec)
