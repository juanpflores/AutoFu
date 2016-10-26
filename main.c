

%{ 
	#include <math.h>
%}

DIGITO [0-9]
ID [a-z][a-z0-9]*

%%

{DIGITO}+ {
	printf( "Un entero: %s (%d)\n", yytext,
	atoi( yytext ) );
}

{DIGITO}+"."{DIGITO}* {
	printf( "Un real: %s (%g)\n", yytext,
	atof( yytext ) );
}

if|then|begin|end|procedure|function {
	printf( "Una palabra clave: %s\n", yytext );
}

{ID} 	printf( "Un identificador: %s\n", yytext );
"+"|"-"|"*"|"/" 	printf( "Un operador: %s\n", yytext );
"{"[^}\n]*"}" /* se come una linea de comentarios */
[ \t\n]+ /* se come los espacios en blanco */
. 	printf( "Caracter no reconocido: %s\n", yytext );

%%


main( argc, argv )
int argc;
char **argv;
{
++argv, --argc; /* se salta el nombre del programa */
if ( argc > 0 )
yyin = fopen( argv[0], "r" );
else
yyin = stdin;
yylex();
}