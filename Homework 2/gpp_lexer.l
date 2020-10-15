%{
    int line = 1;
%}

%option noyywrap
%option caseless

%%
and         { printf("KW_AND\n"); }
or          { printf("KW_OR\n"); }
not         { printf("KW_NOT\n"); }
equal       { printf("KW_EQUAL\n"); }
less        { printf("KW_LESS\n"); }
nil         { printf("KW_NIL\n"); }
list        { printf("KW_LIST\n"); }
append      { printf("KW_APPEND\n"); }
concat      { printf("KW_CONCAT\n"); }
set         { printf("KW_SET\n"); }
deffun      { printf("KW_DEFFUN\n"); }
for         { printf("KW_FOR\n"); }
if          { printf("KW_IF\n"); }
exit        { printf("KW_EXIT\n"); }
load        { printf("KW_LOAD\n"); }
disp        { printf("KW_DISP\n"); }
true        { printf("KW_TRUE\n"); }
false       { printf("KW_FALSE\n"); }

\+          { printf("OP_PLUS\n"); }
\-          { printf("OP_MINUS\n"); }
\/          { printf("OP_DIV\n"); }
\*          { printf("OP_MULT\n"); }
\(          { printf("OP_OP\n"); }
\)          { printf("OP_CP\n"); }
\*\*        { printf("OP_DBMULT\n"); }
\"          { printf("OP_OC\n"); }
,           { printf("OP_COMMA\n"); }

;;(.*)                  { printf("COMMENT\n"); }
(0)|([1-9][0-9]*)       { printf("VALUE\n"); }
[a-zA-Z][0-9a-zA-Z]*    { printf("IDENTIFIER\n"); }

[ \t\r]                 {}
\n                      { ++line; }
([0-9][0-9a-zA-Z]+)|.   {
        printf("SYNTAX_ERROR at %d. line, %s cannot be tokenized.\n", line, yytext);
        exit(EXIT_FAILURE);
    }
%%

int main(int argc, char **argv)
{
    if(1 < argc) {
        yyin = fopen(argv[1], "r");
        yyrestart(yyin);
        while(!feof(yyin)) {
            yylex();
        }
        fclose(yyin);
    }
    yyin = stdin;
    yyrestart(yyin);
    while(1) {
        yylex();
    }
    return 0;
}