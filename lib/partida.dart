import 'dart:io';

import 'jogador.dart';
import 'pergunta.dart';

class RespostaInvalidaException implements Exception {
  final String mensagem;

  RespostaInvalidaException(this.mensagem);

  @override
  String toString() => mensagem;
}

class Partida {
  final Jogador jogador;
  final List<Pergunta> perguntas;

  Partida({required this.jogador, required this.perguntas});

  int get totalPontosPossiveis {
    return perguntas.fold(
      0,
      (soma, pergunta) => soma + pergunta.dificuldade.pontos,
    );
  }

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

    const opcoesValidas = ['A', 'B', 'C', 'D'];
    final indice = opcoesValidas.indexOf(texto);

    if (indice == -1) {
      throw RespostaInvalidaException(
        'Opção "$texto" não existe. Digite apenas A, B, C ou D.',
      );
    }

    return indice;
  }

  void iniciar() {
    const letras = ['A', 'B', 'C', 'D'];

    print('\nBem-vindo(a) ao Quizzada, ${jogador.nome}! Vamos começar.');

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

      int? indiceEscolhido;
      while (indiceEscolhido == null) {
        stdout.write('Qual a sua escolha? ');
        final entrada = stdin.readLineSync();

        try {
          indiceEscolhido = validarResposta(entrada);
        } on RespostaInvalidaException catch (e) {
          print('Ops! $e');
        }
      }

      if (indiceEscolhido == pergunta.respostaCorreta) {
        jogador.pontos += pergunta.dificuldade.pontos;
        jogador.acertos++;
        print('Mandou bem! +${pergunta.dificuldade.pontos} pontos.');
      } else {
        final letraCerta = letras[pergunta.respostaCorreta];
        final textoCerto = pergunta.alternativas[pergunta.respostaCorreta];
        print(
          'Não foi dessa vez! A alternativa correta era [$letraCerta] $textoCerto.',
        );
      }
    }

    exibirPlacar();
  }

  void exibirPlacar() {
    print('\n==============================');
    print('      RESULTADO FINAL');
    print('==============================');
    print('Jogador: ${jogador.nome}');
    print('Pontuação: ${jogador.pontos} de $totalPontosPossiveis pontos');
    print('Acertos: ${jogador.acertos} de ${perguntas.length} questões');
    print('==============================');
  }
}
