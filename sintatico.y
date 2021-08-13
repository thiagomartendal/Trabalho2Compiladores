%{
#include <iostream>
#include <string>
bool correto = true;
std::string producaoAtual;
extern int yylex();
extern void yyerror(const char*);
extern int yylineno;
extern int yylval;
extern char* yytext;
extern "C" {
  bool programaCorreto(void);
  int coluna();
  const char* tokenAtual();
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
%token IFE
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

PROGRAM: STATEMENT {producaoAtual = "PROGRAM -> STATEMENT";}
  | FUNCLIST {producaoAtual = "PROGRAM -> FUNCLIST";}
  ;

FUNCLIST: FUNCDEF FUNCLIST {producaoAtual = "FUNCLIST -> FUNCDEF FUNCLIST";}
  | FUNCDEF {producaoAtual = "FUNCLIST -> FUNCDEF";}
  ;

FUNCDEF: DF IDF P1 PARAMLIST P2 CV1 STATELIST CV2 {producaoAtual = "FUNCDEF -> DF IDF P1 PARAMLIST P2 CV1 STATELIST CV2";}
  ;

PARAMLIST: %empty {producaoAtual = "PARAMLIST -> epsilon";}
  | INT ID VI PARAMLIST {producaoAtual = "PARAMLIST -> INT ID VI PARAMLIST";}
  | FLT ID VI PARAMLIST {producaoAtual = "PARAMLIST -> FLT ID VI PARAMLIST";}
  | STR ID VI PARAMLIST {producaoAtual = "PARAMLIST -> STR ID VI PARAMLIST";}
  | INT ID {producaoAtual = "PARAMLIST -> INT ID";}
  | FLT ID {producaoAtual = "PARAMLIST -> FLT ID";}
  | STR ID {producaoAtual = "PARAMLIST -> STR ID";}
  ;

STATEMENT: VARDECL PV {producaoAtual = "STATEMENT -> VARDECL PV";}
  | ATRIBSTAT PV {producaoAtual = "STATEMENT -> ATRIBSTAT PV";}
  | PRINTSTAT PV {producaoAtual = "STATEMENT -> PRINTSTAT PV";}
  | READSTAT PV {producaoAtual = "STATEMENT -> READSTAT PV";}
  | RETURNSTAT PV {producaoAtual = "STATEMENT -> RETURNSTAT PV";}
  | IFSTAT {producaoAtual = "STATEMENT -> IFSTAT";}
  | FORSTAT {producaoAtual = "STATEMENT -> FORSTAT";}
  | CV1 STATELIST CV2 {producaoAtual = "STATEMENT -> CV1 STATELIST CV2";}
  | BRK PV {producaoAtual = "STATEMENT -> BRK PV";}
  | PV {producaoAtual = "STATEMENT -> PV";}
  ;

VARDECL: INT ID CL1 ICT CL2 {producaoAtual = "VARDECL -> INT ID CL1 ICT CL2";}
  | FLT ID CL1 ICT CL2 {producaoAtual = "VARDECL -> FLT ID CL1 ICT CL2";}
  | STR ID CL1 ICT CL2 {producaoAtual = "VARDECL -> STR ID CL1 ICT CL2";}
  | INT ID {producaoAtual = "VARDECL -> INT ID";}
  | FLT ID {producaoAtual = "VARDECL -> FLT ID";}
  | STR ID {producaoAtual = "VARDECL -> STR ID";}
  ;

ATRIBSTAT: LVALUE ATR EXPRESSION {producaoAtual = "ATRIBSTAT -> LVALUE ATR EXPRESSION";}
  | LVALUE ATR ALLOCEXPRESSION {producaoAtual = "ATRIBSTAT -> LVALUE ATR ALLOCEXPRESSION";}
  | LVALUE ATR FUNCCALL {producaoAtual = "ATRIBSTAT -> LVALUE ATR FUNCCALL";}
  ;

FUNCCALL: IDF P1 PARAMLISTCALL P2 {producaoAtual = "FUNCCALL -> IDF P1 PARAMLISTCALL P2";}
  ;

PARAMLISTCALL: %empty {producaoAtual = "PARAMLISTCALL -> epsilon";}
  | ID VI PARAMLISTCALL {producaoAtual = "PARAMLISTCALL -> ID VI PARAMLISTCALL";}
  | ID {producaoAtual = "PARAMLISTCALL -> ID";}
  ;

PRINTSTAT: PR EXPRESSION {producaoAtual = "PRINTSTAT -> PR EXPRESSION";}
  ;

READSTAT: RD LVALUE {producaoAtual = "READSTAT -> RD LVALUE";}
  ;

RETURNSTAT: RET {producaoAtual = "RETURNSTAT -> RET";}
  ;

IFSTAT: IF P1 EXPRESSION P2 STATEMENT {producaoAtual = "IFSTAT -> IF P1 EXPRESSION P2 STATEMENT";}
  | IFE P1 EXPRESSION P2 STATEMENT ELS STATEMENT {producaoAtual = "IFSTAT -> IFE P1 EXPRESSION P2 STATEMENT ELS STATEMENT";}
  ;

FORSTAT: FOR P1 ATRIBSTAT PV EXPRESSION PV ATRIBSTAT P2 STATEMENT {producaoAtual = "FORSTAT -> FOR P1 ATRIBSTAT PV EXPRESSION PV ATRIBSTAT P2 STATEMENT";}
  ;

STATELIST: STATEMENT STATELIST {producaoAtual = "STATELIST -> STATEMENT STATELIST";}
  | STATEMENT {producaoAtual = "STATELIST -> STATEMENT";}
  ;

ALLOCEXPRESSION: NEW INT CL1 NUMEXPRESSION CL2 {producaoAtual = "ALLOCEXPRESSION -> NEW INT CL1 NUMEXPRESSION CL2";}
  | NEW FLT CL1 NUMEXPRESSION CL2 {producaoAtual = "ALLOCEXPRESSION -> NEW FLT CL1 NUMEXPRESSION CL2";}
  | NEW STR CL1 NUMEXPRESSION CL2 {producaoAtual = "ALLOCEXPRESSION -> NEW STR CL1 NUMEXPRESSION CL2";}
  ;

EXPRESSION: NUMEXPRESSION MER NUMEXPRESSION {producaoAtual = "EXPRESSION -> NUMEXPRESSION MER NUMEXPRESSION";}
  | NUMEXPRESSION MAR NUMEXPRESSION {producaoAtual = "EXPRESSION -> NUMEXPRESSION MAR NUMEXPRESSION";}
  | NUMEXPRESSION MEI NUMEXPRESSION {producaoAtual = "EXPRESSION -> NUMEXPRESSION MEI NUMEXPRESSION";}
  | NUMEXPRESSION MAI NUMEXPRESSION {producaoAtual = "EXPRESSION -> NUMEXPRESSION MAI NUMEXPRESSION";}
  | NUMEXPRESSION CMP NUMEXPRESSION {producaoAtual = "EXPRESSION -> NUMEXPRESSION CMP NUMEXPRESSION";}
  | NUMEXPRESSION DIF NUMEXPRESSION {producaoAtual = "EXPRESSION -> NUMEXPRESSION DIF NUMEXPRESSION";}
  | NUMEXPRESSION {producaoAtual = "EXPRESSION -> NUMEXPRESSION";}
  ;

NUMEXPRESSION: TERM ADD TERM {producaoAtual = "NUMEXPRESSION -> TERM ADD TERM";}
  | TERM SUB TERM {producaoAtual = "NUMEXPRESSION -> TERM SUB TERM";}
  | TERM {producaoAtual = "NUMEXPRESSION -> TERM";}
  ;

TERM: UNARYEXPR MUL UNARYEXPR {producaoAtual = "TERM -> UNARYEXPR MUL UNARYEXPR";}
  | UNARYEXPR DIV UNARYEXPR {producaoAtual = "TERM -> UNARYEXPR DIV UNARYEXPR";}
  | UNARYEXPR PRC UNARYEXPR {producaoAtual = "TERM -> UNARYEXPR PRC UNARYEXPR";}
  | UNARYEXPR {producaoAtual = "TERM -> UNARYEXPR";}
  ;

UNARYEXPR: ADD FACTOR {producaoAtual = "UNARYEXPR -> ADD FACTOR";}
  | SUB FACTOR {producaoAtual = "UNARYEXPR -> SUB FACTOR";}
  | FACTOR {producaoAtual = "UNARYEXPR -> FACTOR";}
  ;

FACTOR: ICT {producaoAtual = "FACTOR -> ICT";}
  | FCT {producaoAtual = "FACTOR -> FCT";}
  | SCT {producaoAtual = "FACTOR -> SCT";}
  | NL {producaoAtual = "FACTOR -> NL";}
  | LVALUE {producaoAtual = "FACTOR -> LVALUE";}
  | P1 NUMEXPRESSION P2 {producaoAtual = "FACTOR -> P1 NUMEXPRESSION P2";}
  ;

LVALUE: ID NLVALUE {producaoAtual = "LVALUE -> ID NLVALUE";}
  ;

NLVALUE: %empty {producaoAtual = "NLVALUE -> epsilon";}
  | CL1 NUMEXPRESSION CL2 NLVALUE {producaoAtual = "NLVALUE -> CL1 NUMEXPRESSION CL2 NLVALUE";}
  ;

%%

void yyerror(const char *msg) {
  std::cout << "Erro de sintaxe. Linha: " << yylineno << ". Coluna: " << coluna() << "." << std::endl;
  std::cout << "Produção: " << producaoAtual << ". Token: " << tokenAtual() << ". Lexema: " << yytext << "." << std::endl;
  correto = false;
}

bool programaCorreto() {
  return correto;
}
