
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

/*Parentesis, llaves y corchetes*/
%token PARENTESIS_IZQUIERDO
%token PARENTESIS_DERECHO
%token LLAVE_IZQUIERDA
%token LLAVE_DERECHA


%start funcion

%%funcion:
	FUNCION IGUALDAD primer_operando

primer_operando:
    operando 
    | reservada

multi_operando:
    OPERADOR operando 
    | OPERADOR reservada
    | salto_linea

operando:
    DIGITO 
    | VARIABLE 
    | DIGITO VARIABLE 
    | VARIABLE VARIABLE
    | operando_parentesis
    | DIGITO multi_operando
    | VARIABLE multi_operando
    | VARIABLE VARIABLE multi_operando 
    | DIGITO VARIABLE multi_operando
    
    
operando_parentesis:
    PARENTESIS_IZQUIERDO operando PARENTESIS_DERECHO 
    | PARENTESIS_IZQUIERDO operando multi_operando PARENTESIS_DERECHO 
    | PARENTESIS_IZQUIERDO operando PARENTESIS_DERECHO multi_operando
    | PARENTESIS_IZQUIERDO operando multi_operando PARENTESIS_DERECHO multi_operando 

reservada: 
    RESERVADA operando_parentesis

salto_linea:
    SALTO_LINEA funcion 
    | SALTO_LINEA

%%

void yyerror(char const *x){

	printf("Error %s\n", x);
	exit(1);
}