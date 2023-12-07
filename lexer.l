%{
/* Lexical analyzer for gpmlang defining some patterns and corresponding 
actions*/
    #include "y.tab.h"
    /* keep track of line number */
    int line_number = 0;
    //extern char* yytext;

%}

/* definitions */

/* create scanner for line number */
%option yylineno

alpha [a-zA-Z]
digit [0-9]
unary "++"|"--"

%%

"printf"                    { return PRINTFF; }
"scanf"                     { return SCANFF; }
"int"                       { return INT; }
"float"                     { return FLOAT; }
"char"                      { return CHAR; }
"void"                      { return VOID; }
"return"                    { return RETURN; }
"for"	                    { return FOR; }
"if"	                    { return IF; }
"else"	                    { return ELSE; }
^"#include"[ ]*<.+\.h>      { return INCLUDE; }
"true"                      { return TRUE; }
"false"                     { return FALSE; }
[-]?{digit}+                { return NUMBER; }
[-]?{digit}+\.{digit}{1,6}  { return FLOAT_NUM; }
{alpha}({alpha}|{digit})*   { return ID; }
{unary}                     { return UNARY; }
"<="                        { return LE; }
">="                        { return GE; }
"=="                        { return EQ; }
"!="                        { return NE; }
">"	                        { return GT; }
"<"	                        { return LT; }
"&&"	                    { return AND; }
"||"	                    { return OR; }
"+"                         { return ADD; }
"-"                         { return SUBTRACT; }
"/"                         { return DIVIDE; }
"*"                         { return MULTIPLY; }
\/\/.*                      { ; }
\/\*(.*\n)*.*\*\/           { ; } 
[ \t]*                      { ; }
[\n]                        { line_number++; }
.	                        { return *yytext; }
["].*["]                    { return STR; }
['].[']                     { return CHARACTER; }

%%

/* subroutine */
int yywrap() {
    return 1;
}

