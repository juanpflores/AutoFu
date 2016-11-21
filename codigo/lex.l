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
{funcion}			{printf("\t|\t%d\t|\t %s\t|FUNCION\n",1,yytext); return FUNCION;}
{reservadas}		{printf("\t|\t%d\t|\t %s\t|PALABRA RESERVADA\n",2, yytext); return RESERVADA;}
{letra}				{printf("\t|\t%d\t|\t %s\t|VARIABLE\n",3, yytext); return VARIABLE;}
{decimal}			{printf("\t|\t%d\t|\t %s\t|DIGITO DECIMAL\n",4, yytext); return DIGITO;}
{digito}			{printf("\t|\t%d\t|\t %s\t|DIGITO\n",5, yytext); return DIGITO;}
"="					{printf("\t|\t%d\t|\t =\t|OPERADOR DE IGUALDAD\n",6); return IGUALDAD;}
"+"					{printf("\t|\t%d\t|\t +\t|OPERADOR DE ADICION\n",7); return OPERADOR;}
"-"					{printf("\t|\t%d\t|\t -\t|OPERADOR DE SUSTRACCION\n",8); return OPERADOR;}
"*"					{printf("\t|\t%d\t|\t *\t|OPERADOR DE MULTIPLICACION\n",9); return OPERADOR;}
"^"					{printf("\t|\t%d\t|\t ^\t|OPERADOR DE POTENCIA\n",10); return OPERADOR;}
"/"					{printf("\t|\t%d\t|\t /\t|OPERADOR DE DIVISION\n",11); return OPERADOR;}
"{"					{printf("\t|\t%d\t|\t {\t|LLAVE IZQUIERDA\n",12); return LLAVE_IZQUIERDA;}
"}"					{printf("\t|\t%d\t|\t }\t|LLAVE DERECHA\n",13); return LLAVE_DERECHA;}
")"					{printf("\t|\t%d\t|\t )\t|PARENTESIS DERECHO\n",14); ++yylineno; return PARENTESIS_DERECHO;}
"("					{printf("\t|\t%d\t|\t (\t|PARENTESIS IZQUIERDO\n",15); --yylineno; return PARENTESIS_IZQUIERDO;}
"|"					{printf("\t|\t%d\t|\t |\t|PIPE\n",16); return PIPE;}
{vacio}				
{salto_linea}		{printf("\t----\n"); return SALTO_LINEA;}
{no_valido}			{printf("\t|\t%d\t|\t %s\t|Caracter Especial\n",17,yytext); return NO_VALIDO;}
%%