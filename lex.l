%{
#include "y.tab.h"

extern FILE *yyin;
%}

DIGIT   [0-9]

%%

{DIGIT}+    { yylval = atoi(yytext); return NUMBER; }
[-+*/();]   { return *yytext; }
[ \t]+      ;  /* skip whitespace */
\n          { return *yytext; } // Handle newline characters
.           { fprintf(stderr, "Invalid character: %s\n", yytext); }

%%

int yywrap() {
    return 1;
}

