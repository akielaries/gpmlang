#include <stdio.h>

extern FILE *yyin;          /** for parsing input file */
extern int yylineno;        /** keep track of file line number */

int yyparse(void);

void usage() {

}

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
    yylineno = 0;  // Initialize line number

    yyparse();

    fclose(file);
    return 0;


}

