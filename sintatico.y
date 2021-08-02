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
  /* | %empty */ /* Regra inútil */
  ;

FUNCLIST: FUNCDEF FUNCLIST
  | FUNCDEF
  ;

FUNCDEF: DF ID P1 PARAMLIST P2 CV1 STATELIST CV2
  ;

PARAMLIST: %empty
  | PARAM ID VI PARAMLIST
  | PARAM ID
  ;

PARAM: INT
  | FLT
  | STR
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

VARDECL: PARAM ID INTC
  ;

INTC: %empty
  | CL1 ICT CL2 INTC
  ;

ATRIBSTAT: LVALUE ATR ATRIBV
  ;

ATRIBV: EXPRESSION
  | ALLOCEXPRESSION
  | FUNCCALL
  ;

FUNCCALL: ID P1 PARAMLISTCALL P2
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

STATELIST: STATEMENT
  | STATEMENT STATELIST
  ;

ALLOCEXPRESSION: NEW PARAM NEXP
  ;

NEXP: CL1 NUMEXPRESSION CL2
 | CL1 NUMEXPRESSION CL2 NEXP
 ;

EXPRESSION: NUMEXPRESSION MEXPRESSION
  ;

MEXPRESSION: OPERATORLIST NUMEXPRESSION
  | %empty
  ;

OPERATORLIST: MER
  | MAR
  | MEI
  | MAI
  | CMP
  | DIF
  ;

NUMEXPRESSION: TERM NTERM
  ;

NTERM: %empty
  | MOP TERM NTERM
  ;

MOP: ADD
  | SUB
  ;

TERM: UNARYEXPR UTERM
  ;

UTERM: %empty
  | NOP UNARYEXPR UTERM
  ;

NOP: MUL
  | DIV
  | PRC
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
  std::cout << "Erro de sintaxe: " << msg << " Linha: " << yylineno << " Coluna: " << coluna() << std::endl;
  correto = false;
}

bool programaCorreto() {
  return correto;
}
