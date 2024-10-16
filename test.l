%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "test.tab.h" // Asegúrate de que este archivo se genera correctamente con Bison
void showError();
%}
numbers     [0-9]+
alpha       [a-zA-Z]+
%%
{alpha}                { sscanf(yytext, "%s", yylval.name); return (STRING); }
{numbers}             { yylval.number = atoi(yytext); return (NUM); }
";"                   { return (SEMICOLON); }
"="                   { return (EQUAL); }  // Asegúrate de que EQUAL está definido en test.tab.h
.                     { showError(); return (OTHER); }
%%
void showError() {
    printf("Other input\n");
}
int yywrap() {
    return 1;
}