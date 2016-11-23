
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
%token SALTO_LINEA
%token PIPE

/*Parentesis, llaves y corchetes*/
%token PARENTESIS_IZQUIERDO
%token PARENTESIS_DERECHO
%token LLAVE_IZQUIERDA
%token LLAVE_DERECHA
%token NO_VALIDO


%start inicial

%%inicial:
	FUNCION funcion

funcion:
    IGUALDAD operando
    | OPERADOR FUNCION IGUALDAD operando

multi_operando:
    OPERADOR operando 
    | OPERADOR reservada
    | igualdad_intermedia
    | salto_linea

operando:
    DIGITO 
    | reservada
    | VARIABLE 
    | DIGITO VARIABLE 
    | VARIABLE VARIABLE
    | valor_absoluto
    | operando_parentesis
    | funcion_intermedia
    | DIGITO multi_operando
    | VARIABLE multi_operando
    | VARIABLE VARIABLE multi_operando 
    | DIGITO VARIABLE multi_operando

igualdad_intermedia:
    |IGUALDAD operando
    |IGUALDAD reservada

funcion_intermedia:
    FUNCION
    |FUNCION multi_operando
    
operando_parentesis:
    PARENTESIS_IZQUIERDO operando PARENTESIS_DERECHO 
    | PARENTESIS_IZQUIERDO operando multi_operando PARENTESIS_DERECHO 
    | PARENTESIS_IZQUIERDO operando PARENTESIS_DERECHO multi_operando
    | PARENTESIS_IZQUIERDO operando multi_operando PARENTESIS_DERECHO multi_operando 

reservada: 
    RESERVADA operando_parentesis

valor_absoluto:
    PIPE operando PIPE
    | PIPE multi_operando PIPE
    | PIPE operando PIPE multi_operando
    | PIPE multi_operando PIPE multi_operando

salto_linea:
    SALTO_LINEA inicial 
    | SALTO_LINEA

%%

void yyerror(char const *x){

	printf("Error %s\n", x);
	exit(1);
}