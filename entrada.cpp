// Leandro Hideki Aihara
// Thiago Martendal Salvador
// Pablo Daniel Riveros Strapasson

#include "entrada.h"

bool Entrada::houveErro() {
  // A lista é percorrida para encontrar tokens de erro
  // for (Token tk: al.getTokens()) {
  //   if (tk.id == Identificador::ERR) {
  //     return true;
  //   }
  // }
  return false;
}

bool Entrada::lerArquivo(std::string nome) {
  if ((nome[nome.length()-1] != 'c') && (nome[nome.length()-2] != 'c') && (nome[nome.length()-3] != 'l') && (nome[nome.length()-4] != '.')) {
    std::cout << "O arquivo deve ter a extensão .lcc" << std::endl;
    return false;
  }
  yyin = fopen(nome.c_str(), "r"); // Abre o arquivo especificado para leitura
  if (!yyin) {
    std::cout << "Erro: O arquivo " << nome << " não foi encontrado." << std::endl;
    return false;
  }
  yyparse();
  if (programaCorreto()) {
    std::cout << "Programa correto." << std::endl;
  }
//   int ntoken = yylex(); // Processa cada palavra lida atribuindo um valor inteiro
//   while(ntoken != 0) { // O loop é executado enquanto houver palavras a serem lidas
//     al.tokenizar(ntoken, yytext, yylineno, coluna()); // Passa dados do arquivo para a classe de análise léxica realizar a tokenização
//     ntoken = yylex(); // Lê próxima linha do arquivo, caso esta exista
//   }
  return true;
}

void Entrada::lerEntrada() {
  yyparse();
  // int ntoken = yylex(); // Processa cada palavra lida atribuindo um valor inteiro
  // int ntoken = yyparse();
  // while(ntoken != 0) { // O loop é executado enquanto houver palavras a serem lidas
  //   std::string s = yytext;
  //   if (s == ".") { // Caso uma linha da entrada contenha apenas '.' é declarado o fim da entrada por console
  //     break;
  //   }
  //   // al.tokenizar(ntoken, yytext, yylineno, coluna()); // Passa dados da linha do console para a classe de análise léxica realizar a tokenização
  //   // ntoken = yylex(); // Lê mais uma linha de entrada do console
  //   ntoken = yyparse();
  // }
  // std::cout << std::endl;
  // Entrada::exibirTokens(); // Para cada linha processada, é exibido os tokens que foram encontrados
}

// void Entrada::exibirTokens() {
//   if (!Entrada::houveErro()) { // Caso não Haja erros léxicos é exibida a lista de tokens e a tabela de símbolos
//     std::cout << "Tokens Encontrados:\n" << std::endl;
//     for (Token tk: al.getTokens()) { // Para cada token na tabela de símbolos, é exibido seus dados
//       std::cout << "Id: " << tk.id << " - Lexema: " << tk.lexema << " - Linha: " << tk.pos.linha << " - Coluna: " << tk.pos.coluna << " - Descrição: " << tk.descricao << std::endl;
//     }
//     std::cout << "\nTabela de Símbolos:\n" << std::endl;
//     Entrada::exibirTabelaSimbolos();
//   } else {
//     std::cout << "Tokens de Erro Encontrados:\n" << std::endl;
//     for (Token tk: al.getTokens()) { // Para cada token na tabela de símbolos, é exibido os dados apenas de tokens de erro
//       if (tk.id == 38) {
//         std::cout << "Id: " << tk.id << " - Lexema: " << tk.lexema << " - Linha: " << tk.pos.linha << " - Coluna: " << tk.pos.coluna << " - Descrição: " << tk.descricao << std::endl;
//       }
//     }
//   }
// }

// void Entrada::exibirTabelaSimbolos() {
//   // Para cada identificador é exibido as linhas onde ocorre
//   for (auto const& it: al.getTabelaSimbolos()) {
//     Atributo at = it.second;
//     std::cout << "Id: " << it.first << " - Posição: [";
//     int i = 0;
//     for (Posicao p: at.pos) {
//       std::cout << "{" << p.linha << ", " << p.coluna << "}";
//       if (i < at.pos.size()-1) {
//         std::cout << ", ";
//       }
//       i++;
//     }
//     std::cout << "]" << std::endl;
//   }
// }
