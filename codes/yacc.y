%{
#include<stdio.h>
#include<stdlib.h>
int i=0;
extern int yylex();
void yyerror (char *s);
%}
%token ID NUM IF THEN LE GE EQ NE OR AND ELSE EOLN COMMA STR F C I
%token WHILE LT GT
%token FLOAT CHAR STRING
%left '&''|''x'
%left LT GT LE GE EQ NE
%left AND OR
%left '+''-'
%left '*''/'
%right '='
%right UMINUS

%%
S:	S1 EOLN			{printf("OK result =%d\n",(int)$$);exit(0);}
	|S2 EOLN		{printf("OK\n");exit(0);}
	|S3 EOLN		{printf("OK\n");exit(0);}
	|S4 EOLN		{printf("OK result is %d\n",$1);exit(0);}
	|S5 EOLN		{printf("OK\n");exit(0);}
	|S6 EOLN		{printf("OK true/false =%d\n",(int)$$);exit(0);}
	;

S1:	E1				
	;
E1:	E_1'|'E_1	        {$$=$1||$3;}
	|E_1'x'E_1		{$$=($1&&(!$3))||((!$1)&&$3);}
	|E_1
	;	
E_1:	E_1'&'E_1		{$$=$1&&$3;} 
	|NUM			{$$=$1;}
	;
S2      : ST
	;
ST    : IF '(' E2 ')' THEN ST1';' ELSE ST1';'
        | IF '(' E2 ')' THEN ST1';'
        ;
ST1  : ST
        | E
        ;
E    : ID'='E
      | E'+'E
      | E'-'E
      | E'*'E
      | E'/'E
      | E LT E
      | E GT E
      | E LE E
      | E GE E
      | E EQ E
      | E NE E
      | E OR E
      | E AND E
      | ID
      | NUM
      ;
E2  : E LT E
      | E GT E
      | E LE E
      | E GE E
      | E EQ E
      | E NE E
      | E OR E
      | E AND E
      | ID
      | NUM
      ;
S3:	whileloop
	;
whileloop: WHILE '(' cond ')' '{' '}'
	;

cond	: scond
	| scond logop cond
	;

scond	: nid
	| nid relop nid
	;

nid	: ID
	| NUM
	;

logop	: AND
	| OR
	;

relop	: NE
	| EQ
	| LT
	| LE
	| GT
	| GE
	;

S4:   	expr ';'				 
	;
expr:	expr '+' term	{$$ =$1+$3;} 
	|expr '-' term  {$$ =$1-$3;}
	|term		{$$ =$1;}
	;
term:	term '/' factor	{$$ =$1/$3;}
	|term '%'factor {$$ =$1%$3;}
	|term '*'factor {$$ =$1*$3;}
	|factor		{$$ =$1;}
	;
factor:	'('expr')'	{$$ =$2;}
	|line		{$$ =$1;}
	;
line:	end		{$$ =$1;}	
	;
end:	NUM 		{$$ =$1;}   
	| FLOAT		{$$ =$1;}
	;
S5:	 exp
	;
exp:	C varlist1 ';'
	|I varlist2 ';'
	|F varlist3 ';'
	|STR varlist4 ';'
	;
varlist1:varlist1 '=' CHAR
	|varlist1 '=' ID
	|varlist1 '=' NUM
	|CHAR
	|ID
	;
varlist2:varlist2 '=' NUM
	|varlist2 '=' ID
	|varlist2 '=' CHAR
	|varlist2 '=' FLOAT
	|NUM
	|ID
	;
varlist3:varlist3 '=' FLOAT
	|varlist3 '=' ID
	|varlist3 '=' CHAR
	|FLOAT
	|ID
	;
varlist4:varlist4 '=' STRING
	|varlist4 '=' ID
	|STRING
	|ID
	;

S6:	Ex
	;
Ex:	Ex1 LT Ex1	{$$ =$1<$3;}
	|Ex1 GT Ex1	{$$ =$1>$3;}
	|Ex1 GE Ex1	{$$ =$1>=$3;}
	|Ex1 LE Ex1	{$$ =$1<=$3;}
	|Ex1 NE Ex1	{$$ =$1!=$3;}
	|Ex1 EQ Ex1	{$$ =$1==$3;}
	;
Ex1:	NUM
	;
%%
int main()
{
yyparse();
return 0;
}
void yyerror(char *s){fprintf(stderr,"%s\n",s);}
