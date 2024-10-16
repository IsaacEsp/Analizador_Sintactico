%{
#include <stdio.h>
int yylex();
int yyerror(char *s);
%}
%token STRING NUM OTHER SEMICOLON EQUAL  // Tokens definidos
%type <name> STRING
%type <number> NUM
%union {
    char name[20];
    int number;
}
%%
prog:
    stmts
;
stmts:
    | stmt SEMICOLON stmts  // Continuar con más declaraciones
;
stmt:
    STRING EQUAL STRING {  // Maneja la estructura: STRING = STRING
        printf("Has ingresado un string - %s\n", $1);
        printf("Se encontró un símbolo igual (=).\n");
        printf("Has ingresado otro string - %s\n", $3);
    }
    | STRING EQUAL NUM {  // Maneja la estructura: STRING = NUM
        printf("Has ingresado un string - %s\n", $1);
        printf("Se encontró un símbolo igual (=).\n");
        printf("El número que ingresaste es - %d\n", $3);
    }
    | NUM EQUAL STRING {  // Maneja la estructura: NUM = STRING
        printf("El número que ingresaste es - %d\n", $1);
        printf("Se encontró un símbolo igual (=).\n");
        printf("Has ingresado otro string - %s\n", $3);
    }
    | NUM EQUAL NUM {  // Maneja la estructura: NUM = NUM
        printf("El número que ingresaste es - %d\n", $1);
        printf("Se encontró un símbolo igual (=).\n");
        printf("El otro número que ingresaste es - %d\n", $3);
    }
    | STRING {  // Maneja un string sin igual
        printf("Has ingresado un string - %s\n", $1);
    }
    | NUM {  // Maneja un número
        printf("El número que ingresaste es - %d\n", $1);
    }
    | EQUAL {  // Maneja solo el símbolo igual
        printf("Se encontró un símbolo igual (=).\n");
    }
    | OTHER {
        printf("Error: entrada no válida\n");
    }
;
%%
int yyerror(char *s) {
    printf("Error de sintaxis: %s\n", s);
    return 0;
}
int main() {
    yyparse();
    return 0;
}