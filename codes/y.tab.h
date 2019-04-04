/* A Bison parser, made by GNU Bison 3.0.4.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    ID = 258,
    NUM = 259,
    IF = 260,
    THEN = 261,
    LE = 262,
    GE = 263,
    EQ = 264,
    NE = 265,
    OR = 266,
    AND = 267,
    ELSE = 268,
    EOLN = 269,
    COMMA = 270,
    STR = 271,
    F = 272,
    C = 273,
    I = 274,
    WHILE = 275,
    LT = 276,
    GT = 277,
    FLOAT = 278,
    CHAR = 279,
    STRING = 280,
    UMINUS = 281
  };
#endif
/* Tokens.  */
#define ID 258
#define NUM 259
#define IF 260
#define THEN 261
#define LE 262
#define GE 263
#define EQ 264
#define NE 265
#define OR 266
#define AND 267
#define ELSE 268
#define EOLN 269
#define COMMA 270
#define STR 271
#define F 272
#define C 273
#define I 274
#define WHILE 275
#define LT 276
#define GT 277
#define FLOAT 278
#define CHAR 279
#define STRING 280
#define UMINUS 281

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
