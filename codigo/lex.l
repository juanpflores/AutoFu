%option noyywrap
%{
	#include "gramatica.tab.h"
%}
alpha			[a-zA-Z]
nombre 			{alpha}([0-9]*{alpha}*)+
vacio 			[\r\t\v\f]
salto_linea 	\n


%%
{nombre}			{printf("LEX:\t NOMBRE\n"); return NOMBRE;}
":"					{printf("LEX:\t :\n"); return DOS_PUNTOS;}
"->"				{printf("LEX:\t ->\n"); return FLECHA_DERECHA;}
"{"					{printf("LEX:\t {\n"); return LLAVE_IZQUIERDA;}
"}"					{printf("LEX:\t }\n"); return LLAVE_DERECHA;}
{vacio}				
{salto_linea}		++yylineno;
%%