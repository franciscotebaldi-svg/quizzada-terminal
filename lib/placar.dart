import 'jogador.dart';

abstract class Placar {
  void exibir(List<Jogador> jogadores, int totalPontos, int totalPerguntas);
}

class PlacarSimples extends Placar {
  @override
  void exibir(List<Jogador> jogadores, int totalPontos, int totalPerguntas) {
    print('\n=== PLACAR FINAL ===');
    for (var i = 0; i < jogadores.length; i++) {
      final j = jogadores[i];
      print(
        '${i + 1}º lugar - ${j.nome}: ${j.pontos}/$totalPontos pontos '
        '(${j.acertos}/$totalPerguntas acertos)',
      );
    }
  }
}

class PlacarEstrelas extends Placar {
  @override
  void exibir(List<Jogador> jogadores, int totalPontos, int totalPerguntas) {
    print('\n******************************');
    print('     RANKING COM ESTRELAS');
    print('******************************');
    for (var i = 0; i < jogadores.length; i++) {
      final j = jogadores[i];
      final estrelas = '★' * j.acertos + '☆' * (totalPerguntas - j.acertos);
      print('${i + 1}º ${j.nome} [$estrelas]');
      print('   Pontos: ${j.pontos}/$totalPontos (${j.acertos}/$totalPerguntas acertos)');
    }
    print('******************************');
  }
}