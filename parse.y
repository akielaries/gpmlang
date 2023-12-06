%{
#include <stdio.h>
%}

%token NUMBER
%left '+' '-'
%left '*' '/'

%%

program: /* empty */
       | program expr '\n' { printf("Result: %d\n", $2); }

expr: NUMBER
    | expr '+' expr { $$ = $1 + $3; }
    | expr '-' expr { $$ = $1 - $3; }
    | expr '*' expr { $$ = $1 * $3; }
    | expr '/' expr { $$ = $1 / $3; }

%%

int main() {
    yyparse();
    return 0;
}
