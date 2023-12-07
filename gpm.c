#include <stdio.h>

extern FILE *yyin;          /** for parsing input file */
//extern int yylineno;        /** keep track of file line number */

int yyparse(void);

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

int main(int argc, char *argv[]) {
    if (argc != 2) {
        fprintf(stderr, "Usage: %s <file>\n", argv[0]);
        return 1;
    }

    FILE *file = fopen(argv[1], "r");
    if (!file) {
        perror("Error opening file");
        return 1;
    }

    yyin = file;
    yyparse();

    fclose(file);
    return 0;
}

