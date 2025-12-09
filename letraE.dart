/* 
Faça um programa que recebe um número inteiro e mostre o sucessor e antecessor.
 */
import 'dart:io';

class Numero {
  int num;

  // metodo construtor
  Numero({required this.num});

  // Método sucessor
  int calcularSucessor() {
    return num + 1;
  }

  // Método antecessor
  int calcularAntecessor() {
    return num - 1;
  }

  // função para validar a entrada
  int validarEntrada(String msg) {
    String? entrada;
    do {
      stdout.write(msg);
      entrada = stdin.readLineSync();

      //validar
      if (entrada == null || entrada.trim().isEmpty) {
        print("Digite um número válido.");
      }
    } while (entrada == null || entrada.trim().isEmpty);
    int? numero = int.tryParse(entrada);
    // reforça a validação
    while (numero == null) {
      print("Digite um número válido.");
      stdout.write(msg);
      entrada = stdin.readLineSync();
      numero = int.tryParse(entrada ?? "");
    }
    //deu tudo certo, eu retorno "numero" nessa função
    return numero;
  }
}

void main() {
  // instancia o objeto
  Numero number = Numero(num: 0);
  String? resposta;

  while (true) {
    print('\n========= Antecessor e Sucessor =============');
    number.num = number.validarEntrada("Digite um número: ");
    print("");
    print("O antecessor de ${number.num} é ${number.calcularAntecessor()}");
    print("O sucessor de ${number.num} é ${number.calcularSucessor()}");

    stdout.write(
      "Deseja verificar outro número? \nS - Sim\nQualquer outra tecla para sair.\n",
    );
    resposta = stdin.readLineSync()!;
    if (resposta.trim().toLowerCase() != 's') {
      print("Saindo...");
      break;
    }
  }
}
