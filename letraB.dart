/* Faça um programa que peça um ano qualquer. O programa deverá calcular
 e imprimir a idade.
 */
import 'dart:io';

class Idade {
  int anoNasc;
  //int anoAtual;

  // Método construtor com parametro obrigatorio
  Idade({required this.anoNasc});

  // Método para calcular a idade
  int calcularIdade() {
    // pega o ano atual
    int anoAtual = DateTime.now().year;
    return (anoAtual - anoNasc);
  }

  // Função para ler o ano de nascimento do usuario
  int lerAno(String msg) {
    String? input;
    while (true) {
      stdout.write(msg);
      input = stdin.readLineSync();

      if (input == null || input.trim().isEmpty) {
        print("Informe o ano de nascimento.");
        continue;
      }
      //verificando os 4 digitos
      RegExp exp = RegExp(r'^\d{4}$');
      if (!exp.hasMatch(input)) {
        print("Informe o ano com 4 dígitos. Ex.: 1985.");
        continue;
      }

      // converte para inteiro
      int ano = int.parse(input);

      int anoAtual = DateTime.now().year;

      if (ano > anoAtual) {
        print("O ano de nascimento não pode ser maior que o ano corrente.");
        continue;
      }
      return ano;
    }
  }
}

// programa principal
void main() {
  Idade suaIdade = Idade(anoNasc: 0);
  print("Calculando a idade");
  suaIdade.anoNasc = suaIdade.lerAno("Digite seu ano de nascimento (YYYY): ");
  print("Sua idade é: ${suaIdade.calcularIdade()}.");
}
