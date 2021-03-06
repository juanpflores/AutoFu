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
{funcion}			{printf("\t|\t%d\t|\t%d\t|\t %s\t|FUNCION\n",1,1,yytext); return FUNCION;}
{letra}				{printf("\t|\t%d\t|\t%d\t|\t %s\t|VARIABLE\n",1,2, yytext); return VARIABLE;}
{decimal}			{printf("\t|\t%d\t|\t%d\t|\t %s\t|DIGITO DECIMAL\n",1,3, yytext); return DIGITO;}
{digito}			{printf("\t|\t%d\t|\t%d\t|\t %s\t|DIGITO\n",1,3, yytext); return DIGITO;}
"sen"				{printf("\t|\t%d\t|\t%d\t|\t %s\t|FUNCION TRIGONOMETRICA\n",3,1, yytext); return RESERVADA;}
"cos"				{printf("\t|\t%d\t|\t%d\t|\t %s\t|FUNCION TRIGONOMETRICA\n",3,2, yytext); return RESERVADA;}
"tan"				{printf("\t|\t%d\t|\t%d\t|\t %s\t|FUNCION TRIGONOMETRICA\n",3,3, yytext); return RESERVADA;}
"cot"				{printf("\t|\t%d\t|\t%d\t|\t %s\t|FUNCION TRIGONOMETRICA\n",3,4, yytext); return RESERVADA;}
"sec"				{printf("\t|\t%d\t|\t%d\t|\t %s\t|FUNCION TRIGONOMETRICA\n",3,5, yytext); return RESERVADA;}
"csc"				{printf("\t|\t%d\t|\t%d\t|\t %s\t|FUNCION TRIGONOMETRICA\n",3,6, yytext); return RESERVADA;}
"ln"				{printf("\t|\t%d\t|\t%d\t|\t %s\t|LOGARITMO NATURAL\n",6,1, yytext); return RESERVADA;}
"senh"				{printf("\t|\t%d\t|\t%d\t|\t %s\t|HIPERBÓLICA\n",4,1, yytext); return RESERVADA;}
"cosh"				{printf("\t|\t%d\t|\t%d\t|\t %s\t|HIPERBÓLICA\n",4,2, yytext); return RESERVADA;}
"tanh"				{printf("\t|\t%d\t|\t%d\t|\t %s\t|HIPERBÓLICA\n",4,3, yytext); return RESERVADA;}
"coth"				{printf("\t|\t%d\t|\t%d\t|\t %s\t|HIPERBÓLICA\n",4,4, yytext); return RESERVADA;}
"sech"				{printf("\t|\t%d\t|\t%d\t|\t %s\t|HIPERBÓLICA\n",4,5, yytext); return RESERVADA;}
"csch"				{printf("\t|\t%d\t|\t%d\t|\t %s\t|HIPERBÓLICA\n",4,6, yytext); return RESERVADA;}
"="					{printf("\t|\t%d\t|\t%d\t|\t =\t|OPERADOR DE IGUALDAD\n",2,1); return IGUALDAD;}
"+"					{printf("\t|\t%d\t|\t%d\t|\t +\t|OPERADOR DE ADICION\n",2,2); return OPERADOR;}
"-"					{printf("\t|\t%d\t|\t%d\t|\t -\t|OPERADOR DE SUSTRACCION\n",2,3); return OPERADOR;}
"*"					{printf("\t|\t%d\t|\t%d\t|\t *\t|OPERADOR DE MULTIPLICACION\n",2,4); return OPERADOR;}
"^"					{printf("\t|\t%d\t|\t%d\t|\t ^\t|OPERADOR DE POTENCIA\n",2,6); return OPERADOR;}
"/"					{printf("\t|\t%d\t|\t%d\t|\t /\t|OPERADOR DE DIVISION\n",2,5); return OPERADOR;}
"{"					{printf("\t|\t%d\t|\t%d\t|\t {\t|LLAVE IZQUIERDA\n",5,1); return LLAVE_IZQUIERDA;}
"}"					{printf("\t|\t%d\t|\t%d\t|\t }\t|LLAVE DERECHA\n",5,2); return LLAVE_DERECHA;}
")"					{printf("\t|\t%d\t|\t%d\t|\t )\t|PARENTESIS DERECHO\n",5,4); ++yylineno; return PARENTESIS_DERECHO;}
"("					{printf("\t|\t%d\t|\t%d\t|\t (\t|PARENTESIS IZQUIERDO\n",5,5); --yylineno; return PARENTESIS_IZQUIERDO;}
"|"					{printf("\t|\t%d\t|\t%d\t|\t |\t|PIPE\n",5,6); return PIPE;}
{vacio}				
{salto_linea}		{printf("\t----\n"); return SALTO_LINEA;}
{no_valido}			{printf("\t|\t%d\t|\t %s\t|Caracter Especial\n",17,yytext); return NO_VALIDO;}
%%
