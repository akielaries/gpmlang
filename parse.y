%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int yylex(void);
void yyerror(const char *s);

int a, b, c;

%}

%token INT IDENTIFIER NUMBER PRINT

%left '+' '-'

%%
program: statement_list
        ;

statement_list: statement
              | statement_list statement
              ;

statement: declaration
         | assignment
         | print_statement
         ;

declaration: INT IDENTIFIER '=' NUMBER ';'
            {
                if ($2 == 'a') a = $4;
                else if ($2 == 'b') b = $4;
                else if ($2 == 'c') c = $4;
            }
            ;

assignment: IDENTIFIER '=' expression ';'
            {
                if ($1 == 'a') a = $3;
                else if ($1 == 'b') b = $3;
                else if ($1 == 'c') c = $3;
            }
            ;

print_statement: PRINT expression ';'
               {
                   printf("%d\n", $2);
               }
               ;

expression: NUMBER
          | IDENTIFIER
          | expression '+' expression
          {
              $$ = $1 + $3;
          }
          ;

%%

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s at line %d\n", s, yylineno);
}

int main(int argc, char *argv[]) {
    FILE *yyin;

    if (argc != 2) {
        fprintf(stderr, "Usage: %s <input_file>\n", argv[0]);
        return 1;
    }

    FILE *input_file = fopen(argv[1], "r");
    if (!input_file) {
        perror("Error opening input file");
        return 1;
    }

    yyin = input_file;
    yyparse();

    fclose(input_file);
    return 0;
}

