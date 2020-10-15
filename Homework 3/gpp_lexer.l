%{
    #include <stdio.h>
    #include <stdlib.h>
    #include <string.h>
    #include "y.tab.h"
    int line = 1;
%}

%option noyywrap
%option caseless

%%
and         { return KW_AND; }
or          { return KW_OR; }
not         { return KW_NOT; }
equal       { return KW_EQUAL; }
less        { return KW_LESS; }
nil         { return KW_NIL; }
list        { return KW_LIST; }
append      { return KW_APPEND; }
concat      { return KW_CONCAT; }
set         { return KW_SET; }
for         { return KW_FOR; }
if          { return KW_IF; }
exit        { return KW_EXIT; }
load        { return KW_LOAD; }
disp        { return KW_DISP; }
true        { return KW_TRUE; }
false       { return KW_FALSE; }

\+          { return OP_PLUS; }
\-          { return OP_MINUS; }
\/          { return OP_DIV; }
\*          { return OP_MULT; }
\(          { return OP_OP; }
\)          { return OP_CP; }
\*\*        { return OP_DBMULT; }

\"(.*)\"    {
    strcpy(yylval.str, yytext);
    return STRING;
}

;;(.*)                  { return COMMENT; }
(0)|([1-9][0-9]*)       {
    yylval.num = atoi(yytext);
    return VALUE;
}
[a-zA-Z][0-9a-zA-Z]*    {
    strcpy(yylval.str, yytext);
    return IDENTIFIER;
}

[ \t\r]                 {}
\n                      { ++line; }
([0-9][0-9a-zA-Z]+)|.   {
        printf("SYNTAX_ERROR at %d. line, %s cannot be tokenized.\n", line, yytext);
        exit(EXIT_FAILURE);
    }
%%