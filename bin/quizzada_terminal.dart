import 'dart:io';

import 'package:quizzada_terminal/dificuldade.dart';
import 'package:quizzada_terminal/jogador.dart';
import 'package:quizzada_terminal/partida.dart';
import 'package:quizzada_terminal/pergunta.dart';
import 'package:quizzada_terminal/placar.dart';

void main() {
  final dadosPerguntas = [
    {
      'texto': 'Qual palavra-chave cria uma variável que só pode receber valor uma única vez?',
      'alternativas': ['var', 'final', 'dynamic', 'late'],
      'respostaCorreta': 1,
      'dificuldade': 'facil',
    },
    {
      'texto': 'Qual tipo de dado usamos em Dart para guardar números sem casas decimais?',
      'alternativas': ['double', 'num', 'int', 'String'],
      'respostaCorreta': 2,
      'dificuldade': 'facil',
    },
    {
      'texto': 'Qual operador fornece um valor padrão caso a expressão à esquerda seja null?',
      'alternativas': ['?.', '??', '==', '&&'],
      'respostaCorreta': 1,
      'dificuldade': 'media',
    },
    {
      'texto': 'Qual método reduz uma lista a um único valor acumulando cada elemento?',
      'alternativas': ['map', 'where', 'forEach', 'fold'],
      'respostaCorreta': 3,
      'dificuldade': 'media',
    },
    {
      'texto': 'Qual estrutura de decisão garante que todos os casos de um enum sejam cobertos?',
      'alternativas': ['if', 'while', 'switch', 'for'],
      'respostaCorreta': 2,
      'dificuldade': 'dificil',
    },
  ];

  final todasPerguntas = dadosPerguntas.map((mapa) => Pergunta.fromMap(mapa)).toList();

  // 1. Quantidade e cadastro de vários jogadores
  int qtdJogadores = 0;
  while (qtdJogadores < 1) {
    stdout.write('Quantos jogadores vão participar? ');
    final entrada = stdin.readLineSync()?.trim() ?? '';
    final numero = int.tryParse(entrada);

    if (numero == null || numero < 1) {
      print('Digite um número válido (pelo menos 1 jogador).');
    } else {
      qtdJogadores = numero;
    }
  }

  final jogadores = <Jogador>[];
  for (var i = 1; i <= qtdJogadores; i++) {
    String nome = '';
    while (nome.isEmpty) {
      stdout.write('Nome do jogador $i: ');
      final entrada = stdin.readLineSync()?.trim() ?? '';
      if (entrada.isEmpty) {
        print('O nome não pode ficar vazio.');
      } else {
        nome = entrada;
      }
    }
    jogadores.add(Jogador(nome));
  }

  // 2. Filtro por dificuldade usando where
  List<Pergunta> perguntasFiltradas = [];
  while (perguntasFiltradas.isEmpty) {
    print('\nEscolha a dificuldade:');
    print('1 - Só fáceis');
    print('2 - Só difíceis');
    print('3 - Todas');
    stdout.write('Opção: ');
    final opcao = stdin.readLineSync()?.trim() ?? '';

    if (opcao == '1') {
      perguntasFiltradas = todasPerguntas
          .where((p) => p.dificuldade == Dificuldade.facil)
          .toList();
    } else if (opcao == '2') {
      perguntasFiltradas = todasPerguntas
          .where((p) => p.dificuldade == Dificuldade.dificil)
          .toList();
    } else if (opcao == '3') {
      perguntasFiltradas = todasPerguntas;
    } else {
      print('Opção inválida. Escolha 1, 2 ou 3.');
    }
  }

  // 3. Embaralhar alternativas de cada pergunta
  for (final pergunta in perguntasFiltradas) {
    pergunta.embaralhar();
  }

  // 4. Escolha da implementação de Placar
  Placar? placarEscolhido;
  while (placarEscolhido == null) {
    print('\nEscolha o estilo do placar:');
    print('1 - Placar simples');
    print('2 - Placar com estrelas');
    stdout.write('Opção: ');
    final opcao = stdin.readLineSync()?.trim() ?? '';

    if (opcao == '1') {
      placarEscolhido = PlacarSimples();
    } else if (opcao == '2') {
      placarEscolhido = PlacarEstrelas();
    } else {
      print('Opção inválida. Escolha 1 ou 2.');
    }
  }

  final partida = Partida(
    jogadores: jogadores,
    perguntas: perguntasFiltradas,
    placar: placarEscolhido,
  );

  partida.iniciar();
}