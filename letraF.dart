/* 
Faça um programa que receba um número qualquer e calcule o dobro e o triplo desse número.
 */
import 'dart:io';

class Numero {
  int num;

  // metodo construtor
  Numero({required this.num});

  // metodo dobro
  int calcularDobro() {
    return num * 2;
  }

  // metodo triplo
  int calcularTriplo() {
    return num * 3;
  }

  // Função para validar a entrada
  int validarEntrada(String msg) {
    String? entrada;
    do {
      stdout.write(msg);
      entrada = stdin.readLineSync();

      if (entrada == null || entrada.trim().isEmpty) {
        print("Digite um número válido.");
      }
    } while (entrada == null || entrada.trim().isEmpty);
    int? numero = int.tryParse(entrada);
    //reforça validação

    while (numero == null) {
      print("Digite um número inteiro válido.");
      stdout.write(msg);
      entrada = stdin.readLineSync();
      int? numero = int.tryParse(entrada ?? "");
    }
    return numero;
  }
}

void main() {
  Numero number = Numero(num: 0);
  String? resposta;
  while (true) {
    print("============== Dobro e Triplo =============");
    number.num = number.validarEntrada("Digite um número: ");
    print("");
    print("O dobro de ${number.num} é ${number.calcularDobro()}");
    print("O triplo de ${number.num} é ${number.calcularTriplo()}");
    print("-" * 70);
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
