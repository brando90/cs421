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
(* Typically used for:
- give type
- give functions
needed for semantic actions of rules (and throw special errors)
*)
(* You may want to add extra code here *)

# 72 "student.ml"
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
\001\000\001\000\001\000\002\000\002\000\003\000\003\000\005\000\
\005\000\006\000\006\000\007\000\007\000\008\000\008\000\009\000\
\009\000\010\000\010\000\010\000\010\000\010\000\010\000\010\000\
\011\000\011\000\012\000\012\000\012\000\012\000\012\000\012\000\
\013\000\013\000\013\000\013\000\013\000\013\000\014\000\014\000\
\015\000\015\000\016\000\016\000\017\000\017\000\017\000\017\000\
\017\000\017\000\019\000\019\000\018\000\018\000\018\000\004\000\
\020\000\020\000\020\000\020\000\020\000\020\000\020\000\020\000\
\000\000"

let yylen = "\002\000\
\002\000\005\000\007\000\005\000\001\000\008\000\001\000\006\000\
\001\000\004\000\001\000\006\000\001\000\003\000\001\000\003\000\
\001\000\003\000\003\000\003\000\003\000\003\000\003\000\001\000\
\003\000\001\000\003\000\003\000\003\000\003\000\003\000\001\000\
\003\000\003\000\003\000\003\000\003\000\001\000\003\000\001\000\
\002\000\001\000\002\000\001\000\002\000\002\000\002\000\002\000\
\002\000\001\000\001\000\001\000\001\000\001\000\003\000\001\000\
\001\000\001\000\001\000\001\000\001\000\001\000\001\000\002\000\
\002\000"

let yydefred = "\000\000\
\000\000\000\000\059\000\060\000\061\000\053\000\057\000\058\000\
\062\000\000\000\000\000\000\000\000\000\000\000\063\000\000\000\
\000\000\000\000\000\000\000\000\065\000\000\000\005\000\007\000\
\009\000\011\000\000\000\000\000\000\000\024\000\000\000\000\000\
\038\000\000\000\000\000\044\000\050\000\054\000\000\000\000\000\
\000\000\000\000\000\000\000\000\041\000\000\000\064\000\000\000\
\047\000\048\000\049\000\045\000\046\000\001\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\043\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\055\000\000\000\000\000\000\000\019\000\
\020\000\021\000\022\000\018\000\023\000\000\000\000\000\000\000\
\000\000\000\000\025\000\033\000\035\000\034\000\036\000\037\000\
\039\000\000\000\000\000\000\000\000\000\000\000\000\000\010\000\
\000\000\002\000\000\000\000\000\000\000\000\000\004\000\000\000\
\000\000\008\000\012\000\003\000\000\000\006\000"

let yydgoto = "\002\000\
\021\000\022\000\023\000\041\000\024\000\025\000\026\000\027\000\
\028\000\029\000\030\000\031\000\032\000\033\000\034\000\035\000\
\036\000\037\000\000\000\038\000"

let yysindex = "\011\000\
\073\255\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\006\255\215\255\000\000\225\255\002\255\000\000\025\000\
\025\000\025\000\025\000\025\000\000\000\244\254\000\000\000\000\
\000\000\000\000\234\254\240\254\077\255\000\000\053\255\003\255\
\000\000\011\255\025\000\000\000\000\000\000\000\016\255\030\255\
\025\255\002\255\015\255\026\255\000\000\027\255\000\000\233\254\
\000\000\000\000\000\000\000\000\000\000\000\000\225\255\225\255\
\225\255\225\255\225\255\225\255\225\255\225\255\225\255\225\255\
\225\255\225\255\225\255\225\255\225\255\225\255\225\255\225\255\
\225\255\225\255\000\000\083\255\056\255\000\000\139\255\019\255\
\215\255\205\255\000\000\000\000\083\255\240\254\077\255\000\000\
\000\000\000\000\000\000\000\000\000\000\003\255\003\255\003\255\
\003\255\003\255\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\036\255\046\255\057\255\000\000\047\255\068\255\000\000\
\035\255\000\000\083\255\149\255\139\255\215\255\000\000\062\255\
\072\255\000\000\000\000\000\000\149\255\000\000"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\017\000\243\254\075\001\000\000\013\000\149\000\
\000\000\116\000\074\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\109\001\092\001\000\000\
\000\000\000\000\000\000\000\000\000\000\182\000\215\000\248\000\
\025\001\058\001\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000"

