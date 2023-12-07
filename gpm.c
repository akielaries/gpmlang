#include "libio.h"
#include <stdio.h>

extern int yyparse(void);

int main(int argc, char *argv[]) {
    if (argc != 2) {
        fprintf(stderr, "Usage: %s <file>\n", argv[0]);
        return 1;
    }

    FILE *f = fopen(argv[1], "r");
    if (!f) {
        perror("Error opening file");
        return 1;
    }

    yyin = f;
    yyparse();

    fclose(f);

    return 0;
}

