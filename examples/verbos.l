%%
[\t]*
ser|estar|hacer|conocer { printf("%s: es un verbo \n",yytext);}
[a-zA-Z]+ {printf("%s NO es un verbo\n", yytext);}
.|\n
%%

int main(){
	yylex();
	return 0;
}

int yywrap() {
    return 1;
}