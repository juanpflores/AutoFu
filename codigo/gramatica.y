%{
	#include <math.h>
	#include <stdio.h>
	#include <stdlib.h>
	int yylex (void);
	void yyerror (char const *);
%}

/* Declaraciones de Bison */

/*%define api.value.type {double}*/

%token FLECHA_DERECHA
%token LLAVE_IZQUIERDA
%token LLAVE_DERECHA
%token IGUALDAD
%token ADICION
%token FUNCION
%token VARIABLE
%token DIGITO
%token RESERVADA
%token PARENTESIS_DERECHO
%token PARENTESIS_IZQUIERDO


%start funcion_simple

%%

funcion_simple:
	FUNCION igual

igual:
	IGUALDAD palabras_reservadas

palabras_reservadas:
	RESERVADA PARENTESIS_IZQUIERDO PARENTESIS_DERECHO


%%

void yyerror(char const *x){

	printf("Error %s\n", x);
	exit(1);
}