# Quizzada de Terminal

Projeto de um jogo de perguntas e respostas (quiz) feito em **Dart** que roda direto no terminal, incluindo todas as funcionalidades obrigatórias e os desafios bônus.

## Como o jogo funciona

1. **Vários jogadores:** Primeiro, o programa pergunta quantas pessoas vão jogar e pede o nome de cada uma. Se der Enter sem escrever nada, ele avisa e pede de novo.
2. **Filtro por dificuldade:** Antes de começar, você escolhe se quer jogar apenas com perguntas fáceis, apenas difíceis ou com todas (usando `where`).
3. **Escolha do placar:** Você também escolhe como quer ver o resultado final: no formato **simples** ou **com estrelas**.
4. **Rodada de perguntas e embaralhamento:** Em cada questão, as alternativas são embaralhadas (`shuffle`) para não ficarem sempre na mesma ordem. Os jogadores se revezam respondendo à mesma pergunta antes de o jogo revelar qual era a certa.
5. **Pontuação por nível:**
   - **Fácil:** 10 pontos
   - **Média:** 20 pontos
   - **Difícil:** 30 pontos
6. **Validação de respostas:** Você pode digitar a letra (`A`, `B`, `C` ou `D`) tanto em minúsculo quanto em maiúsculo. Se digitar vazio, mais de uma letra ou uma opção inválida, o programa mostra um aviso sem travar e pede a resposta novamente.
7. **Ranking final:** No fim da partida, os jogadores são ordenados do maior para o menor número de pontos (`sort`) e exibidos no estilo de placar escolhido.

## O que tem em cada arquivo

- `bin/quizzada_terminal.dart`: Onde o programa começa (`main`), cadastra os jogadores, filtra as perguntas por dificuldade, embaralha as alternativas e inicia o jogo.
- `lib/dificuldade.dart`: O `enum` com as dificuldades e os pontos de cada uma.
- `lib/pergunta.dart`: A classe `Pergunta` com o construtor `fromMap` e o método `embaralhar()` que mistura as opções sem perder o índice da resposta certa.
- `lib/jogador.dart`: A classe `Jogador` que guarda o nome, os pontos e os acertos de cada participante.
- `lib/placar.dart`: A classe abstrata `Placar` e suas duas implementações (`PlacarSimples` e `PlacarEstrelas`).
- `lib/partida.dart`: A classe `Partida` (e a exceção personalizada `RespostaInvalidaException`) que gerencia o revezamento dos turnos, valida as respostas, calcula o total de pontos com `fold` e ordena o ranking com `sort`.

## Como rodar

Com o Dart instalado na máquina, abra o terminal na pasta do projeto e rode:

```bash
dart run

Segue abaixo o link do vídeo de explicação no youtube:
https://youtu.be/rPFiG5aN6XA

