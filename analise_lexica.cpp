// Leandro Hideki Aihara
// Thiago Martendal Salvador
// Pablo Daniel Riveros Strapasson

#include "analise_lexica.h"

void AnaliseLexica::tokenizar(int ntoken, std::string lexema, int linha, int coluna) {
  Identificador id; // Recebe o identificador do token
  std::string descricao; // Uma descrição do lexema
  // Abaixo segue a verificação dos tokens e as devidas atribuições
  if (ntoken == Identificador::ERR) {
    id = Identificador::ERR;
    descricao = "Erro léxico";
  } else {
    switch (ntoken) {
      case Identificador::ID:
        id = Identificador::ID;
        descricao = "Identificador";
      break;
      case Identificador::ICT:
        id = Identificador::ICT;
        descricao = "Constante inteira";
      break;
      case Identificador::FCT:
        id = Identificador::FCT;
        descricao = "Constante real";
      break;
      case Identificador::SCT:
        id = Identificador::SCT;
        descricao = "Constante string";
      break;
      case Identificador::ADD:
        id = Identificador::ADD;
        descricao = "Adição";
      break;
      case Identificador::SUB:
        id = Identificador::SUB;
        descricao = "Subtração";
      break;
      case Identificador::MUL:
        id = Identificador::MUL;
        descricao = "Multiplicação";
      break;
      case Identificador::DIV:
        id = Identificador::DIV;
        descricao = "Divisão";
      break;
      case Identificador::PRC:
        id = Identificador::PRC;
        descricao = "Porcentagem";
      break;
      case Identificador::ATR:
        id = Identificador::ATR;
        descricao = "Atribuição";
      break;
      case Identificador::MAR:
        id = Identificador::MAR;
        descricao = "Maior";
      break;
      case Identificador::MER:
        id = Identificador::MER;
        descricao = "Menor";
      break;
      case Identificador::CMP:
        id = Identificador::CMP;
        descricao = "Comparação";
      break;
      case Identificador::MAI:
        id = Identificador::MAI;
        descricao = "Maior igual";
      break;
      case Identificador::MEI:
        id = Identificador::MEI;
        descricao = "Menor igual";
      break;
      case Identificador::DIF:
        id = Identificador::DIF;
        descricao = "Diferença";
      break;
      case Identificador::P1:
        id = Identificador::P1;
        descricao = "Parenteses de abertura";
      break;
      case Identificador::P2:
        id = Identificador::P2;
        descricao = "Parenteses de fechamento";
      break;
      case Identificador::CV1:
        id = Identificador::CV1;
        descricao = "Chave de abertura";
      break;
      case Identificador::CV2:
        id = Identificador::CV2;
        descricao = "Chave de fechamento";
      break;
      case Identificador::CL1:
        id = Identificador::CL1;
        descricao = "Colchete de abertura";
      break;
      case Identificador::CL2:
        id = Identificador::CL2;
        descricao = "Colchete de fechamento";
      break;
      case Identificador::VI:
        id = Identificador::VI;
        descricao = "Vírgula";
      break;
      case Identificador::PV:
        id = Identificador::PV;
        descricao = "Ponto e vírgula";
      break;
      case Identificador::NEW:
        id = Identificador::NEW;
        descricao = "Novo";
      break;
      case Identificador::DF:
        id = Identificador::DF;
        descricao = "Define função";
      break;
      case Identificador::RD:
        id = Identificador::RD;
        descricao = "Ler";
      break;
      case Identificador::PR:
        id = Identificador::PR;
        descricao = "Imprimir";
      break;
      case Identificador::NL:
        id = Identificador::NL;
        descricao = "Nulo";
      break;
      case Identificador::INT:
        id = Identificador::INT;
        descricao = "Tipo inteiro";
      break;
      case Identificador::FLT:
        id = Identificador::FLT;
        descricao = "Tipo float";
      break;
      case Identificador::STR:
        id = Identificador::STR;
        descricao = "Tipo string";
      break;
      case Identificador::IF:
        id = Identificador::IF;
        descricao = "Estrutura if";
      break;
      case Identificador::ELS:
        id = Identificador::ELS;
        descricao = "Estrutura else";
      break;
      case Identificador::FOR:
        id = Identificador::FOR;
        descricao = "Estrutura for";
      break;
      case Identificador::BRK:
        id = Identificador::BRK;
        descricao = "Quebra sequência";
      break;
      case Identificador::RET:
        id = Identificador::RET;
        descricao = "Retorno";
      break;
    }
  }
  Posicao p = {linha, coluna};
  if (id == Identificador::ID) {
    tabelaSimbolos[lexema].pos.insert(p); // Insere linha no conjunto de linhas de um lexema
  }
  Token token = {id, lexema, p, descricao}; // Monta o token
  tokens.push_back(token); // Adiciona o token a tabela de símbolos
}

void AnaliseLexica::limpaTokens() {
  tokens.clear(); // Limpa a lista de tokens
}

void AnaliseLexica::limpaTabelaSimbolos() {
  tabelaSimbolos.clear(); // Limpa a tabela de símbolos
}

std::vector<Token> AnaliseLexica::getTokens() {
  return tokens; // Retorna a lista de tokens
}

std::map<std::string, Atributo> AnaliseLexica::getTabelaSimbolos() {
  return tabelaSimbolos; // Retorna a tabela de símbolos
}
