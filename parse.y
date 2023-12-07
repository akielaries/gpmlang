%{
/* Grammar rules for parsing gpmlang programs */
    #include <stdio.h>
    #include <string.h>
    #include <stdlib.h>
    #include <ctype.h>
    //#include "lex.yy.c"

    void yyerror(const char *s);
    int yylex();
    int yywrap();
%}

%token VOID
%token CHARACTER
%token PRINTFF
%token SCANFF
%token INT
%token FLOAT
%token CHAR
%token FOR
%token IF
%token ELSE
%token TRUE
%token FALSE
%token NUMBER
%token FLOAT_NUM
%token ID
%token LE
%token GE
%token EQ
%token NE
%token GT
%token LT
%token AND
%token OR
%token STR
%token ADD
%token MULTIPLY
%token DIVIDE
%token SUBTRACT
%token UNARY
%token INCLUDE
%token RETURN

%%
/* RULES */


program: headers main '(' ')' '{' body return '}'
       ;

headers: headers headers
       | INCLUDE
       ;

main: datatype ID
    ;

datatype: INT 
        | FLOAT 
        | CHAR
        | VOID
        ;

body: FOR '(' statement ';' condition ';' statement ')' '{' body '}'
    | IF '(' condition ')' '{' body '}' else
    | statement ';' 
    | body body
    | PRINTFF '(' STR ')' ';'
    | SCANFF '(' STR ',' '&' ID ')' ';'
    ;

else: ELSE '{' body '}'
    |
    ;

condition: value relop value 
         | TRUE 
         | FALSE
         ;

statement: datatype ID init 
         | ID '=' expression 
         | ID relop expression
         | ID UNARY 
         | UNARY ID
         ;

init: '=' value 
    |
    ;

expression: expression arithmetic expression
          | value
          ;

arithmetic: ADD 
          | SUBTRACT 
          | MULTIPLY
          | DIVIDE
          ;

relop: LT
     | GT
     | LE
     | GE
     | EQ
     | NE
     ;

value: NUMBER
     | FLOAT_NUM
     | CHARACTER
     | ID
     ;

return: RETURN value ';' 
      |
      ;


%%

