/* Faça um programa que peça 2 valores. Calcule e imprima  
a soma, o produto, a subtração, a divisão, o resto da divisão e a divisão inteira.
 */
import 'dart:io';

class Calculo {
  int n1;
  int n2;

  //Método construtor
  Calculo(this.n1, this.n2);

  //Método para realizar a soma
  int somar() {
    return (n1 + n2);
  }

  //Método para multiplicar
  int multiplicar() {
    return (n1 * n2);
  }

  //Método para subtrair
  int subtrair() {
    return (n1 - n2);
  }

  //Método para dividir
  double dividir() {
    return (n1 / n2);
  }

  //Método resto divisão
  int calcularResto() {
    return (n1 % n2);
  }

  //Método divisão inteira
  int calcularDivInteira() {
    return (n1 ~/ n2);
  }

  // Função para ler os numeros com validação
  int coletarEntrada(String msg) {
    String? entrada;
    do {
      stdout.write(msg); // o parametro que colocamos na função
      entrada = stdin.readLineSync();

      //Validando
      if (entrada == null || entrada.trim().isEmpty) {
        print("Necessário que você informe um número!");
      }
    } while (entrada == null || entrada.trim().isEmpty);
    int? num = int.tryParse(entrada);
    //Se entrada não for um número válido, num vira null mesmo após a validação inicial.
    while (num == null) {
      print("Informe um número!");
      stdout.write(msg);
      entrada = stdin.readLineSync();
      num = int.tryParse(entrada ?? "");
    }
    return num;
  }

  // Função para validar o segundo numero para ser != 0
  int validarTermo(String msg) {
    int termo;
    do {
      termo = coletarEntrada(msg);
      if (termo == 0) {
        print("O segundo termo não pode ser zero.");
      }
    } while (termo == 0);
    return termo;
  }
}

//programa
void main() {
  Calculo calc = Calculo(0, 0);
  print('\n======= Calculo ========');
  calc.n1 = calc.coletarEntrada("Digite o primeiro número: ");
  calc.n2 = calc.validarTermo("Digite o segundo número diferente de ZERO: ");
  print("-" * 70);
  print("Resultados:");
  print("Soma: ${calc.somar()}");
  print("Subtração: ${calc.subtrair()}");
  print("Multiplicação: ${calc.multiplicar()}");
  print("Divisão: ${calc.dividir().toStringAsFixed(2)}");
  print("Resto da divisão: ${calc.calcularResto()}");
  print("Divisão absoluta: ${calc.calcularDivInteira()}");
}
