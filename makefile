all:
	$(MAKE) gramatica
	$(MAKE) lex
	gcc -c codigo/gramatica.tab.c codigo/lex.yy.c
	mv *.o codigo
	ar rvs codigo/lexgram.a codigo/gramatica.tab.o codigo/lex.yy.o
	g++ -std=c++11 -Wall -Wextra codigo/main.cpp codigo/lexgram.a

gramatica:
	bison -d codigo/gramatica.y
	mv gramatica.tab.* codigo

lex:
	flex codigo/lex.l
	mv lex.yy.* codigo