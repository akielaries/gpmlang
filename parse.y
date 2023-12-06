%{
#include <stdio.h>

extern FILE *yyin;

int yylex(void);
void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
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

int main(int argc, char *argv[]) {
    FILE *file;

    if (argc != 2) {
        fprintf(stderr, "Usage: %s <input_file>\n", argv[0]);
        return 1;
    }

    file = fopen(argv[1], "r");
    if (!file) {
        perror("Error opening file");
        return 1;
    }

    yyin = file;
    yyparse();

    fclose(file);
    return 0;
}

