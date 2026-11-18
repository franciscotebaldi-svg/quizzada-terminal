import 'dart:io';

import 'jogador.dart';
import 'pergunta.dart';
import 'placar.dart';

class RespostaInvalidaException implements Exception {
  final String mensagem;

  RespostaInvalidaException(this.mensagem);

  @override
  String toString() => mensagem;
}

class Partida {
  final List<Jogador> jogadores;
  final List<Pergunta> perguntas;
  final Placar placar;

  Partida({
    required this.jogadores,
    required this.perguntas,
    required this.placar,
  });

  int validarResposta(String? entrada) {
    final texto = entrada?.trim().toUpperCase() ?? '';

    if (texto.isEmpty) {
      throw RespostaInvalidaException(
        'Você não digitou nada. Escolha uma letra entre A, B, C ou D.',
      );
    }

    if (texto.length > 1) {
      throw RespostaInvalidaException(
        'Entrada muito longa ("$texto"). Informe apenas uma única letra.',
      );
    }

    if (texto == 'A') return 0;
    if (texto == 'B') return 1;
    if (texto == 'C') return 2;
    if (texto == 'D') return 3;

    throw RespostaInvalidaException(
      'Opção "$texto" não existe. Digite apenas A, B, C ou D.',
    );
  }

  void iniciar() {
    const letras = ['A', 'B', 'C', 'D'];

    print('\nVamos começar o Quizzada!');

    for (var i = 0; i < perguntas.length; i++) {
      final pergunta = perguntas[i];
      print(
        '\n--- Questão ${i + 1} de ${perguntas.length} '
        '[Nível ${pergunta.dificuldade.dificuldade} - valendo ${pergunta.dificuldade.pontos} pts] ---',
      );
      print(pergunta.texto);

      for (var j = 0; j < pergunta.alternativas.length; j++) {
        print('  [${letras[j]}] ${pergunta.alternativas[j]}');
      }

      final escolhas = <int>[];

      for (final jogador in jogadores) {
        int? indiceEscolhido;
        while (indiceEscolhido == null) {
          stdout.write('Vez de ${jogador.nome} - Qual a sua escolha? ');
          final entrada = stdin.readLineSync();

          try {
            indiceEscolhido = validarResposta(entrada);
          } on RespostaInvalidaException catch (e) {
            print('Ops! $e');
          }
        }
        escolhas.add(indiceEscolhido);
      }

      for (var k = 0; k < jogadores.length; k++) {
        final jogador = jogadores[k];
        if (escolhas[k] == pergunta.respostaCorreta) {
          jogador.pontos += pergunta.dificuldade.pontos;
          jogador.acertos++;
          print('${jogador.nome}: Acertou! +${pergunta.dificuldade.pontos} pontos.');
        } else {
          print('${jogador.nome}: Errou!');
        }
      }

      final letraCerta = letras[pergunta.respostaCorreta];
      final textoCerto = pergunta.alternativas[pergunta.respostaCorreta];
      print('Resposta correta: [$letraCerta] $textoCerto.');
    }

    final totalPontosPossiveis = perguntas.fold(
      0,
      (soma, pergunta) => soma + pergunta.dificuldade.pontos,
    );

    jogadores.sort((a, b) => b.pontos.compareTo(a.pontos));
    placar.exibir(jogadores, totalPontosPossiveis, perguntas.length);
  }
}