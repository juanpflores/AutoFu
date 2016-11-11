%{
	#include <math.h>
	#include <stdio.h>
	#include <stdlib.h>
	int yylex (void);
	void yyerror (char const *);
%}

/* Declaraciones de Bison */

/*%define api.value.type {double}*/

%token NOMBRE DOS_PUNTOS FLECHA_DERECHA LLAVE_IZQUIERDA LLAVE_DERECHA

%start input

%%

input:
	NOMBRE DOS_PUNTOS FLECHA_DERECHA LLAVE_IZQUIERDA LLAVE_DERECHA

%%

void yyerror(char const *x){

	printf("Error %s\n", x);
	exit(1);
}