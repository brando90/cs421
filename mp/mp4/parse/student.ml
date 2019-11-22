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
\001\000\001\000\001\000\002\000\002\000\002\000\002\000\004\000\
\004\000\003\000\003\000\005\000\005\000\005\000\005\000\005\000\
\005\000\005\000\000\000"

let yylen = "\002\000\
\002\000\005\000\007\000\001\000\002\000\003\000\005\000\001\000\
\001\000\001\000\001\000\001\000\001\000\001\000\001\000\001\000\
\001\000\001\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\014\000\015\000\016\000\010\000\012\000\013\000\
\017\000\000\000\000\000\018\000\019\000\000\000\004\000\011\000\
\000\000\000\000\005\000\000\000\001\000\000\000\000\000\006\000\
\000\000\000\000\000\000\000\000\002\000\000\000\007\000\000\000\
\003\000"

let yydgoto = "\002\000\
\013\000\014\000\015\000\000\000\016\000"

let yysindex = "\017\000\
\255\254\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\015\255\005\255\000\000\000\000\251\254\000\000\000\000\
\001\255\021\255\000\000\229\254\000\000\011\255\022\255\000\000\
\011\255\000\255\004\255\240\254\000\000\011\255\000\000\008\255\
\000\000"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000"

let yygindex = "\000\000\
\000\000\009\000\000\000\000\000\000\000"

let yytablesize = 62
let yytable = "\003\000\
\004\000\005\000\006\000\007\000\008\000\003\000\004\000\005\000\
\006\000\007\000\008\000\003\000\004\000\005\000\006\000\007\000\
\008\000\001\000\017\000\020\000\024\000\025\000\021\000\022\000\
\023\000\027\000\030\000\029\000\009\000\010\000\026\000\031\000\
\000\000\028\000\009\000\033\000\000\000\000\000\032\000\000\000\
\009\000\000\000\000\000\000\000\000\000\011\000\018\000\000\000\
\000\000\012\000\000\000\011\000\019\000\000\000\000\000\012\000\
\000\000\011\000\000\000\000\000\000\000\012\000"

let yycheck = "\001\001\
\002\001\003\001\004\001\005\001\006\001\001\001\002\001\003\001\
\004\001\005\001\006\001\001\001\002\001\003\001\004\001\005\001\
\006\001\001\000\004\001\011\000\048\001\049\001\028\001\023\001\
\004\001\004\001\023\001\028\001\030\001\031\001\022\000\048\001\
\255\255\025\000\030\001\028\001\255\255\255\255\030\000\255\255\
\030\001\255\255\255\255\255\255\255\255\047\001\032\001\255\255\
\255\255\051\001\255\255\047\001\048\001\255\255\255\255\051\001\
\255\255\047\001\255\255\255\255\255\255\051\001"

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
# 29 "student.mly"
                                 ( (Anon ( _1)) )
# 260 "student.ml"
               : Common.dec))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'expression) in
    Obj.repr(
# 30 "student.mly"
                                                  ( (Let (_2,_4)) )
# 268 "student.ml"
               : Common.dec))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 4 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _6 = (Parsing.peek_val __caml_parser_env 1 : 'expression) in
    Obj.repr(
# 31 "student.mly"
                                                   ( (LetRec (_3, _4, _6)) )
# 277 "student.ml"
               : Common.dec))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'atomic_expression) in
    Obj.repr(
# 38 "student.mly"
                      ( _1 )
# 284 "student.ml"
               : 'expression))
; (fun __caml_parser_env ->
    Obj.repr(
# 40 "student.mly"
                  ( ConstExp(StringConst("()")))
# 290 "student.ml"
               : 'expression))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expression) in
    Obj.repr(
# 41 "student.mly"
                             ( _2 )
# 297 "student.ml"
               : 'expression))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : 'expression) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'expression) in
    Obj.repr(
# 42 "student.mly"
                                              ( BinOpAppExp(CommaOp, _2, _4) )
# 305 "student.ml"
               : 'expression))
; (fun __caml_parser_env ->
    Obj.repr(
# 45 "student.mly"
               ( None )
# 311 "student.ml"
               : 'pat))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 46 "student.mly"
         ( Some _1 )
# 318 "student.ml"
               : 'pat))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 49 "student.mly"
            ( VarExp _1 )
# 325 "student.ml"
               : 'atomic_expression))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'my_const) in
    Obj.repr(
# 50 "student.mly"
             ( _1 )
# 332 "student.ml"
               : 'atomic_expression))
; (fun __caml_parser_env ->
    Obj.repr(
# 53 "student.mly"
         ( ConstExp(BoolConst(true)) )
# 338 "student.ml"
               : 'my_const))
; (fun __caml_parser_env ->
    Obj.repr(
# 54 "student.mly"
          ( ConstExp(BoolConst(false)) )
# 344 "student.ml"
               : 'my_const))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 55 "student.mly"
        ( ConstExp(IntConst(_1)) )
# 351 "student.ml"
               : 'my_const))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : float) in
    Obj.repr(
# 56 "student.mly"
          ( ConstExp(FloatConst(_1)) )
# 358 "student.ml"
               : 'my_const))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 57 "student.mly"
           ( ConstExp(StringConst(_1)) )
# 365 "student.ml"
               : 'my_const))
; (fun __caml_parser_env ->
    Obj.repr(
# 58 "student.mly"
        ( ConstExp(NilConst) )
# 371 "student.ml"
               : 'my_const))
; (fun __caml_parser_env ->
    Obj.repr(
# 59 "student.mly"
         ( ConstExp(UnitConst) )
# 377 "student.ml"
               : 'my_const))
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
