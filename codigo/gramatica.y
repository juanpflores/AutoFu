
/*Iniciamos el prologo*/
%{
	#include <math.h>
	#include <stdio.h>
	#include <stdlib.h>
	int yylex (void);
	void yyerror (char const *);
%}

/* Declaraciones de Bison */

/*%define api.value.type {double}*/


%token IGUALDAD
%token OPERADOR
%token FUNCION
%token VARIABLE
%token DIGITO
%token RESERVADA

/*Parentesis, llaves y corchetes*/
%token PARENTESIS_IZQUIERDO
%token PARENTESIS_DERECHO
%token LLAVE_IZQUIERDA
%token LLAVE_DERECHA


%start funcion

%%funcion:
	FUNCION IGUALDAD primer_operando

primer_operando:
    operando | reservada

multi_operando:
    OPERADOR operando | OPERADOR reservada

multi_operando_2:
    OPERADOR operando_simple | OPERADOR reservada

operando:
    DIGITO | VARIABLE | DIGITO VARIABLE |  
    DIGITO multi_operando| VARIABLE multi_operando| DIGITO VARIABLE multi_operando |
    PARENTESIS_IZQUIERDO DIGITO multi_operando| PARENTESIS_IZQUIERDO VARIABLE multi_operando| PARENTESIS_IZQUIERDO DIGITO VARIABLE multi_operando|
    DIGITO PARENTESIS_DERECHO| VARIABLE PARENTESIS_DERECHO| DIGITO VARIABLE PARENTESIS_DERECHO|
    DIGITO PARENTESIS_DERECHO multi_operando | VARIABLE PARENTESIS_DERECHO multi_operando| DIGITO VARIABLE PARENTESIS_DERECHO multi_operando|
    PARENTESIS_IZQUIERDO DIGITO PARENTESIS_DERECHO | PARENTESIS_IZQUIERDO VARIABLE PARENTESIS_DERECHO | PARENTESIS_IZQUIERDO DIGITO VARIABLE PARENTESIS_DERECHO

operando_simple:
    DIGITO | VARIABLE | DIGITO VARIABLE |  
    DIGITO multi_operando_2| VARIABLE multi_operando_2| DIGITO VARIABLE multi_operando_2

reservada: 
    RESERVADA PARENTESIS_IZQUIERDO operando_simple PARENTESIS_DERECHO | RESERVADA PARENTESIS_IZQUIERDO operando_simple PARENTESIS_DERECHO multi_operando


%%

void yyerror(char const *x){

	printf("Error %s\n", x);
	exit(1);
}