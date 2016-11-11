#include <iostream>

extern "C"{
	int yyparse();
	void yyerror(const char *);
	int yylex();
}

int main()
{
	int resultado = yyparse();
	if (resultado)
		std::cout << "La función no es valida." << std::endl;
	else
		std::cout << "La funcion es valida." << std::endl;
	return resultado;
}