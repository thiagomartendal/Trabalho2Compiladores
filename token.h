// Leandro Hideki Aihara
// Thiago Martendal Salvador
// Pablo Daniel Riveros Strapasson

#ifndef TOKEN_H
#define TOKEN_H

#include <string>
#include "identificador.h"
#include "posicao.h"

// O token é o elemento que configura a descrição de cada palavra no código

typedef struct Token {
  Identificador id; // Identificador que determina o tipo do token, pode haver repetição de identificadores
  std::string lexema; // A palavra que compõe o token
  // int linha; // A linha onde o lexema se encontra
  Posicao pos;
  std::string descricao; // Descrição
} Token;

#endif
