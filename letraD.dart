/* Faça um programa que receba e divida 2 números. 
A saída da divisão precisará ser formatada com 4 casas decimais.
 */
import 'dart:io';

class Divisao {
  int n1;
  int n2;

  // Método construtor
  Divisao({required this.n1, required this.n2});

  // Método para realizar o cálculo da divisão
  double dividir() {
    return n1 / n2;
  }

  // função para validar os numeros na entrada
  int entradaDados(String msg) {
    String? input;
    do {
      stdout.write(msg);
      input = stdin.readLineSync();

      // validar
      if (input == null || input.trim().isEmpty) {
        print("Informe um número válido.");
      }
    } while (input == null || input.trim().isEmpty);
    int? numero = int.tryParse(input);
    // se o numero permanecer nulo
    while (numero == null) {
      print("O número não pode ser nulo");
      stdout.write(msg);
      input = stdin.readLineSync();
      numero = int.tryParse(input ?? "");
    }
    return numero;
  }

  // função para validar o segundo termo
  int validarTermo(String msg) {
    int termo;
    do {
      termo = entradaDados(msg);
      if (termo == 0) {
        print("O segundo termo não pode ser zero.");
      }
    } while (termo == 0);
    return termo;
  }
}

void main() {
  //instanciando o objeto
  Divisao div = Divisao(n1: 0, n2: 0);
  print('-' * 70);
  div.n1 = div.entradaDados("Digite o primeiro número: ");
  div.n2 = div.validarTermo("Digite o segundo número (nao pode ser zero): ");
  print('-' * 70);
  print(
    "O resultado da divisão de ${div.n1} por ${div.n2} é ${div.dividir().toStringAsFixed(4)}",
  );
}
