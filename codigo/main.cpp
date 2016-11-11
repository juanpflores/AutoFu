#include <iostream>

extern "C"{
	int yyparse();
	void yyerror(const char *);
	int yylex();
}
extern int yylineno;

int main()
{
	int resultado = yyparse();
	if (resultado)
		std::cout << "La función no es valida." << std::endl;
	else
		std::cout << "La funcion es valida." << std::endl;
	std::cout << "El numero de lineas de la entrada es: " << yylineno << std::endl;
	return resultado;
}