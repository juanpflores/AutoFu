
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
	FUNCION IGUALDAD combinacionp|combinacions|combinaciont|combinacionc|combinacionq|combinacionse|combinacionsep|combinaciono|combinacionn|combinaciond|trigono| DIGITO trigono;

combinacionp:
    DIGITO VARIABLE OPERADOR DIGITO;

combinacions:
    DIGITO VARIABLE RESERVADA DIGITO OPERADOR DIGITO VARIABLE OPERADOR DIGITO;

combinaciont:
    DIGITO VARIABLE RESERVADA DIGITO OPERADOR combinacions;

combinacionc:
    DIGITO VARIABLE RESERVADA DIGITO OPERADOR combinaciont;

combinacionq:
    DIGITO VARIABLE RESERVADA DIGITO OPERADOR combinacionc;
              
combinacionse:
    DIGITO VARIABLE RESERVADA DIGITO OPERADOR combinacionq;

combinacionsep:
    DIGITO VARIABLE RESERVADA DIGITO OPERADOR combinacionse;

combinaciono:
    DIGITO VARIABLE RESERVADA DIGITO OPERADOR combinacionsep;

combinacionn:
    DIGITO VARIABLE RESERVADA DIGITO OPERADOR combinaciono;

combinaciond:
    DIGITO VARIABLE RESERVADA DIGITO OPERADOR combinacionn;

trigono:
    RESERVADA PARENTESIS_IZQUIERDO DIGITO VARIABLE  PARENTESIS_DERECHO;
    



%%

void yyerror(char const *x){

	printf("Error %s\n", x);
	exit(1);
}