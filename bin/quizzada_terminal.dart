import 'dart:io';

import 'package:quizzada_terminal/jogador.dart';
import 'package:quizzada_terminal/partida.dart';
import 'package:quizzada_terminal/pergunta.dart';

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

  final perguntas = dadosPerguntas
      .map((mapa) => Pergunta.fromMap(mapa))
      .toList();

  String nomeJogador = '';
  while (nomeJogador.isEmpty) {
    stdout.write('Digite seu nome para jogar: ');
    final entrada = stdin.readLineSync()?.trim() ?? '';

    if (entrada.isEmpty) {
      print('Precisamos de um nome para registrar seu placar.');
    } else {
      nomeJogador = entrada;
    }
  }

  final jogador = Jogador(nomeJogador);
  final partida = Partida(jogador: jogador, perguntas: perguntas);

  partida.iniciar();
}
