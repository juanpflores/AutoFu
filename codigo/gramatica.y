
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

operando:
    DIGITO | VARIABLE | DIGITO VARIABLE |  DIGITO multi_operando| VARIABLE multi_operando| DIGITO VARIABLE multi_operando

reservada: 
    RESERVADA PARENTESIS_IZQUIERDO operando PARENTESIS_DERECHO | RESERVADA PARENTESIS_IZQUIERDO operando PARENTESIS_DERECHO multi_operando


%%

void yyerror(char const *x){

	printf("Error %s\n", x);
	exit(1);
}