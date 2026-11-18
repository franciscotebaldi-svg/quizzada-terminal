enum Dificuldade
{
  facil,
  media,
  dificil;

  int get pontos
  {
    switch (this)
    {
      case Dificuldade.facil:
        return 10;
      case Dificuldade.media:
        return 20;
      case Dificuldade.dificil:
        return 30;

    }
  }

  String get dificuldade
  {
    switch(this)
    {
      case Dificuldade.facil:
        return "Fácil";
      case Dificuldade.media:
        return "Média";
      case Dificuldade.dificil:
        return "Difícil";
    }
  }

}

