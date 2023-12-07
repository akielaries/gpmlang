%{
#include "y.tab.h"
%}

DIGIT   [0-9]
ID      [a-zA-Z_][a-zA-Z0-9_]*

%%
"print"     { return PRINT; }
"int"       { return INT; }
{DIGIT}+    { yylval = atoi(yytext); return NUMBER; }

{ID}        { yylval = strdup(yytext); return IDENTIFIER; }

[ \t\n]     ; /* Ignore whitespace and newlines */
.           { return yytext[0]; }
%%

int yywrap(void) {
    return 1;
}

