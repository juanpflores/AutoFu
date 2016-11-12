	
all:
	$(MAKE) gramatica
	$(MAKE) lex
	gcc -c codigo/gramatica.tab.c codigo/lex.yy.c
	mv *.o codigo
	ar rvs codigo/lexgram.a codigo/gramatica.tab.o codigo/lex.yy.o
	g++ -std=c++11 -Wall -Wextra codigo/main.cpp codigo/lexgram.a
	mv a.out bin
	
	@echo CODIGO COMPILADO CON EXITO!
gramatica:
	bison -d codigo/gramatica.y
	mv gramatica.tab.* codigo


lex:
	flex codigo/lex.l
	mv lex.yy.* codigo

test: 
	$(MAKE) all
	clear
	./bin/a.out < pruebas/entrada.code

run:
	clear
	./bin/a.out < pruebas/entrada.code