// Leandro Hideki Aihara
// Thiago Martendal Salvador
// Pablo Daniel Riveros Strapasson

#ifndef IDENTIFICADOR_H
#define IDENTIFICADOR_H

// Cada um dos identificadores abaixo é atribuido a uma palavra do código
// Pode haver repetições de identificadores já que o código é composto por palavras que se repetem

typedef enum Identificador {
  ID = 1, // ident
  ICT = 2, // int_constant
  FCT = 3, // float_constant
  SCT = 4, // string_constant
  ADD = 5, // +
  SUB = 6, // -
  MUL = 7, // *
  DIV = 8, // /
  PRC = 9, // %
  ATR = 10, // =
  MAR = 11, // >
  MER = 12, // <
  CMP = 13, // ==
  MAI = 14, // >=
  MEI = 15, // <=
  DIF = 16, // !=
  P1 = 17, // (
  P2 = 18, // )
  CV1 = 19, // {
  CV2 = 20, // }
  CL1 = 21, // [
  CL2 = 22, // ]
  VI = 23, // ,
  PV = 24, // ;
  NEW = 25, // new
  DF = 26, // def
  RD = 27, // read
  PR = 28, // print
  NL = 29, // null
  INT = 30, // int
  FLT = 31, // float
  STR = 32, // string
  IF = 33, // if
  ELS = 34, // else
  FOR = 35, // for
  BRK = 36, // break
  RET = 37, // return
  ERR = 38 // erro
} Identificador;

#endif
