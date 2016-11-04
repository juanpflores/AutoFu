%{
#include<stdio.h>
char col[8][200];


%}

digito [0-9]
letra [A-Za-z]
blancos " "
delimitador (\\n)|(\\t)
librerias (math.h)|(stdio.h)|(stdlib.h)|(time.h)|(conio.h)
preservadas void|extern|for|(do)|(if)|else|switch|case|break|default|return|bool|char|void|int|byte|short|long|float|double|private|public|protected|while|scanf|printf|short|define
operadores("+"|"-"|"*"|"/"|"=="|"!="|"&&"|"||"|"<"|">"|"<="|">="|"++"|"--"|"+="|"-="|"%"|"="|"&")
simbespeciales ("{"|"}"|"["|"]"|"("|")"|";"|","|"."|"^"|"¬"|("|")|"#"|":")
constanten ({digito}+)|({digito}+("."{digito}+))
constantec (\"({operadores}*{comentarios}{operadores}*)*{delimitador}?\")
comentarios ({identificadores}+{blancos}*)+
identificadores (_|{letra})(_|{letra}|{digito})*

%option noyywrap
%%


{simbespeciales} {strcat(col[1], yytext);strcat(col[1], ",");}
{constantec} {strcat(col[1], yytext);strcat(col[1], ",");} 
{constanten} {strcat(col[1], yytext);strcat(col[1], ",");}
"// "{comentarios} {strcat(col[1], yytext);strcat(col[1], ",");}
{preservadas} {strcat(col[1], yytext);strcat(col[1], ",");}
{operadores} {strcat(col[1], yytext);strcat(col[1], ",");}
{identificadores} {strcat(col[1], yytext);strcat(col[1], ",");}


%%


void LimpiaArreglo()
{
	int i;
	for(i=0;i<8; i++){
		col[i][0] = '\0';
	} 
}


main(int argc, char *argv[]){
char caracteres,aux;
int i=0;
if(argc>1)
	yyin=fopen(argv[1],"r");

else{

printf("No se pudo abrir el archivo");
exit(0);
}


FILE *t;
t=fopen("tabla.xls","a");
if (t == NULL)
	printf("Error");
else
{
	fputs("\t\t\tTabla de tokens\t\n", t);
	fputs("Linea Leida\t", t);
	fputs("PR\t", t);
	fputs("I\t", t);
	fputs("O\t", t);
	fputs("CC\t", t);
	fputs("CN\t", t);
	fputs("SE\t", t);
	fputs("C\t", t);
	fputs("\n", t);

	if(argc>1)
	{
		FILE *arch;
		arch=fopen(argv[1],"r");
		while((caracteres=getc(arch))!=EOF)
		if(caracteres=='\n')
		fputs("\n", t);
		else
		fprintf(t, "%c", caracteres);
		fclose(arch);

		yyin=fopen(argv[1],"r");
		yylex();
		LimpiaArreglo();
		//palabras reservadas
		if(col[1][0] != '\0')
		{
			i = 0;
			fprintf(t,"\t");
			while(col[1][i] != '\0')
			{ 
				fprintf(t, col[1][i]);
				i++;
			}
		}
		else
			fprintf(t,"\n");
		//operadores
		if(col[2][0] != '\0')
		{
			i = 0;
			fprintf(t,"\t\t");
			while(col[2][i] != '\0')
			{ 
				aux=col[2][i];
				fputs(aux, t);
				i++;
			}
		}
		else
			fprintf(t,"\n");
		//CteNum
		if(col[3][0] != '\0')
		{
			i = 0;
			fprintf(t,"\t\t\t");
			while(col[3][i] != '\0')
			{ 
				fprintf(t, col[3][i]);
				i++;
			}
		}
		//CteCarcter
		if(col[4][0] != '\0')
		{
			i = 0;
			fprintf(t,"\t\t\t\t");
			while(col[4][i] != '\0')
			{ 
				fprintf(t, col[4][i]);
				i++;
			}
		}
		else
			fprintf(t,"\n");
		//SimEsp
		if(col[5][0] != '\0')
		{
			i = 0;
			fprintf(t,"\t\t\t\t\t");
			while(col[5][i] != '\0')
			{ 
				fputc(t, col[5][i]);
				i++;
			}
		}
		else
			fprintf(t,"\n");
		//COM
		if(col[6][0] != '\0')
		{
			i = 0;
			fprintf(t,"\t\t\t\t\t\t");
			while(col[6][i] != '\0')
			{ 
				fprintf(t, col[6][i]);
				i++;
			}
		}
		else
			fprintf(t,"\n");
	}
	else
	printf("No se pudo abrir el archivo");

	fclose(t);

}

}
