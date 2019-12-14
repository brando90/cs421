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
\001\000\001\000\001\000\002\000\002\000\002\000\004\000\004\000\
\006\000\006\000\003\000\003\000\003\000\007\000\007\000\005\000\
\005\000\005\000\000\000"

let yylen = "\002\000\
\002\000\005\000\007\000\003\000\003\000\001\000\003\000\001\000\
\006\000\001\000\003\000\003\000\001\000\003\000\001\000\001\000\
\001\000\003\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\017\000\016\000\000\000\000\000\019\000\000\000\
\000\000\006\000\000\000\008\000\013\000\000\000\000\000\000\000\
\000\000\001\000\000\000\000\000\000\000\000\000\000\000\000\000\
\018\000\004\000\011\000\005\000\012\000\007\000\014\000\000\000\
\000\000\000\000\002\000\000\000\000\000\000\000\009\000\000\000\
\003\000"

let yydgoto = "\002\000\
\007\000\008\000\009\000\010\000\011\000\012\000\013\000"

let yysindex = "\007\000\
\254\254\000\000\000\000\000\000\002\255\255\254\000\000\247\254\
\005\255\000\000\004\255\000\000\000\000\000\255\018\255\020\255\
\237\254\000\000\255\254\255\254\255\254\255\254\024\255\008\255\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\235\254\
\009\255\255\254\000\000\255\254\255\254\001\255\000\000\013\255\
\000\000"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\248\254\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000"

let yygindex = "\000\000\
\000\000\003\000\000\000\247\255\000\000\000\000\251\255"

let yytablesize = 44
let yytable = "\003\000\
\003\000\004\000\004\000\015\000\015\000\014\000\035\000\001\000\
\017\000\026\000\028\000\030\000\036\000\027\000\029\000\031\000\
\019\000\020\000\018\000\010\000\021\000\023\000\022\000\024\000\
\032\000\010\000\025\000\033\000\005\000\016\000\034\000\037\000\
\000\000\015\000\036\000\000\000\038\000\010\000\039\000\040\000\
\041\000\000\000\006\000\006\000"

let yycheck = "\002\001\
\002\001\004\001\004\001\012\001\013\001\004\001\028\001\001\000\
\006\000\019\000\020\000\021\000\034\001\019\000\020\000\021\000\
\012\001\013\001\028\001\028\001\017\001\004\001\023\001\004\001\
\022\000\034\001\046\001\004\001\031\001\031\001\023\001\023\001\
\255\255\032\001\034\001\255\255\034\000\046\001\036\000\037\000\
\028\001\255\255\045\001\045\001"

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
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'exp) in
    Obj.repr(
# 29 "student.mly"
                         ( (Anon ( _1)) )
# 259 "student.ml"
               : Common.dec))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'exp) in
    Obj.repr(
# 30 "student.mly"
                                           ( (Let (_2,_4)) )
# 267 "student.ml"
               : Common.dec))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 4 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _6 = (Parsing.peek_val __caml_parser_env 1 : 'exp) in
    Obj.repr(
# 31 "student.mly"
                                            ( (LetRec (_3, _4, _6)) )
# 276 "student.ml"
               : Common.dec))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'pure_exp) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'next) in
    Obj.repr(
# 34 "student.mly"
                        (  BinOpAppExp(FloatPlusOp, _1, _3) )
# 284 "student.ml"
               : 'exp))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'pure_exp) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'next) in
    Obj.repr(
# 35 "student.mly"
                         (  BinOpAppExp(FloatMinusOp, _1, _3) )
# 292 "student.ml"
               : 'exp))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'next) in
    Obj.repr(
# 36 "student.mly"
         ( _1 )
# 299 "student.ml"
               : 'exp))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'atomic) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'next) in
    Obj.repr(
# 39 "student.mly"
                    ( BinOpAppExp(ExpoOp, _1, _3) )
# 307 "student.ml"
               : 'next))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'deal_letin) in
    Obj.repr(
# 40 "student.mly"
               ( _1 )
# 314 "student.ml"
               : 'next))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 4 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 2 : 'exp) in
    let _6 = (Parsing.peek_val __caml_parser_env 0 : 'exp) in
    Obj.repr(
# 43 "student.mly"
                                ( LetInExp(_2, _4, _6) )
# 323 "student.ml"
               : 'deal_letin))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'atomic) in
    Obj.repr(
# 44 "student.mly"
           ( _1 )
# 330 "student.ml"
               : 'deal_letin))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'pure_exp) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'pure_next) in
    Obj.repr(
# 47 "student.mly"
                             ( BinOpAppExp(FloatPlusOp, _1, _3) )
# 338 "student.ml"
               : 'pure_exp))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'pure_exp) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'pure_next) in
    Obj.repr(
# 48 "student.mly"
                              ( BinOpAppExp(FloatMinusOp, _1, _3) )
# 346 "student.ml"
               : 'pure_exp))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'pure_next) in
    Obj.repr(
# 49 "student.mly"
              ( _1 )
# 353 "student.ml"
               : 'pure_exp))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'atomic) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'pure_next) in
    Obj.repr(
# 52 "student.mly"
                         ( BinOpAppExp(ExpoOp, _1, _3) )
# 361 "student.ml"
               : 'pure_next))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'atomic) in
    Obj.repr(
# 53 "student.mly"
           ( _1 )
# 368 "student.ml"
               : 'pure_next))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 56 "student.mly"
          ( VarExp _1 )
# 375 "student.ml"
               : 'atomic))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : float) in
    Obj.repr(
# 57 "student.mly"
          ( ConstExp( FloatConst(_1) ) )
# 382 "student.ml"
               : 'atomic))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'exp) in
    Obj.repr(
# 58 "student.mly"
                    ( _2 )
# 389 "student.ml"
               : 'atomic))
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
