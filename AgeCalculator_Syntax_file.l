
%{
#include<stdio.h> 
#include "ltlab10.tab.h"
%}

keyword1 "janma tarikh che" 
keyword2 "aani ummar su thase"
sep1 ","
sep2 "/"
eos "?"
identifiers [a-zA-Z0-9]
Digit [0-9]
Int  {Digit}+ 
ws " "

%%

{sep1} {
printf("%10s : seperator 1\n",yytext); 
return S1;
}

{sep2} {
printf("%10s : seperator 2\n",yytext); 
return S2;
}

{keyword1} {
printf("%10s : keyword1\n",yytext); 
return K1;
}

{keyword2} {
printf("%10s : keyword2\n",yytext); 
return K2;
}



{Int} {
printf("%10s : digit\n",yytext); 
return D;
}

{eos} {
printf("%10s : enf of line 1\n",yytext); 
return E;
}

{ws} {
return W;
}
. {
printf("%10s : invalid\n",yytext);
}
%%
int yywrap(){ 
return 1;
}