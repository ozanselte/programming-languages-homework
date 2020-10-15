%{
    #include <stdio.h>
    #include <stdlib.h>
    #include "uthash.h"
    #include "interpreter.h"
    
    int yylex(void);
    void yyerror(char *s);

    void yyrestart (FILE *input_file);
    extern FILE *yyin;
%}

%union { char str[128]; int num; int *arr; }

%token KW_AND
%token KW_OR
%token KW_NOT
%token KW_EQUAL
%token KW_LESS
%token KW_NIL
%token KW_LIST
%token KW_APPEND
%token KW_CONCAT
%token KW_SET
%token KW_FOR
%token KW_IF
%token KW_EXIT
%token KW_LOAD
%token KW_DISP
%token KW_TRUE
%token KW_FALSE
%token OP_PLUS
%token OP_MINUS
%token OP_DIV
%token OP_MULT
%token OP_OP
%token OP_CP
%token OP_DBMULT
%token COMMENT
%token <str> STRING
%token <num> VALUE
%token <str> IDENTIFIER

%type <num> expi expb
%type <arr> expli values

%%
program:
    expi { printf("Result: %d\n", $1); }
    |
    program expi { printf("Result: %d\n", $2); }
    |
    expb { printf("Result: %s\n", $1 ? "TRUE" : "FALSE"); }
    |
    program expb { printf("Result: %s\n", $2 ? "TRUE" : "FALSE"); }
    |
    expli { printf("Result: "); printFree($1); }
    |
    program expli { printf("Result: "); printFree($2); }
    |
    OP_OP KW_EXIT OP_CP { freeHashTable(); return(1); }
    |
    program OP_OP KW_EXIT OP_CP { freeHashTable(); return(1); }
    |
    COMMENT {}
    |
    program COMMENT {}
    ;
values:
    expi { $$ = arrCreate($1); }
    |
    values expi { $$ = arrMulti($1, $2); }
    ;
expi:
    VALUE { $$ = $1; }
    |
    IDENTIFIER { $$ = getId($1); }
    |
    OP_OP OP_PLUS values OP_CP { $$ = addArr($3); }
    |
    OP_OP OP_MINUS values OP_CP { $$ = subArr($3); }
    |
    OP_OP OP_DIV values OP_CP { $$ = divArr($3); }
    |
    OP_OP OP_MULT values OP_CP { $$ = mulArr($3); }
    |
    OP_OP OP_DBMULT values OP_CP { $$ = dbmArr($3); }
    |
    OP_OP KW_SET IDENTIFIER values OP_CP { $$ = setId($3, $4); }
    |
    OP_OP KW_IF expb values OP_CP { $$ = ifArr($3, $4); }
    |
    OP_OP KW_FOR expb values OP_CP { $$ = ifArr($3, $4); }
    |
    OP_OP KW_DISP values OP_CP { $$ = dspArr($3); }
    ;
expb:
    KW_TRUE { $$ = 1; }
    |
    KW_FALSE { $$ = 0; }
    |
    OP_OP KW_NOT expb OP_CP { $$ = !$3; }
    |
    OP_OP KW_OR expb expb OP_CP { $$ = $3 || $4; }
    |
    OP_OP KW_AND expb expb OP_CP { $$ = $3 && $4; }
    |
    OP_OP KW_EQUAL expb expb OP_CP { $$ = $3 == $4; }
    |
    OP_OP KW_EQUAL values OP_CP { $$ = equArr($3); }
    |
    OP_OP KW_LESS values OP_CP { $$ = lssArr($3); }
    |
    OP_OP KW_DISP expb OP_CP { $$ = $3; printf("%s\n", $3 ? "TRUE" : "FALSE"); }
    |
    OP_OP KW_LOAD STRING OP_CP { $$ = strCheck($3); }
    ;
expli:
    KW_NIL { $$ = NULL; }
    |
    OP_OP KW_LIST OP_CP { $$ = NULL; }
    |
    OP_OP KW_LIST values OP_CP { $$ = $3; }
    |
    OP_OP KW_CONCAT expli expli OP_CP { $$ = concatList($3, $4); }
    |
    OP_OP KW_APPEND values expli OP_CP { $$ = appendList($3, $4); }
    |
    OP_OP KW_DISP expli OP_CP { $$ = $3; printList($3); }
    ;
%%

void yyerror(char *s)
{
    fprintf(stderr, "%s\n", s);
}

int main(int argc, char **argv)
{
    if(1 < argc) {
        yyin = fopen(argv[1], "r");
        yyrestart(yyin);
        if(1 == yyparse()) {
            fclose(yyin);
            return 0;
        }
        fclose(yyin);
    }
    yyin = stdin;
    yyrestart(yyin);
    while(1) {
        if(1 == yyparse()) {
            return 0;
        }
    }
    freeHashTable();
    return 0;
}