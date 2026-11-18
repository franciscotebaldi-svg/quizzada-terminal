# Quizzada de Terminal v1

Projeto de um jogo de perguntas e respostas (quiz) feito em **Dart** que roda direto no terminal.

## Como o jogo funciona

1. Primeiro, o programa pede o seu nome. Se você der Enter sem escrever nada, ele avisa e pede de novo.
2. Depois começam as 5 perguntas sobre Dart básico, cada uma com 4 opções (`A`, `B`, `C` ou `D`).
3. Cada pergunta tem uma dificuldade que muda quantos pontos ela vale:
   - **Fácil:** 10 pontos
   - **Média:** 20 pontos
   - **Difícil:** 30 pontos
4. Você pode digitar a letra tanto em minúsculo quanto em maiúsculo. Se digitar algo inválido (como vazio, mais de uma letra ou outra letra que não seja A, B, C ou D), o programa mostra um aviso sem travar e pergunta novamente.
5. A cada resposta ele diz se você acertou ou mostra qual era a certa. No final, aparece o placar com seus pontos e quantas questões você acertou.

## O que tem em cada arquivo

- `bin/quizzada_terminal.dart`: Onde o programa começa (`main`), cria a lista de perguntas e inicia o jogo.
- `lib/dificuldade.dart`: O `enum` com as dificuldades e os pontos de cada uma.
- `lib/pergunta.dart`: A classe `Pergunta` com o `fromMap` para montar cada questão.
- `lib/jogador.dart`: A classe `Jogador` que guarda o nome, os pontos e os acertos.
- `lib/partida.dart`: A classe `Partida` que roda o quiz, valida as respostas usando exceção personalizada e calcula o total de pontos com `fold`.

## Como rodar

Com o Dart instalado na máquina, abra o terminal na pasta do projeto e rode:

```bash
dart run