// Leandro Hideki Aihara
// Thiago Martendal Salvador
// Pablo Daniel Riveros Strapasson

#include <iostream>
#include <string>
#include "entrada.h"

int main(int argc, char *argv[]) { // O nome de um arquivo de entrada pode ser passado por argumento
  Entrada entrada;
  if (argc > 1) { // Se houver um arquivo de entrada, este é lido
    // if (entrada.lerArquivo(argv[1])) {
      // entrada.exibirTokens(); // Exibe os toquens lidos do arquivo
    // }
  } else { // Se não houver arquivo de entrada, é feita a leitura da entrada no console
    entrada.lerEntrada(); // Recebe entrada via console
  }
  return 0;
}
