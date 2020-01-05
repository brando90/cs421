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
  | exp DSEMI      			   { (Anon ( $1)) }
  | LET IDENT EQUALS exp	DSEMI 	           { (Let ($2,$4)) }
  | LET REC IDENT IDENT EQUALS exp DSEMI    { (LetRec ($3, $4, $6)) }

exp:
  | pure_exp DPLUS next {  BinOpAppExp(FloatPlusOp, $1, $3) }
  | pure_exp DMINUS next {  BinOpAppExp(FloatMinusOp, $1, $3) }
  | next { $1 }

next:
  | atomic EXP next { BinOpAppExp(ExpoOp, $1, $3) }
  | deal_letin { $1 }

deal_letin:
  | LET IDENT EQUALS exp IN exp { LetInExp($2, $4, $6) }
  | atomic { $1 }

pure_exp:
  | pure_exp DPLUS pure_next { BinOpAppExp(FloatPlusOp, $1, $3) }
  | pure_exp DMINUS pure_next { BinOpAppExp(FloatMinusOp, $1, $3) }
  | pure_next { $1 }

pure_next:
  | atomic EXP pure_next { BinOpAppExp(ExpoOp, $1, $3) }
  | atomic { $1 }

atomic:
  | IDENT { VarExp $1 }
  | FLOAT { ConstExp( FloatConst($1) ) }
  | LBRAC exp RBRAC { $2 }

/* var:
  | var { $1 } */

  /* atomic_expression { $1 }
  | IDENT			{ VarExp $1 } */
