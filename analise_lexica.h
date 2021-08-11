// Leandro Hideki Aihara
// Thiago Martendal Salvador
// Pablo Daniel Riveros Strapasson

#ifndef ANALISE_LEXICA_H
#define ANALISE_LEXICA_H

#include <string>
#include <vector>
#include <map>
#include "token.h"
#include "atributo.h"
#include "sintatico.tab.h"

class AnaliseLexica {
private:
  std::vector<Token> tokens; // Lista de tokens
  std::map<std::string, Atributo> tabelaSimbolos; // Tabela de símbolos que armazena os identificadores processados

public:
  AnaliseLexica() = default;
  void tokenizar(int ntoken, std::string lexema, int linha, int coluna); // Recebe os dados de entrada a respeito de um lexema, e os atribui a um token que será adicionado a tabela de símbolos
  void limpaTokens(); // Limpa a lista de tokens
  void limpaTabelaSimbolos(); // Limpa a tabela de símbolos
  std::vector<Token> getTokens(); // Retorna a lista de tokens
  std::map<std::string, Atributo> getTabelaSimbolos(); // Retorna a tabela de símbolos
};

#endif
