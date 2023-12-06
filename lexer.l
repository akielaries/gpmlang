%{
#include "y.tab.h"

extern FILE *yyin;

%}

DIGIT   [0-9]

%%

{DIGIT}+    { yylval = atoi(yytext); return NUMBER; }
[-+*/();]   { return *yytext; }
[ \t]+      ;  /* skip whitespace */
\n          { yylineno++; return *yytext; }  // Increment yylineno on newline
.           { fprintf(stderr, "Invalid character at line %d: %s\n", yylineno, yytext); }


%%

int yywrap() {
    return 1;
}

