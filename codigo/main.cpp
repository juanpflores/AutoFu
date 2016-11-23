#include <iostream>

extern "C"{
	int yyparse();
	void yyerror(const char *);
	int yylex();
}
extern int yylineno;

int main()
{
	std::cout << "\t|\tCat\t|\tId\t|\tFLEX\t| Analizador Lexico\n";
	std::cout << "\t|     -------\t|     ------\t|      -------\t| ------------------\n";
	int resultado = yyparse();
	if (resultado)
		std::cout << "La función no es valida." << std::endl;
	else
		if (yylineno!=1)
			std::cout << "Error en Parentesis" << std::endl;
		else
			std::cout << "La funcion(es) es/son valida(s)." << std::endl;
	// std::cout << "yylineno: " << yylineno << std::endl;
	return resultado;
}