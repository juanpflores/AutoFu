%option noyywrap
%{
	#include "gramatica.tab.h"
%}

reservadas		sen|cos|tan|cot|cosec|sec|ln|pow
operadores		[+|-|*|/|=|^]
digito 			[0-9]
letra 			[A-Za-z]
salto_linea 	\n
parentesis_iz	"("
parentesis_der	")"
funcion			{letra}{parentesis_iz}{letra}{parentesis_der}
vacio 			[\r\t\v\f]


%%
{funcion}			{printf("LEX:\t %s\tFUNCION\n",yytext); return FUNCION;}
{reservadas}		{printf("LEX:\t %s\tPALABRA RESERVADA\n", yytext); return RESERVADA;}
{letra}				{printf("LEX:\t %s\tVARIABLE\n", yytext); return VARIABLE;}
{digito}			{printf("LEX:\t %s\tDIGITO\n", yytext); return DIGITO;}
"="					{printf("LEX:\t =\tOPERADOR DE IGUALDAD\n"); return IGUALDAD;}
"+"					{printf("LEX:\t +\tOPERADOR DE ADICION\n"); return OPERADOR;}
"-"					{printf("LEX:\t -\tOPERADOR DE SUSTRACCION\n"); return OPERADOR;}
"*"					{printf("LEX:\t *\tOPERADOR DE MULTIPLICACION\n"); return OPERADOR;}
"/"					{printf("LEX:\t /\tOPERADOR DE DIVISION\n"); return OPERADOR;}
"{"					{printf("LEX:\t {\tLLAVE IZQUIERDA\n"); return LLAVE_IZQUIERDA;}
"}"					{printf("LEX:\t }\tLLAVE DERECHA\n"); return LLAVE_DERECHA;}
")"					{printf("LEX:\t )\tPARENTESIS DERECHO\n"); return PARENTESIS_DERECHO;}
"("					{printf("LEX:\t (\tPARENTESIS IZQUIERDO\n"); return PARENTESIS_IZQUIERDO;}

{vacio}				
{salto_linea}		++yylineno;
%%