/* Use the expression datatype defined in expressions.ml: */
%{
  open Common
(* Typically used for:
- give type
- give functions
needed for semantic actions of rules (and throw special errors)
*)
(* You may want to add extra code here *)

%}


/* Define the tokens of the language: */
%token <int> INT
%token <float> FLOAT
%token <string> STRING IDENT
%token TRUE FALSE NEG PLUS MINUS TIMES DIV DPLUS DMINUS DTIMES DDIV MOD EXP CARAT
       LT GT LEQ GEQ EQUALS NEQ PIPE ARROW SEMI DSEMI DCOLON NIL
       LET REC AND IN IF THEN ELSE FUN MOD RAISE TRY WITH NOT LOGICALAND
       LOGICALOR LBRAC RBRAC LPAREN RPAREN COMMA UNDERSCORE UNIT
       HEAD TAIL PRINT FST SND EOF

/* Define the "goal" nonterminal of the grammar: */
%start main
%type <Common.dec> main

%%

main:
  |  expression DSEMI      			   { (Anon ( $1)) }
  | LET IDENT EQUALS expression	DSEMI 	           { (Let ($2,$4)) }
  | LET REC IDENT IDENT EQUALS expression DSEMI    { (LetRec ($3, $4, $6)) }

expression:
/* You will need to change stuff here, we just have a minimal version so that
   you can successfully do make initially  */
  /* | atomic_expression { $1 } */
  /* | LPAREN expression RPAREN { $2 } */
  | LPAREN expression COMMA expression RPAREN { BinOpAppExp(CommaOp, $2, $4) } /* Is this supposed to go here? */
  | letrecin_14_prec { $1 }

/* trywith_15_prec:
  | TRY trywith_15_prec WITH trywith_15_prec ARROW trywith_15_prec PIPE trywith_15_prec PIPE trywith_15_prec
  | letrecin_14_prec { $1 } */

letrecin_14_prec:
  | LET REC var var EQUALS letrecin_14_prec IN letrecin_14_prec { LetRecInExp($3, $4, $6, $8) }
  | letin_13_prec { $1 }

letin_13_prec:
  | LET var EQUALS letin_13_prec IN letin_13_prec { LetInExp($2, $4, $6) }
  | fun_12_prec { $1 }

fun_12_prec:
  | FUN var ARROW fun_12_prec { FunExp($2, $4) }
  | ifthenelse_11th_prec { $1 }

ifthenelse_11th_prec:
  | IF ifthenelse_11th_prec THEN ifthenelse_11th_prec ELSE ifthenelse_11th_prec { IfExp($2, $4, $6)}
  | or_10th_highest_prec { $1 }

/* left associative */
or_10th_highest_prec:
  | or_10th_highest_prec LOGICALOR and_9th_highest_prec { IfExp($1, ConstExp(BoolConst true), $3) }
  | and_9th_highest_prec { $1 }

/* left associative */
and_9th_highest_prec:
  | and_9th_highest_prec LOGICALAND logical_8th_highest_prec { IfExp( $1, $3, ConstExp (BoolConst false)) }
  | logical_8th_highest_prec { $1 }

/* left associative */
logical_8th_highest_prec:
  | logical_8th_highest_prec EQUALS cons_7th_highest_prec { BinOpAppExp( EqOp, $1, $3) }
  | logical_8th_highest_prec LT cons_7th_highest_prec { BinOpAppExp( GreaterOp, $3, $1) } /* a<b == b>a */
  | logical_8th_highest_prec GT cons_7th_highest_prec { BinOpAppExp( GreaterOp, $1, $3) }
  | logical_8th_highest_prec LEQ cons_7th_highest_prec { IfExp($1 , ConstExp( BoolConst true), $3) }
  | logical_8th_highest_prec GEQ cons_7th_highest_prec { IfExp($1 , ConstExp( BoolConst true), $3) }
  | logical_8th_highest_prec NEQ cons_7th_highest_prec { IfExp( BinOpAppExp( EqOp, $1, $3 ), ConstExp( BoolConst false), ConstExp( BoolConst true) ) }
  | cons_7th_highest_prec { $1 }

