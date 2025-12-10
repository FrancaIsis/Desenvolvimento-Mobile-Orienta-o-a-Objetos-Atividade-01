/* 
Faça um programa para converter medidas
 */
import 'dart:io';

class Medida {
  double num;

  // método construtor
  Medida(this.num);

  // método metro para centímetro
  double converterMetroCentimetro() {
    return num * 100;
  }

  // método metro para quilômetro
  double converterMetroQuilometro() {
    return num / 1000;
  }

  // método centimetro para metro
  double converterCentimetroMetro() {
    return num / 100;
  }

  // método quilômetro para metro
  double converterQuilometroMetro() {
    return num * 1000;
  }

  // função para validar a entrada
  double validarEntrada(String msg) {
    String? entrada;
    do {
      stdout.write(msg);
      entrada = stdin.readLineSync();

      //validar
      if (entrada == null || entrada.trim().isEmpty) {
        print("Digite um número válido.");
      }
    } while (entrada == null || entrada.trim().isEmpty);
    double? numero = double.tryParse(entrada);
    // reforça a validação
    while (numero == null) {
      print("Digite um número válido.");
      stdout.write(msg);
      entrada = stdin.readLineSync();
      numero = double.tryParse(entrada ?? "");
    }
    //deu tudo certo, eu retorno "numero" nessa função
    return numero;
  }
}

void main() {
  Medida med = Medida(0);
  String? resposta;
  int? opcao;

  do {
    // Menu
    print("Escolha uma opção: ");
    print("1 - Converter de metros para centímetros");
    print("2 - Converter de centímetros para metros");
    print("3 - Converter de metros para quilômetros");
    print("4 - Converter de quilômetros para metros");
    print("0 - Sair");
    print("=" * 70);

    resposta = stdin.readLineSync();
    opcao =
        int.tryParse(resposta ?? '') ??
        0; //se tudo der errado transforma em zero

    switch (opcao) {
      case 1:
        med.num = med.validarEntrada("Digite a medida de deseja converter: ");
        print('-' * 70);
        print(
          "A medida ${med.num} metros equivale a ${med.converterMetroCentimetro().toStringAsFixed(2)} centímetros",
        );
        break;
      case 2:
        med.num = med.validarEntrada("Digite a medida de deseja converter: ");
        print('-' * 70);
        print(
          "A medida ${med.num} centímetros equivale a ${med.converterCentimetroMetro().toStringAsFixed(2)} metros",
        );
        break;
      case 3:
        med.num = med.validarEntrada("Digite a medida de deseja converter: ");
        print('-' * 70);
        print(
          "A medida ${med.num} metros equivale a ${med.converterMetroQuilometro().toStringAsFixed(2)} quilômetros",
        );
        break;
      case 4:
        med.num = med.validarEntrada("Digite a medida de deseja converter: ");
        print('-' * 70);
        print(
          "A medida ${med.num} quilômetros equivale a ${med.converterQuilometroMetro().toStringAsFixed(2)} metros",
        );
        break;
      case 0:
        print("Saindo..");
        break;
      default:
        print("Escolha uma opção válida!");
    }
  } while (opcao != 0);

  // while (true) {
  //   print('\n========= Conversor de Medidas =============');
  //   med.num = med.validarEntrada("Digite um valor a ser convertido:");
  //   print("");

  //   stdout.write(
  //     "Deseja verificar outro número? \nS - Sim\nQualquer outra tecla para sair.\n",
  //   );
  //   resposta = stdin.readLineSync()!;
  //   if (resposta.trim().toLowerCase() != 's') {
  //     print("Saindo...");
  //     break;
  //   }
  // }
}