let yygindex = "\000\000\
\000\000\243\255\151\255\246\255\186\255\027\000\245\255\000\000\
\060\000\061\000\099\000\000\000\235\255\078\002\103\000\000\000\
\075\000\000\000\000\000\000\000"

let yytablesize = 670
let yytable = "\043\000\
\048\000\044\000\003\000\004\000\005\000\006\000\007\000\008\000\
\110\000\039\000\121\000\001\000\069\000\070\000\015\000\054\000\
\071\000\072\000\073\000\126\000\015\000\055\000\015\000\015\000\
\084\000\085\000\056\000\074\000\080\000\078\000\015\000\009\000\
\046\000\077\000\015\000\015\000\011\000\040\000\076\000\012\000\
\013\000\094\000\095\000\096\000\097\000\098\000\122\000\079\000\
\014\000\047\000\081\000\082\000\015\000\016\000\017\000\018\000\
\019\000\020\000\083\000\107\000\063\000\064\000\106\000\114\000\
\065\000\066\000\084\000\108\000\115\000\111\000\067\000\113\000\
\078\000\003\000\004\000\005\000\006\000\007\000\008\000\116\000\
\117\000\068\000\119\000\003\000\004\000\005\000\006\000\007\000\
\008\000\124\000\049\000\050\000\051\000\052\000\053\000\057\000\
\058\000\059\000\060\000\061\000\062\000\120\000\009\000\010\000\
\118\000\125\000\123\000\011\000\112\000\075\000\012\000\013\000\
\009\000\046\000\086\000\045\000\087\000\011\000\000\000\014\000\
\012\000\013\000\000\000\015\000\016\000\017\000\018\000\019\000\
\020\000\014\000\000\000\000\000\000\000\015\000\016\000\017\000\
\018\000\019\000\020\000\003\000\004\000\005\000\006\000\007\000\
\008\000\000\000\000\000\000\000\000\000\003\000\004\000\005\000\
\006\000\007\000\008\000\088\000\089\000\090\000\091\000\092\000\
\093\000\000\000\000\000\000\000\000\000\000\000\099\000\000\000\
\009\000\109\000\000\000\000\000\000\000\011\000\000\000\000\000\
\012\000\013\000\009\000\046\000\000\000\000\000\000\000\011\000\
\000\000\042\000\012\000\013\000\000\000\015\000\016\000\017\000\
\018\000\019\000\020\000\042\000\000\000\000\000\000\000\015\000\
\016\000\017\000\018\000\019\000\020\000\003\000\004\000\005\000\
\006\000\007\000\008\000\000\000\000\000\000\000\000\000\003\000\
\004\000\005\000\006\000\007\000\008\000\000\000\000\000\000\000\
\000\000\003\000\004\000\005\000\006\000\007\000\008\000\000\000\
\000\000\000\000\009\000\000\000\000\000\000\000\000\000\011\000\
\000\000\000\000\012\000\013\000\009\000\000\000\000\000\000\000\
\000\000\011\000\000\000\042\000\000\000\013\000\009\000\015\000\
\016\000\017\000\018\000\019\000\020\000\042\000\000\000\013\000\
\000\000\015\000\016\000\017\000\018\000\019\000\020\000\042\000\
\000\000\000\000\000\000\015\000\016\000\017\000\018\000\019\000\
\020\000\003\000\004\000\005\000\006\000\007\000\008\000\026\000\
\026\000\026\000\026\000\026\000\026\000\000\000\000\000\000\000\
\026\000\000\000\000\000\000\000\013\000\000\000\026\000\000\000\
\026\000\026\000\013\000\000\000\013\000\013\000\009\000\026\000\
\026\000\000\000\000\000\000\000\026\000\026\000\000\000\000\000\
\013\000\013\000\000\000\000\000\000\000\000\000\000\000\042\000\
\000\000\000\000\000\000\015\000\016\000\017\000\018\000\019\000\
\020\000\042\000\042\000\042\000\042\000\042\000\042\000\042\000\
\042\000\042\000\042\000\042\000\042\000\042\000\042\000\042\000\
\042\000\042\000\000\000\000\000\000\000\042\000\042\000\000\000\
\000\000\000\000\000\000\042\000\000\000\042\000\042\000\000\000\
\000\000\000\000\000\000\000\000\042\000\042\000\000\000\000\000\
\000\000\042\000\042\000\040\000\040\000\040\000\040\000\040\000\
\040\000\040\000\040\000\040\000\000\000\040\000\040\000\040\000\
\040\000\040\000\040\000\040\000\000\000\000\000\000\000\040\000\
\040\000\000\000\000\000\000\000\000\000\040\000\000\000\040\000\
\040\000\000\000\000\000\000\000\032\000\032\000\040\000\040\000\
\032\000\032\000\000\000\040\000\040\000\000\000\032\000\032\000\
\032\000\032\000\032\000\032\000\032\000\000\000\000\000\000\000\
\032\000\032\000\000\000\000\000\000\000\000\000\032\000\000\000\
\032\000\032\000\000\000\000\000\000\000\027\000\027\000\032\000\
\032\000\027\000\027\000\000\000\032\000\032\000\000\000\027\000\
\027\000\027\000\027\000\027\000\027\000\027\000\000\000\000\000\
\000\000\027\000\027\000\000\000\000\000\000\000\000\000\027\000\
\000\000\027\000\027\000\000\000\000\000\000\000\029\000\029\000\
\027\000\027\000\029\000\029\000\000\000\027\000\027\000\000\000\
\029\000\029\000\029\000\029\000\029\000\029\000\029\000\000\000\
\000\000\000\000\029\000\029\000\000\000\000\000\000\000\000\000\
\029\000\000\000\029\000\029\000\000\000\000\000\000\000\028\000\
\028\000\029\000\029\000\028\000\028\000\000\000\029\000\029\000\
\000\000\028\000\028\000\028\000\028\000\028\000\028\000\028\000\
\000\000\000\000\000\000\028\000\028\000\000\000\000\000\000\000\
\000\000\028\000\000\000\028\000\028\000\000\000\000\000\000\000\
\030\000\030\000\028\000\028\000\030\000\030\000\000\000\028\000\
\028\000\000\000\030\000\030\000\030\000\030\000\030\000\030\000\
\030\000\000\000\000\000\000\000\030\000\030\000\000\000\000\000\
\000\000\000\000\030\000\000\000\030\000\030\000\000\000\000\000\
\000\000\031\000\031\000\030\000\030\000\031\000\031\000\000\000\
\030\000\030\000\000\000\031\000\031\000\031\000\031\000\031\000\
\031\000\031\000\000\000\000\000\000\000\031\000\031\000\000\000\
\000\000\000\000\000\000\031\000\000\000\031\000\031\000\000\000\
\000\000\000\000\000\000\000\000\031\000\031\000\017\000\000\000\
\000\000\031\000\031\000\000\000\017\000\000\000\017\000\017\000\
\000\000\000\000\000\000\000\000\000\000\017\000\017\000\016\000\
\000\000\000\000\017\000\017\000\000\000\016\000\000\000\016\000\
\016\000\000\000\000\000\000\000\000\000\000\000\016\000\016\000\
\014\000\000\000\000\000\016\000\016\000\000\000\014\000\000\000\
\014\000\014\000\100\000\101\000\102\000\103\000\104\000\105\000\
\014\000\000\000\000\000\000\000\014\000\014\000"

