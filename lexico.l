%{
  /* #include "identificador.h" */
  #include "sintatico.tab.h"

  int yycolumn = 1;
  int start_line = 1, start_column = 1;

  #define YY_USER_ACTION                                                   \
    start_line = prev_yylineno; start_column = yycolumn;                   \
    if (yylineno == prev_yylineno) yycolumn += yyleng;                     \
    else {                                                                 \
      for (yycolumn = 1; yytext[yyleng - yycolumn] != '\n'; ++yycolumn) {} \
      prev_yylineno = yylineno;                                            \
    }

  extern "C" {
    int coluna(void);
  }
%}

%option noyywrap
%option yylineno

%%
  int prev_yylineno = yylineno;
"new" {return NEW;}
"def" {return DF;}
"read" {return RD;}
"print" {return PR;}
"null" {return NL;}
"int" {return INT;}
"float" {return FLT;}
"string" {return STR;}
"if" {return IF;}
"else" {return ELS;}
"for" {return FOR;}
"break" {return BRK;}
"return" {return RET;}
"+" {return ADD;}
"-" {return SUB;}
"*" {return MUL;}
"/" {return DIV;}
"%" {return PRC;}
"=" {return ATR;}
">" {return MAR;}
"<" {return MER;}
"==" {return CMP;}
">=" {return MAI;}
"<=" {return MEI;}
"!=" {return DIF;}
"(" {return P1;}
")" {return P2;}
"{" {return CV1;}
"}" {return CV2;}
"[" {return CL1;}
"]" {return CL2;}
"," {return VI;}
";" {return PV;}
[a-zA-Z_][a-zA-Z0-9_]* {return ID;}
[[:digit:]]+ {return ICT;}
[[:digit:]]+\.[[:digit:]]+ {return FCT;}
\"(([^\"]|\\\")*[^\\])?\" {return SCT;}
[ \n\t] {;}
. {return ERR;}
%%

int coluna() {
  return start_column;
}
