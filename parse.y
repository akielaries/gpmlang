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

    #include "syntax_table.h"

    int count = 0;
    int q;
    char type[10];
    extern int line_number;
    extern char *yytext;

%}

%token VOID
%token CHARACTER
%token PRINTFF
%token SCANFF
%token INT
%token INT8
%token INT16
%token INT32
%token INT64
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

int search(char *type) {
	int i;
	for(i=count-1; i>=0; i--) {
		if(strcmp(symbol_table[i].id_name, type)==0) {
			return -1;
			break;
		}
	}
	return 0;
}

void add(char c) {
  q=search(yytext);
  if(!q) {
    if(c == 'H') {
			symbol_table[count].id_name=strdup(yytext);
			symbol_table[count].data_type=strdup(type);
			symbol_table[count].line_no=line_number;
			symbol_table[count].type=strdup("Header");
			count++;
		}
		else if(c == 'K') {
			symbol_table[count].id_name=strdup(yytext);
			symbol_table[count].data_type=strdup("N/A");
			symbol_table[count].line_no=line_number;
			symbol_table[count].type=strdup("Keyword\t");
			count++;
		}
		else if(c == 'V') {
			symbol_table[count].id_name=strdup(yytext);
			symbol_table[count].data_type=strdup(type);
			symbol_table[count].line_no=line_number;
			symbol_table[count].type=strdup("Variable");
			count++;
		}
		else if(c == 'C') {
			symbol_table[count].id_name=strdup(yytext);
			symbol_table[count].data_type=strdup("CONST");
			symbol_table[count].line_no=line_number;
			symbol_table[count].type=strdup("Constant");
			count++;
		}
		else if(c == 'F') {
			symbol_table[count].id_name=strdup(yytext);
			symbol_table[count].data_type=strdup(type);
			symbol_table[count].line_no=line_number;
			symbol_table[count].type=strdup("Function");
			count++;
		}
	}
}

void insert_type() {
	strcpy(type, yytext);
}
