%{
#include "y.tab.h"
%}

DIGIT   [0-9]

%%

{DIGIT}+    { yylval = atoi(yytext); return NUMBER; }
[-+*/\n]    { return *yytext; }
[ \t]       ;  /* skip whitespace */

.   { fprintf(stderr, "Invalid character: %s\n", yytext); }

%%

int yywrap() {
    return 1;
}