let yycheck = "\011\000\
\014\000\012\000\001\001\002\001\003\001\004\001\005\001\006\001\
\079\000\004\001\116\000\001\000\010\001\011\001\028\001\028\001\
\014\001\015\001\016\001\125\000\034\001\044\001\036\001\037\001\
\048\001\049\001\043\001\017\001\042\000\040\000\044\001\030\001\
\031\001\004\001\048\001\049\001\035\001\032\001\023\001\038\001\
\039\001\063\000\064\000\065\000\066\000\067\000\117\000\023\001\
\047\001\048\001\036\001\026\001\051\001\052\001\053\001\054\001\
\055\001\056\001\032\001\004\001\008\001\009\001\076\000\028\001\
\012\001\013\001\048\001\078\000\023\001\081\000\018\001\085\000\
\083\000\001\001\002\001\003\001\004\001\005\001\006\001\023\001\
\034\001\029\001\048\001\001\001\002\001\003\001\004\001\005\001\
\006\001\028\001\016\000\017\000\018\000\019\000\020\000\019\001\
\020\001\021\001\022\001\023\001\024\001\115\000\030\001\031\001\
\037\001\034\001\118\000\035\001\082\000\035\000\038\001\039\001\
\030\001\031\001\055\000\013\000\056\000\035\001\255\255\047\001\
\038\001\039\001\255\255\051\001\052\001\053\001\054\001\055\001\
\056\001\047\001\255\255\255\255\255\255\051\001\052\001\053\001\
\054\001\055\001\056\001\001\001\002\001\003\001\004\001\005\001\
\006\001\255\255\255\255\255\255\255\255\001\001\002\001\003\001\
\004\001\005\001\006\001\057\000\058\000\059\000\060\000\061\000\
\062\000\255\255\255\255\255\255\255\255\255\255\068\000\255\255\
\030\001\031\001\255\255\255\255\255\255\035\001\255\255\255\255\
\038\001\039\001\030\001\031\001\255\255\255\255\255\255\035\001\
\255\255\047\001\038\001\039\001\255\255\051\001\052\001\053\001\
\054\001\055\001\056\001\047\001\255\255\255\255\255\255\051\001\
\052\001\053\001\054\001\055\001\056\001\001\001\002\001\003\001\
\004\001\005\001\006\001\255\255\255\255\255\255\255\255\001\001\
\002\001\003\001\004\001\005\001\006\001\255\255\255\255\255\255\
\255\255\001\001\002\001\003\001\004\001\005\001\006\001\255\255\
\255\255\255\255\030\001\255\255\255\255\255\255\255\255\035\001\
\255\255\255\255\038\001\039\001\030\001\255\255\255\255\255\255\
\255\255\035\001\255\255\047\001\255\255\039\001\030\001\051\001\
\052\001\053\001\054\001\055\001\056\001\047\001\255\255\039\001\
\255\255\051\001\052\001\053\001\054\001\055\001\056\001\047\001\
\255\255\255\255\255\255\051\001\052\001\053\001\054\001\055\001\
\056\001\001\001\002\001\003\001\004\001\005\001\006\001\019\001\
\020\001\021\001\022\001\023\001\024\001\255\255\255\255\255\255\
\028\001\255\255\255\255\255\255\028\001\255\255\034\001\255\255\
\036\001\037\001\034\001\255\255\036\001\037\001\030\001\043\001\
\044\001\255\255\255\255\255\255\048\001\049\001\255\255\255\255\
\048\001\049\001\255\255\255\255\255\255\255\255\255\255\047\001\
\255\255\255\255\255\255\051\001\052\001\053\001\054\001\055\001\
\056\001\008\001\009\001\010\001\011\001\012\001\013\001\014\001\
\015\001\016\001\017\001\018\001\019\001\020\001\021\001\022\001\
\023\001\024\001\255\255\255\255\255\255\028\001\029\001\255\255\
\255\255\255\255\255\255\034\001\255\255\036\001\037\001\255\255\
\255\255\255\255\255\255\255\255\043\001\044\001\255\255\255\255\
\255\255\048\001\049\001\008\001\009\001\010\001\011\001\012\001\
\013\001\014\001\015\001\016\001\255\255\018\001\019\001\020\001\
\021\001\022\001\023\001\024\001\255\255\255\255\255\255\028\001\
\029\001\255\255\255\255\255\255\255\255\034\001\255\255\036\001\
\037\001\255\255\255\255\255\255\008\001\009\001\043\001\044\001\
\012\001\013\001\255\255\048\001\049\001\255\255\018\001\019\001\
\020\001\021\001\022\001\023\001\024\001\255\255\255\255\255\255\
\028\001\029\001\255\255\255\255\255\255\255\255\034\001\255\255\
\036\001\037\001\255\255\255\255\255\255\008\001\009\001\043\001\
\044\001\012\001\013\001\255\255\048\001\049\001\255\255\018\001\
\019\001\020\001\021\001\022\001\023\001\024\001\255\255\255\255\
\255\255\028\001\029\001\255\255\255\255\255\255\255\255\034\001\
\255\255\036\001\037\001\255\255\255\255\255\255\008\001\009\001\
\043\001\044\001\012\001\013\001\255\255\048\001\049\001\255\255\
\018\001\019\001\020\001\021\001\022\001\023\001\024\001\255\255\
\255\255\255\255\028\001\029\001\255\255\255\255\255\255\255\255\
\034\001\255\255\036\001\037\001\255\255\255\255\255\255\008\001\
\009\001\043\001\044\001\012\001\013\001\255\255\048\001\049\001\
\255\255\018\001\019\001\020\001\021\001\022\001\023\001\024\001\
\255\255\255\255\255\255\028\001\029\001\255\255\255\255\255\255\
\255\255\034\001\255\255\036\001\037\001\255\255\255\255\255\255\
\008\001\009\001\043\001\044\001\012\001\013\001\255\255\048\001\
\049\001\255\255\018\001\019\001\020\001\021\001\022\001\023\001\
\024\001\255\255\255\255\255\255\028\001\029\001\255\255\255\255\
\255\255\255\255\034\001\255\255\036\001\037\001\255\255\255\255\
\255\255\008\001\009\001\043\001\044\001\012\001\013\001\255\255\
\048\001\049\001\255\255\018\001\019\001\020\001\021\001\022\001\
\023\001\024\001\255\255\255\255\255\255\028\001\029\001\255\255\
\255\255\255\255\255\255\034\001\255\255\036\001\037\001\255\255\
\255\255\255\255\255\255\255\255\043\001\044\001\028\001\255\255\
\255\255\048\001\049\001\255\255\034\001\255\255\036\001\037\001\
\255\255\255\255\255\255\255\255\255\255\043\001\044\001\028\001\
\255\255\255\255\048\001\049\001\255\255\034\001\255\255\036\001\
\037\001\255\255\255\255\255\255\255\255\255\255\043\001\044\001\
\028\001\255\255\255\255\048\001\049\001\255\255\034\001\255\255\
\036\001\037\001\069\000\070\000\071\000\072\000\073\000\074\000\
\044\001\255\255\255\255\255\255\048\001\049\001"

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
# 31 "student.mly"
                                 ( (Anon ( _1)) )
