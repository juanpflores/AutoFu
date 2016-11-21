%option noyywrap
%{
	#include "gramatica.tab.h"
%}

reservadas		sen|cos|tan|cot|csc|sec|ln|senh|cosh|tanh|coth|csch|sech
operadores		[+|-|*|/|=|^]
digito 			[0-9]
letra 			[A-Za-z]
decimal			[0-9]"."[0-9]*
salto_linea 	\n
parentesis_iz	"("
parentesis_der	")"
funcion			{letra}{parentesis_iz}{letra}{parentesis_der}
vacio 			[\r\t\v\f]
no_valido 		[!|·|$|%|&|\|=?|¿|¨|Ç|_|-|<|>|`|œ|æ|€|®|†|¥|ø|π|å|∫|∂|ƒ||™|¶|§|~|Ω|∑|©|√|ß|µ|„|…]	


%%
{funcion}			{printf("\tLEX|\t %s\t|FUNCION\n",yytext); return FUNCION;}
{reservadas}		{printf("\tLEX|\t %s\t|PALABRA RESERVADA\n", yytext); return RESERVADA;}
{letra}				{printf("\tLEX|\t %s\t|VARIABLE\n", yytext); return VARIABLE;}
{decimal}			{printf("\tLEX|\t %s\t|DIGITO DECIMAL\n", yytext); return DIGITO;}
{digito}			{printf("\tLEX|\t %s\t|DIGITO\n", yytext); return DIGITO;}
"="					{printf("\tLEX|\t =\t|OPERADOR DE IGUALDAD\n"); return IGUALDAD;}
"+"					{printf("\tLEX|\t +\t|OPERADOR DE ADICION\n"); return OPERADOR;}
"-"					{printf("\tLEX|\t -\t|OPERADOR DE SUSTRACCION\n"); return OPERADOR;}
"*"					{printf("\tLEX|\t *\t|OPERADOR DE MULTIPLICACION\n"); return OPERADOR;}
"^"					{printf("\tLEX|\t ^\t|OPERADOR DE POTENCIA\n"); return OPERADOR;}
"/"					{printf("\tLEX|\t /\t|OPERADOR DE DIVISION\n"); return OPERADOR;}
"{"					{printf("\tLEX|\t {\t|LLAVE IZQUIERDA\n"); return LLAVE_IZQUIERDA;}
"}"					{printf("\tLEX|\t }\t|LLAVE DERECHA\n"); return LLAVE_DERECHA;}
")"					{printf("\tLEX|\t )\t|PARENTESIS DERECHO\n"); ++yylineno; return PARENTESIS_DERECHO;}
"("					{printf("\tLEX|\t (\t|PARENTESIS IZQUIERDO\n"); --yylineno; return PARENTESIS_IZQUIERDO;}
"|"					{printf("\tLEX|\t |\t|PIPE\n"); return PIPE;}
{vacio}				
{salto_linea}		{printf("\t----\n"); return SALTO_LINEA;}
{no_valido}			{printf("\tLEX|\t %s\t|Caracter Especial\n",yytext); return NO_VALIDO;}
%%