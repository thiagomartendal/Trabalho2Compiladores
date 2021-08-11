%{
#include <iostream>
bool correto = true;
extern int yylex();
extern void yyerror(const char*);
extern int yylineno;
extern int yylval;
extern "C" {
  bool programaCorreto(void);
  extern int coluna();
}
%}

%token ID
%token IDF
%token ICT
%token FCT
%token SCT
%token ADD
%token SUB
%token MUL
%token DIV
%token PRC
%token ATR
%token MAR
%token MER
%token CMP
%token MAI
%token MEI
%token DIF
%token P1
%token P2
%token CV1
%token CV2
%token CL1
%token CL2
%token VI
%token PV
%token NEW
%token DF
%token RD
%token PR
%token NL
%token INT
%token FLT
%token STR
%token IF
%token ELS
%token FOR
%token BRK
%token RET
%token ERR
%token END 0

%right P2 ELS

%%
input: %empty
  | input line
  ;

line: '\n'
  | exp '\n'
  ;

exp: PROGRAM
  ;

PROGRAM: STATEMENT
  | FUNCLIST
  ;

FUNCLIST: FUNCDEF FUNCLIST
  | FUNCDEF
  ;

FUNCDEF: DF IDF P1 PARAMLIST P2 CV1 STATELIST CV2
  ;

PARAMLIST: %empty
  | INT ID VI PARAMLIST
  | FLT ID VI PARAMLIST
  | STR ID VI PARAMLIST
  | INT ID
  | FLT ID
  | STR ID
  ;

STATEMENT: VARDECL PV
  | ATRIBSTAT PV
  | PRINTSTAT PV
  | READSTAT PV
  | RETURNSTAT PV
  | IFSTAT
  | FORSTAT
  | CV1 STATELIST CV2
  | BRK PV
  | PV
  ;

VARDECL: INT ID CL1 ICT CL2
  | FLT ID CL1 ICT CL2
  | STR ID CL1 ICT CL2
  | INT ID
  | FLT ID
  | STR ID
  ;

ATRIBSTAT: LVALUE ATR EXPRESSION
  | LVALUE ATR ALLOCEXPRESSION
  | LVALUE ATR FUNCCALL
  ;

FUNCCALL: IDF P1 PARAMLISTCALL P2
  ;

PARAMLISTCALL: %empty
  | ID VI PARAMLISTCALL
  | ID
  ;

PRINTSTAT: PR EXPRESSION
  ;

READSTAT: RD LVALUE
  ;

RETURNSTAT: RET
  ;

IFSTAT: IF P1 EXPRESSION P2 STATEMENT
  | IF P1 EXPRESSION P2 STATEMENT ELS STATEMENT
  ;

FORSTAT: FOR P1 ATRIBSTAT PV EXPRESSION PV ATRIBSTAT P2 STATEMENT
  ;

STATELIST: STATEMENT STATELIST
  | STATEMENT
  ;

ALLOCEXPRESSION: NEW INT CL1 NUMEXPRESSION CL2
  | NEW FLT CL1 NUMEXPRESSION CL2
  | NEW STR CL1 NUMEXPRESSION CL2
  ;

EXPRESSION: NUMEXPRESSION MER NUMEXPRESSION
  | NUMEXPRESSION MAR NUMEXPRESSION
  | NUMEXPRESSION MEI NUMEXPRESSION
  | NUMEXPRESSION MAI NUMEXPRESSION
  | NUMEXPRESSION CMP NUMEXPRESSION
  | NUMEXPRESSION DIF NUMEXPRESSION
  | NUMEXPRESSION
  ;

NUMEXPRESSION: TERM ADD TERM
  | TERM SUB TERM
  | TERM
  ;

TERM: UNARYEXPR MUL UNARYEXPR
  | UNARYEXPR DIV UNARYEXPR
  | UNARYEXPR PRC UNARYEXPR
  | UNARYEXPR
  ;

UNARYEXPR: ADD FACTOR
  | SUB FACTOR
  | FACTOR
  ;

FACTOR: ICT
  | FCT
  | SCT
  | NL
  | LVALUE
  | P1 NUMEXPRESSION P2
  ;

LVALUE: ID NLVALUE
  ;

NLVALUE: %empty
  | CL1 NUMEXPRESSION CL2 NLVALUE
  ;

%%

void yyerror(const char *msg) {
  std::cout << "Erro de sintaxe. Linha: " << yylineno << ". Coluna: " << coluna() << "." << std::endl;
  correto = false;
}

bool programaCorreto() {
  return correto;
}
