/* A Bison parser, made by GNU Bison 3.8.2.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2021 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <https://www.gnu.org/licenses/>.  */

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

/* DO NOT RELY ON FEATURES THAT ARE NOT DOCUMENTED in the manual,
   especially those whose name start with YY_ or yy_.  They are
   private implementation details that can be changed or removed.  */

#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token kinds.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    YYEMPTY = -2,
    YYEOF = 0,                     /* "end of file"  */
    YYerror = 256,                 /* error  */
    YYUNDEF = 257,                 /* "invalid token"  */
    VOID = 258,                    /* VOID  */
    CHARACTER = 259,               /* CHARACTER  */
    PRINTFF = 260,                 /* PRINTFF  */
    SCANFF = 261,                  /* SCANFF  */
    INT = 262,                     /* INT  */
    INT8 = 263,                    /* INT8  */
    INT16 = 264,                   /* INT16  */
    INT32 = 265,                   /* INT32  */
    INT64 = 266,                   /* INT64  */
    FLOAT = 267,                   /* FLOAT  */
    CHAR = 268,                    /* CHAR  */
    FOR = 269,                     /* FOR  */
    IF = 270,                      /* IF  */
    ELSE = 271,                    /* ELSE  */
    TRUE = 272,                    /* TRUE  */
    FALSE = 273,                   /* FALSE  */
    NUMBER = 274,                  /* NUMBER  */
    FLOAT_NUM = 275,               /* FLOAT_NUM  */
    ID = 276,                      /* ID  */
    LE = 277,                      /* LE  */
    GE = 278,                      /* GE  */
    EQ = 279,                      /* EQ  */
    NE = 280,                      /* NE  */
    GT = 281,                      /* GT  */
    LT = 282,                      /* LT  */
    AND = 283,                     /* AND  */
    OR = 284,                      /* OR  */
    STR = 285,                     /* STR  */
    ADD = 286,                     /* ADD  */
    MULTIPLY = 287,                /* MULTIPLY  */
    DIVIDE = 288,                  /* DIVIDE  */
    SUBTRACT = 289,                /* SUBTRACT  */
    UNARY = 290,                   /* UNARY  */
    INCLUDE = 291,                 /* INCLUDE  */
    RETURN = 292                   /* RETURN  */
  };
  typedef enum yytokentype yytoken_kind_t;
#endif
/* Token kinds.  */
#define YYEMPTY -2
#define YYEOF 0
#define YYerror 256
#define YYUNDEF 257
#define VOID 258
#define CHARACTER 259
#define PRINTFF 260
#define SCANFF 261
#define INT 262
#define INT8 263
#define INT16 264
#define INT32 265
#define INT64 266
#define FLOAT 267
#define CHAR 268
#define FOR 269
#define IF 270
#define ELSE 271
#define TRUE 272
#define FALSE 273
#define NUMBER 274
#define FLOAT_NUM 275
#define ID 276
#define LE 277
#define GE 278
#define EQ 279
#define NE 280
#define GT 281
#define LT 282
#define AND 283
#define OR 284
#define STR 285
#define ADD 286
#define MULTIPLY 287
#define DIVIDE 288
#define SUBTRACT 289
#define UNARY 290
#define INCLUDE 291
#define RETURN 292

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;


int yyparse (void);


#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
