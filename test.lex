%{
    int wordCount = 0;
    int numberCount = 0;
    int whiteCount = 0;
    int weirdCount = 0;
    int i = 0;

    static void p(const char *header) {
        ++i;
        printf("header=%-12s i=%d yyleng=%lu yytext=%s\n", header, i, yyleng, yytext);
    }   
%}

chars [A-za-z\_\'\.\"]
numbers ([0-9])+
delim [" "\n\t]
whitespace {delim}+
words {chars}+

%%

123 { printf("123 found!\n"); }
{words} { wordCount++; p("words"); }
{whitespace} { whiteCount++; p("whitespace"); }
{numbers} { numberCount++; p("numbers"); }
zzz333zzz { weirdCount++; p("weird"); }

%%

int main()
{
    yylex();
    printf("# of words: %d\n", wordCount);
    printf("# of numbers: %d\n", numberCount);
    printf("# of white: %d\n", whiteCount);
    printf("# of weird: %d\n", weirdCount);

    return 0;
}

int yywrap()
{
    return 1;
}
