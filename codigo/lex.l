%option noyywrap
%{
	#include "gramatica.tab.h"
%}
nombre 			\w([0-9]\w)+
vacio 			[\r\t\v\f]
salto_linea 	\n


%%
{nombre}			{return NOMBRE;}
":"					{return DOS_PUNTOS;}
"->"				{return FLECHA_DERECHA;}
"{"					{return LLAVE_IZQUIERDA;}
"}"					{return LLAVE_DERECHA;}
{vacio}				
{salto_linea}		++yylineno;
%%