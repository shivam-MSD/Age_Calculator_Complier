%{
#include<stdio.h> 
#include<stdlib.h>
#define YYERROR_VERBOSE 1 
void yyerror(char *err);
%}
%token K1 K2 S1 S2 D E W
%%
S: A {printf("\nThis sentence is valid.\n"); return 0;}; 
A: D S2 D S2 D W K1 S1 W K2 E {}; 

%%
void yyerror(char *err) { 
printf("Error: ");
fprintf(stderr, "%s\n", err); 
exit(1);
}
void main(){ 
printf("Enter String: "); 
yyparse();
printf("\n valid Expression...\n");
}
