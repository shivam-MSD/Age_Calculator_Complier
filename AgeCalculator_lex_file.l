%{
	#include<stdio.h>
	#include<stdlib.h>
	#define YYERROR_VERBOSE 1 
	void yyerror(char *err);
%}
Keyword "janma"|"tarikh"|"che"|"aani"|"ummar"|"su"|"thase"
identifiers [a-zA-Z0-9]
Digit [0-9]
Int  {Digit}+
eos "?" 
ws [\t," "]
sep ","|"/"

%%
{Keyword} {printf("Keyword - %s\n",yytext);}

{Int} {printf("Integer - %s\n",yytext);}

{eos} {printf("que-eos - %s\n",yytext);}

{sep} {printf("sep - %s\n",yytext);}

[$]{1}[*]{1}[*]{1}[a-zA-Z0-9|" "]* printf("Comment");

{ws} {printf("ws - \n",yytext);}


. { printf("Lexical error occur Invalid token:%s\n", yytext);}

%%

void yyerror(char *err) { 
printf("Error: ");
fprintf(stderr, "%s\n", err); 
exit(1);
}

int yywrap()
{
	return 1;
}
int main()
{
	yylex();
	return 0;
}


