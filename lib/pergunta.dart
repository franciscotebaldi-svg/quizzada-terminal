import 'dificuldade.dart';

class Pergunta {
  final String texto;
  final List<String> alternativas;
  final int respostaCorreta;
  final Dificuldade dificuldade;

  Pergunta({
    required this.texto,
    required this.alternativas,
    required this.respostaCorreta,
    required this.dificuldade,
  });

  Pergunta.fromMap(Map<String, dynamic> mapa)
    : texto = mapa['texto'] as String,
      alternativas = List<String>.from(mapa['alternativas']),
      respostaCorreta = mapa['respostaCorreta'] as int,
      dificuldade = Dificuldade.values.byName(mapa['dificuldade'] as String);
}
