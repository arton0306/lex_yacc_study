%{
    #include <stdio.h>
    #include <stdlib.h>

    // extern "C" int yylex();
    // extern "C" void yyerror(const char *);
    // extern int yylex();
%}

%token NAME NUMBER

%%

statement : NAME '=' expression
 |  expression { printf("= %d\n", $1); }
 ;

expression : expression '+' NUMBER { $$ = $1 + $3; }
 |  expression '-' NUMBER { $$ = $1 - $3; }
 |  NUMBER { $$ = $1; }
 ;

%%

int main()
{
    yyparse();

    return 0;
}
