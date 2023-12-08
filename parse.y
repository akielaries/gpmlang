%{
/* Grammar rules for parsing gpmlang programs */
    #include <stdio.h>
    #include <string.h>
    #include <stdlib.h>
    #include <ctype.h>
    
    //#include "lex.yy.c"
    #include "syntax_table.h"
    #include "syntax_tree.h"

    /* declarations for Yacc util functions */
    void yyerror(const char *s);
    int yylex();
    int yywrap();

    /*struct dataType {
        char * id_name;
        char * data_type;
        char * type;
        int line_no;
    }*/
    struct dataType symbol_table[40];

    int count = 0;
    int q;
    char type[10];
    extern int line_number;
    extern char *yytext;

    struct ASTnode *head_ptr;

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
       | INCLUDE { add('H'); }
       ;

main: datatype ID { add('F'); }
    ;

datatype: INT { insert_type(); }
        | FLOAT { insert_type(); }
        | CHAR { insert_type(); }
        | VOID { insert_type(); }
        ;

body: FOR { add('K'); } '(' statement ';' condition ';' statement ')' '{' body '}'
    | IF { add('K'); } '(' condition ')' '{' body '}' else
    | statement ';'
    | body body 
    | PRINTFF { add('K'); } '(' STR ')' ';'
    | SCANFF { add('K'); } '(' STR ',' '&' ID ')' ';'
    ;

else: ELSE { add('K'); } '{' body '}'
    |
    ;

condition: value relop value 
         | TRUE { add('K'); }
         | FALSE { add('K'); }
         |
         ;

statement: datatype ID { add('V'); } init
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

value: NUMBER { add('C'); }
     | FLOAT_NUM { add('C'); }
     | CHARACTER { add('C'); }
     | ID
     ;

return: RETURN { add('K'); } value ';'
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

void print_syntax_table() {
    printf("\n\n");
    printf("\nSYMBOL   DATATYPE   TYPE   LINE NUMBER \n");
    printf("_______________________________________\n\n");

    for (int i = 0; i < count; i++) {
        printf("%s\t%s\t%s\t%d\t\n", symbol_table[i].id_name, symbol_table[i].data_type, symbol_table[i].type, symbol_table[i].line_no);
    }

    for (int i = 0; i < count; i++) {
        free(symbol_table[i].id_name);
        free(symbol_table[i].type);
    }

    printf("\n\n");
}