/* right associative */
cons_7th_highest_prec:
  | arith_ops_low_prec_6th_highest_prec DCOLON cons_7th_highest_prec { BinOpAppExp( ConsOp, $1, $3) }
  | arith_ops_low_prec_6th_highest_prec { $1 }

/* left associative */
arith_ops_low_prec_6th_highest_prec:
  | arith_ops_low_prec_6th_highest_prec PLUS arith_ops_high_prec_5th_highest_prec { BinOpAppExp( IntPlusOp,$1, $3) }
  | arith_ops_low_prec_6th_highest_prec DPLUS arith_ops_high_prec_5th_highest_prec { BinOpAppExp(FloatPlusOp,$1, $3) }
  | arith_ops_low_prec_6th_highest_prec MINUS arith_ops_high_prec_5th_highest_prec { BinOpAppExp(IntMinusOp,$1, $3) }
  | arith_ops_low_prec_6th_highest_prec DMINUS arith_ops_high_prec_5th_highest_prec { BinOpAppExp(FloatMinusOp,$1, $3) }
  | arith_ops_low_prec_6th_highest_prec CARAT arith_ops_high_prec_5th_highest_prec { BinOpAppExp(ConcatOp,$1, $3) }
  | arith_ops_high_prec_5th_highest_prec { $1 }

/* left associative */
arith_ops_high_prec_5th_highest_prec:
  | arith_ops_high_prec_5th_highest_prec TIMES exponentiation_4th_highest_prec { BinOpAppExp(IntTimesOp,$1,$3) }
  | arith_ops_high_prec_5th_highest_prec DTIMES exponentiation_4th_highest_prec { BinOpAppExp(FloatTimesOp,$1, $3) }
  | arith_ops_high_prec_5th_highest_prec DIV exponentiation_4th_highest_prec { BinOpAppExp(IntDivOp,$1, $3) }
  | arith_ops_high_prec_5th_highest_prec DDIV exponentiation_4th_highest_prec { BinOpAppExp(FloatDivOp,$1, $3) }
  | arith_ops_high_prec_5th_highest_prec MOD exponentiation_4th_highest_prec { BinOpAppExp(ModOp,$1, $3) }
  | exponentiation_4th_highest_prec { $1 }

/* right associative */
exponentiation_4th_highest_prec:
  | raise_3rd_highest_prec EXP exponentiation_4th_highest_prec { BinOpAppExp( ExpoOp, $1, $3) }
  | raise_3rd_highest_prec { $1 }

raise_3rd_highest_prec:
  | RAISE raise_3rd_highest_prec { RaiseExp( $2 ) }
  | app_2nd_highest_prec { $1 }

/* left associative */
app_2nd_highest_prec:
  | app_2nd_highest_prec highest_1st_prec { AppExp($1, $2) }
  | highest_1st_prec { $1 }

highest_1st_prec:
  | FST highest_1st_prec { MonOpAppExp( FstOp, $2 ) }
  | SND highest_1st_prec { MonOpAppExp( SndOp, $2 ) }
  | HEAD highest_1st_prec { MonOpAppExp( HdOp, $2 ) }
  | TAIL highest_1st_prec { MonOpAppExp( TlOp, $2 ) }
  | PRINT highest_1st_prec { MonOpAppExp( PrintOp, $2 ) }
  | atomic_expression { $1 }

pat:
  | UNDERSCORE	{ None }
  | INT		{ Some $1 }

atomic_expression: /* You may want to change this */
  | IDENT			{ VarExp $1 }
  /* | var { $1 } */
  | my_const { $1 }
  | LPAREN expression RPAREN { $2 }

var:
  /* | IDENT			{ VarExp( $1 ) } */
  | var			{ $1 }

my_const:
  | TRUE { ConstExp(BoolConst(true)) }
  | FALSE { ConstExp(BoolConst(false)) }
  | INT { ConstExp(IntConst($1)) }
  | FLOAT { ConstExp(FloatConst($1)) }
  | STRING { ConstExp(StringConst($1)) }
  | NIL { ConstExp(NilConst) }
  | UNIT { ConstExp(UnitConst) }
  | LPAREN RPAREN { ConstExp(StringConst("()"))}
