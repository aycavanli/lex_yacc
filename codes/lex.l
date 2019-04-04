%{
#include"y.tab.h"
#include<stdio.h>
#include<stdlib.h>
%}
alpha [A-Za-z]
digit [0-9]
FLOAT  [0-9]+\.[0-9]+
STRING \"[a-zA-Z]+\"
CHAR 	'[a-zA-Z]'
%%
"while" {return WHILE;}
if    	return IF;
then    return THEN;
else    return ELSE;
{digit}+ {yylval=atoi(yytext);return NUM;}
int	return I;
float	return F;
char 	return C;
string 	return STR;
{alpha}({alpha}|{digit})*   return ID;
{FLOAT}		{return (FLOAT);}  
{CHAR}		{return (CHAR);}    
{STRING}	{return (STRING);}
"<="    return LE;
"<"  	{return LT;}
">="    return GE;
">"  	{return GT;}
"=="    return EQ;
"!="    return NE;
"||"    return OR;
"&&"    return AND;
"\n"	return EOLN;
"&"|"|"|"x"	{return *yytext;}
[=,{}();] {return *yytext;}
[ \t]   ;
.    return *yytext;
%%
int yywrap()
{return 1;}
