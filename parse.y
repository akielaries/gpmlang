%{
#include <stdio.h>

extern FILE *yyin;

int yylex(void);
extern int yylineno;

void yyerror(const char *s) {
    fprintf(stderr, "Error at line %d: %s\n", yylineno, s);
}

%}

%token NUMBER

%left '+' '-'
%left '*' '/'

%%

program: /* empty */
       | program expr ';' '\n' { printf("Result: %d\n", $2); }
       | program '\n'           /* Allow an empty line at the end */
       ;

expr: term
    | expr '+' term { $$ = $1 + $3; }
    | expr '-' term { $$ = $1 - $3; }

term: factor
    | term '*' factor { $$ = $1 * $3; }
    | term '/' factor { $$ = $1 / $3; }

factor: NUMBER
      | '(' expr ')' { $$ = $2; }

%%