# 465 "student.ml"
               : Common.dec))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'expression) in
    Obj.repr(
# 32 "student.mly"
                                                  ( (Let (_2,_4)) )
# 473 "student.ml"
               : Common.dec))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 4 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _6 = (Parsing.peek_val __caml_parser_env 1 : 'expression) in
    Obj.repr(
# 33 "student.mly"
                                                   ( (LetRec (_3, _4, _6)) )
# 482 "student.ml"
               : Common.dec))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : 'expression) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'expression) in
    Obj.repr(
# 40 "student.mly"
                                              ( BinOpAppExp(CommaOp, _2, _4) )
# 490 "student.ml"
               : 'expression))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'letrecin_14_prec) in
    Obj.repr(
# 41 "student.mly"
                     ( _1 )
# 497 "student.ml"
               : 'expression))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 5 : 'var) in
    let _4 = (Parsing.peek_val __caml_parser_env 4 : 'var) in
    let _6 = (Parsing.peek_val __caml_parser_env 2 : 'letrecin_14_prec) in
    let _8 = (Parsing.peek_val __caml_parser_env 0 : 'letrecin_14_prec) in
    Obj.repr(
# 48 "student.mly"
                                                                ( LetRecInExp(_3, _4, _6, _8) )
# 507 "student.ml"
               : 'letrecin_14_prec))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'letin_13_prec) in
    Obj.repr(
# 49 "student.mly"
                  ( _1 )
# 514 "student.ml"
               : 'letrecin_14_prec))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 4 : 'var) in
    let _4 = (Parsing.peek_val __caml_parser_env 2 : 'letin_13_prec) in
    let _6 = (Parsing.peek_val __caml_parser_env 0 : 'letin_13_prec) in
    Obj.repr(
# 52 "student.mly"
                                                  ( LetInExp(_2, _4, _6) )
# 523 "student.ml"
               : 'letin_13_prec))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'fun_12_prec) in
    Obj.repr(
# 53 "student.mly"
                ( _1 )
# 530 "student.ml"
               : 'letin_13_prec))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 2 : 'var) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : 'fun_12_prec) in
    Obj.repr(
# 56 "student.mly"
                              ( FunExp(_2, _4) )
# 538 "student.ml"
               : 'fun_12_prec))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'ifthenelse_11th_prec) in
    Obj.repr(
# 57 "student.mly"
                         ( _1 )
# 545 "student.ml"
               : 'fun_12_prec))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 4 : 'ifthenelse_11th_prec) in
    let _4 = (Parsing.peek_val __caml_parser_env 2 : 'ifthenelse_11th_prec) in
    let _6 = (Parsing.peek_val __caml_parser_env 0 : 'ifthenelse_11th_prec) in
    Obj.repr(
# 60 "student.mly"
                                                                                ( IfExp(_2, _4, _6))
# 554 "student.ml"
               : 'ifthenelse_11th_prec))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'or_10th_highest_prec) in
    Obj.repr(
# 61 "student.mly"
                         ( _1 )
# 561 "student.ml"
               : 'ifthenelse_11th_prec))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'or_10th_highest_prec) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'and_9th_highest_prec) in
    Obj.repr(
# 65 "student.mly"
                                                        ( IfExp(_1, ConstExp(BoolConst true), _3) )
# 569 "student.ml"
               : 'or_10th_highest_prec))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'and_9th_highest_prec) in
    Obj.repr(
# 66 "student.mly"
                         ( _1 )
# 576 "student.ml"
               : 'or_10th_highest_prec))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'and_9th_highest_prec) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'logical_8th_highest_prec) in
    Obj.repr(
# 70 "student.mly"
                                                             ( IfExp( _1, _3, ConstExp (BoolConst false)) )
# 584 "student.ml"
               : 'and_9th_highest_prec))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'logical_8th_highest_prec) in
    Obj.repr(
# 71 "student.mly"
                             ( _1 )
# 591 "student.ml"
               : 'and_9th_highest_prec))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'logical_8th_highest_prec) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'cons_7th_highest_prec) in
    Obj.repr(
# 75 "student.mly"
                                                          ( BinOpAppExp( EqOp, _1, _3) )
# 599 "student.ml"
               : 'logical_8th_highest_prec))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'logical_8th_highest_prec) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'cons_7th_highest_prec) in
    Obj.repr(
# 76 "student.mly"
                                                      ( BinOpAppExp( GreaterOp, _3, _1) )
# 607 "student.ml"
               : 'logical_8th_highest_prec))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'logical_8th_highest_prec) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'cons_7th_highest_prec) in
    Obj.repr(
# 77 "student.mly"
                                                      ( BinOpAppExp( GreaterOp, _1, _3) )
# 615 "student.ml"
               : 'logical_8th_highest_prec))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'logical_8th_highest_prec) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'cons_7th_highest_prec) in
    Obj.repr(
# 78 "student.mly"
                                                       ( IfExp(_1 , ConstExp( BoolConst true), _3) )
# 623 "student.ml"
               : 'logical_8th_highest_prec))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'logical_8th_highest_prec) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'cons_7th_highest_prec) in
    Obj.repr(
# 79 "student.mly"
                                                       ( IfExp(_1 , ConstExp( BoolConst true), _3) )
# 631 "student.ml"
               : 'logical_8th_highest_prec))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'logical_8th_highest_prec) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'cons_7th_highest_prec) in
    Obj.repr(
# 80 "student.mly"
                                                       ( IfExp( BinOpAppExp( EqOp, _1, _3 ), ConstExp( BoolConst false), ConstExp( BoolConst true) ) )
# 639 "student.ml"
               : 'logical_8th_highest_prec))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'cons_7th_highest_prec) in
    Obj.repr(
# 81 "student.mly"
                          ( _1 )
# 646 "student.ml"
               : 'logical_8th_highest_prec))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'arith_ops_low_prec_6th_highest_prec) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'cons_7th_highest_prec) in
    Obj.repr(
# 85 "student.mly"
                                                                     ( BinOpAppExp( ConsOp, _1, _3) )
# 654 "student.ml"
               : 'cons_7th_highest_prec))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'arith_ops_low_prec_6th_highest_prec) in
    Obj.repr(
# 86 "student.mly"
                                        ( _1 )
# 661 "student.ml"
               : 'cons_7th_highest_prec))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'arith_ops_low_prec_6th_highest_prec) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'arith_ops_high_prec_5th_highest_prec) in
    Obj.repr(
# 90 "student.mly"
                                                                                  ( BinOpAppExp( IntPlusOp,_1, _3) )
# 669 "student.ml"
               : 'arith_ops_low_prec_6th_highest_prec))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'arith_ops_low_prec_6th_highest_prec) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'arith_ops_high_prec_5th_highest_prec) in
    Obj.repr(
# 91 "student.mly"
                                                                                   ( BinOpAppExp(FloatPlusOp,_1, _3) )
# 677 "student.ml"
               : 'arith_ops_low_prec_6th_highest_prec))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'arith_ops_low_prec_6th_highest_prec) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'arith_ops_high_prec_5th_highest_prec) in
    Obj.repr(
# 92 "student.mly"
                                                                                   ( BinOpAppExp(IntMinusOp,_1, _3) )
# 685 "student.ml"
               : 'arith_ops_low_prec_6th_highest_prec))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'arith_ops_low_prec_6th_highest_prec) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'arith_ops_high_prec_5th_highest_prec) in
    Obj.repr(
# 93 "student.mly"
                                                                                    ( BinOpAppExp(FloatMinusOp,_1, _3) )
# 693 "student.ml"
               : 'arith_ops_low_prec_6th_highest_prec))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'arith_ops_low_prec_6th_highest_prec) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'arith_ops_high_prec_5th_highest_prec) in
    Obj.repr(
# 94 "student.mly"
                                                                                   ( BinOpAppExp(ConcatOp,_1, _3) )
# 701 "student.ml"
               : 'arith_ops_low_prec_6th_highest_prec))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'arith_ops_high_prec_5th_highest_prec) in
    Obj.repr(
# 95 "student.mly"
                                         ( _1 )
# 708 "student.ml"
               : 'arith_ops_low_prec_6th_highest_prec))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'arith_ops_high_prec_5th_highest_prec) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'exponentiation_4th_highest_prec) in
    Obj.repr(
# 99 "student.mly"
                                                                               ( BinOpAppExp(IntTimesOp,_1,_3) )
# 716 "student.ml"
               : 'arith_ops_high_prec_5th_highest_prec))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'arith_ops_high_prec_5th_highest_prec) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'exponentiation_4th_highest_prec) in
    Obj.repr(
# 100 "student.mly"
                                                                                ( BinOpAppExp(FloatTimesOp,_1, _3) )
# 724 "student.ml"
               : 'arith_ops_high_prec_5th_highest_prec))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'arith_ops_high_prec_5th_highest_prec) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'exponentiation_4th_highest_prec) in
    Obj.repr(
# 101 "student.mly"
                                                                             ( BinOpAppExp(IntDivOp,_1, _3) )
# 732 "student.ml"
               : 'arith_ops_high_prec_5th_highest_prec))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'arith_ops_high_prec_5th_highest_prec) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'exponentiation_4th_highest_prec) in
    Obj.repr(
# 102 "student.mly"
                                                                              ( BinOpAppExp(FloatDivOp,_1, _3) )
# 740 "student.ml"
               : 'arith_ops_high_prec_5th_highest_prec))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'arith_ops_high_prec_5th_highest_prec) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'exponentiation_4th_highest_prec) in
    Obj.repr(
# 103 "student.mly"
                                                                             ( BinOpAppExp(ModOp,_1, _3) )
# 748 "student.ml"
               : 'arith_ops_high_prec_5th_highest_prec))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'exponentiation_4th_highest_prec) in
    Obj.repr(
# 104 "student.mly"
                                    ( _1 )
# 755 "student.ml"
               : 'arith_ops_high_prec_5th_highest_prec))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'raise_3rd_highest_prec) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'exponentiation_4th_highest_prec) in
    Obj.repr(
# 108 "student.mly"
                                                               ( BinOpAppExp( ExpoOp, _1, _3) )
# 763 "student.ml"
               : 'exponentiation_4th_highest_prec))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'raise_3rd_highest_prec) in
    Obj.repr(
# 109 "student.mly"
                           ( _1 )
# 770 "student.ml"
               : 'exponentiation_4th_highest_prec))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'raise_3rd_highest_prec) in
    Obj.repr(
# 112 "student.mly"
                                 ( RaiseExp( _2 ) )
# 777 "student.ml"
               : 'raise_3rd_highest_prec))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'app_2nd_highest_prec) in
    Obj.repr(
# 113 "student.mly"
                         ( _1 )
# 784 "student.ml"
               : 'raise_3rd_highest_prec))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'app_2nd_highest_prec) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'highest_1st_prec) in
    Obj.repr(
# 117 "student.mly"
                                          ( AppExp(_1, _2) )
# 792 "student.ml"
               : 'app_2nd_highest_prec))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'highest_1st_prec) in
    Obj.repr(
# 118 "student.mly"
                     ( _1 )
# 799 "student.ml"
               : 'app_2nd_highest_prec))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'highest_1st_prec) in
    Obj.repr(
# 121 "student.mly"
                         ( MonOpAppExp( FstOp, _2 ) )
# 806 "student.ml"
               : 'highest_1st_prec))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'highest_1st_prec) in
    Obj.repr(
# 122 "student.mly"
                         ( MonOpAppExp( SndOp, _2 ) )
# 813 "student.ml"
               : 'highest_1st_prec))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'highest_1st_prec) in
    Obj.repr(
# 123 "student.mly"
                          ( MonOpAppExp( HdOp, _2 ) )
# 820 "student.ml"
               : 'highest_1st_prec))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'highest_1st_prec) in
    Obj.repr(
# 124 "student.mly"
                          ( MonOpAppExp( TlOp, _2 ) )
# 827 "student.ml"
               : 'highest_1st_prec))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'highest_1st_prec) in
    Obj.repr(
# 125 "student.mly"
                           ( MonOpAppExp( PrintOp, _2 ) )
# 834 "student.ml"
               : 'highest_1st_prec))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'atomic_expression) in
    Obj.repr(
# 126 "student.mly"
                      ( _1 )
# 841 "student.ml"
               : 'highest_1st_prec))
; (fun __caml_parser_env ->
    Obj.repr(
# 129 "student.mly"
               ( None )
# 847 "student.ml"
               : 'pat))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 130 "student.mly"
         ( Some _1 )
# 854 "student.ml"
               : 'pat))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 133 "student.mly"
            ( VarExp _1 )
# 861 "student.ml"
               : 'atomic_expression))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'my_const) in
    Obj.repr(
# 135 "student.mly"
             ( _1 )
# 868 "student.ml"
               : 'atomic_expression))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expression) in
    Obj.repr(
# 136 "student.mly"
                             ( _2 )
# 875 "student.ml"
               : 'atomic_expression))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'var) in
    Obj.repr(
# 140 "student.mly"
          ( _1 )
# 882 "student.ml"
               : 'var))
; (fun __caml_parser_env ->
    Obj.repr(
# 143 "student.mly"
         ( ConstExp(BoolConst(true)) )
# 888 "student.ml"
               : 'my_const))
; (fun __caml_parser_env ->
    Obj.repr(
# 144 "student.mly"
          ( ConstExp(BoolConst(false)) )
# 894 "student.ml"
               : 'my_const))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 145 "student.mly"
        ( ConstExp(IntConst(_1)) )
# 901 "student.ml"
               : 'my_const))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : float) in
    Obj.repr(
# 146 "student.mly"
          ( ConstExp(FloatConst(_1)) )
# 908 "student.ml"
               : 'my_const))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 147 "student.mly"
           ( ConstExp(StringConst(_1)) )
# 915 "student.ml"
               : 'my_const))
; (fun __caml_parser_env ->
    Obj.repr(
# 148 "student.mly"
        ( ConstExp(NilConst) )
# 921 "student.ml"
               : 'my_const))
; (fun __caml_parser_env ->
    Obj.repr(
# 149 "student.mly"
         ( ConstExp(UnitConst) )
# 927 "student.ml"
               : 'my_const))
; (fun __caml_parser_env ->
    Obj.repr(
# 150 "student.mly"
                  ( ConstExp(StringConst("()")))
# 933 "student.ml"
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
