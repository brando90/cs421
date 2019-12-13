/* Use the expression datatype defined in expressions.ml: */
%{
  open Common

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
  | FUN IDENT ARROW nof { FunExp($2, $4) }

nof:
  | nof PLUS nofpm { BinOpAppExp(IntPlusOp, $1, $3) }
  | nof MINUS nofpm { BinOpAppExp(IntMinusOp, $1, $3) }
  | nofpm { $1 }

nofpm:
  | nofpm TIMES ident_num { BinOpAppExp(IntTimesOp, $1, $3) }
  | ident_num { $1 }

ident_num:
  | INT { ConstExp( IntConst($1) ) }
  | IDENT { VarExp($1) }

/* ident:
  | IDENT { $1 } */

/* For the second extra credit, if you want to try it */

/* pat:
  | UNDERSCORE	{ None }
  | INT		{ Some $1 } */
