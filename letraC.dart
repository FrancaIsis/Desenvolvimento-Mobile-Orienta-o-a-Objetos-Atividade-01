/* Faça um programa que peça 4 notas com  entrada de dados. 
O programa deverá calcular a média das notas digitadas.
 */
import 'dart:io';

class Aluno {
  String matricula;
  String nome;
  Map<String, double> notas;

  //construtor
  Aluno({required this.matricula, required this.nome, required this.notas});

  // exibindo as notas
  @override
  String toString() {
    //método para calcular a media
    double media = notas.values.reduce((a, b) => a + b) / notas.length;
    //A função reduce no Dart é um método de iteração que condensa uma coleção (como uma List ou Set) num único valor
    // o que esse metodo deve retornar:
    return '''
Notas
----------------------------------------
Matrícula: $matricula
Nome: $nome
Notas:
  1° nota: ${notas['n1']?.toStringAsFixed(2)}
  2° nota: ${notas['n2']?.toStringAsFixed(2)}
  3° nota: ${notas['n3']?.toStringAsFixed(2)}
  4° nota: ${notas['n4']?.toStringAsFixed(2)}
-----------------------------------------
Média: ${media.toStringAsFixed(2)}

''';
  }
}

void main() {
  // armazenando os alunos
  List<Aluno> alunos = [];

  //loop
  while (true) {
    print('-' * 70);
    print('Calculo das notas dos alunos');
    print('-' * 70);
    stdout.write("\nDigite a matrícula do aluno: ");
    String matricula = stdin.readLineSync()!;

    stdout.write("Digite o nome do aluno: ");
    String nome = stdin.readLineSync()!;

    //coletando as notas dos alunos
    //lugar para "armazenar" essas notas
    Map<String, double> notas = {};
    for (int i = 1; i <= 4; i++) {
      stdout.write("Insira a ${i}° nota: ");
      //casting
      double nota = double.parse(stdin.readLineSync()!);
      notas['n$i'] = nota; //pra ficar uma mapa = n1: nota...
    }

    //Criando um objeto aluno
    alunos.add(Aluno(matricula: matricula, nome: nome, notas: notas));

    print("\nCadastro realizado com sucesso!");

    stdout.write(
      "Deseja realizar outro cálculo?\nS - Sair\nQualquer tecla para sair ",
    );

    String? resposta = stdin.readLineSync()!.toLowerCase().trim();
    if (resposta != "S") {
      print("Até mais...");
      break;
    }
  }
  //Mostrando os cadastros
  print("-" * 70);
  for (Aluno aluno in alunos) {
    print((aluno.toString()));
  }
}
