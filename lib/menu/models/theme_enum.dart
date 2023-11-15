// ignore_for_file: constant_identifier_names
import 'package:guessfest/menu/models/theme_words_list.dart';

enum ThemeEnum {
  food,
  history,
  animals,
  brand,
  actions,
  places,
  objects,
  jobs,
  policy,
  sports,
  soccer,
  NFL,
  NBA,
  films,
  harrypotter,
  starwars,
  music,
  beatles,
  rock,
  kids,
  marvel,
  dccomics,
  videogames,
  series,
  got,
  friends,
  vikings,
  the80s,
  the90s,
  the2000s,
  bible,
  celebrities,
  recife,
  olinda,
  rio,
  romano,
}

extension ThemesExtension on ThemeEnum {
  String get title {
    switch (this) {
      case ThemeEnum.food:
        return 'Comida';
      case ThemeEnum.history:
        return 'História';
      case ThemeEnum.animals:
        return 'Animais';
      case ThemeEnum.brand:
        return 'Marca';
      case ThemeEnum.actions:
        return 'Ação';
      case ThemeEnum.places:
        return 'Lugar';
      case ThemeEnum.objects:
        return 'Objeto';
      case ThemeEnum.jobs:
        return 'Profissão';
      case ThemeEnum.policy:
        return 'Politica';
      case ThemeEnum.sports:
        return 'Esporte';
      case ThemeEnum.soccer:
        return 'Futebol';
      case ThemeEnum.NFL:
        return 'NFL';
      case ThemeEnum.NBA:
        return 'NBA';
      case ThemeEnum.films:
        return 'Filme';
      case ThemeEnum.harrypotter:
        return 'Harry Potter';
      case ThemeEnum.starwars:
        return 'Star Wars';
      case ThemeEnum.music:
        return 'Música';
      case ThemeEnum.beatles:
        return 'The Beatles';
      case ThemeEnum.rock:
        return 'Rock and Roll';
      case ThemeEnum.kids:
        return 'Infantil';
      case ThemeEnum.marvel:
        return 'Marvel';
      case ThemeEnum.dccomics:
        return 'DC Comics';
      case ThemeEnum.videogames:
        return 'Videogames';
      case ThemeEnum.series:
        return 'Série';
      case ThemeEnum.got:
        return 'Game of Thrones';
      case ThemeEnum.friends:
        return 'Friends';
      case ThemeEnum.vikings:
        return 'Vikings';
      case ThemeEnum.the80s:
        return 'Anos 80';
      case ThemeEnum.the90s:
        return 'Anos 90';
      case ThemeEnum.the2000s:
        return 'Anos 2000';
      case ThemeEnum.bible:
        return 'Bíblia';
      case ThemeEnum.celebrities:
        return 'Celebridades';
      case ThemeEnum.recife:
        return 'Recife';
      case ThemeEnum.olinda:
        return 'Olinda';
      case ThemeEnum.rio:
        return 'Rio de janeiro';
      case ThemeEnum.romano:
        return 'Império Romano';
    }
  }

  String get description {
    switch (this) {
      case ThemeEnum.food:
        return "Comidas pra matar a fome de vencer";
      case ThemeEnum.history:
        return "Eventos importantes da história da humanidade";
      case ThemeEnum.animals:
        return "Grande parte da fauna na Terra";
      case ThemeEnum.brand:
        return "Marcas famosas de tecnologia, esportes e mais";
      case ThemeEnum.actions:
        return "Verbos que descrevem ações do dia a dia";
      case ThemeEnum.places:
        return "Países, lugares, edificações e muito mais";
      case ThemeEnum.objects:
        return "Utensílios do cotidiano";
      case ThemeEnum.jobs:
        return "";
      case ThemeEnum.policy:
        return "Acontecimentos e personagens da política brasileira";
      case ThemeEnum.sports:
        return "Palavras atléticas de quase todos os esportes";
      case ThemeEnum.soccer:
        return "Maiores times, jogadores e ligas do futebol";
      case ThemeEnum.NFL:
        return "Os times, jogadores e a história da NFL";
      case ThemeEnum.NBA:
        return "Os times, jogadores e a história da NBA";
      case ThemeEnum.films:
        return "Filmes e atores clássicos da telona na sua TV";
      case ThemeEnum.harrypotter:
        return "O menino bruxo que encantou o mundo";
      case ThemeEnum.starwars:
        return "Vença ou não vença, não existe tentar";
      case ThemeEnum.music:
        return "Todo tipo de som, artista e álbum para ouvir";
      case ThemeEnum.beatles:
        return "As músicas mais famosas dos Reis do Iê Iê Iê";
      case ThemeEnum.rock:
        return "Esse tema é de Rock, bebê!";
      case ThemeEnum.kids:
        return "Palavras fáceis para jogar com toda a família";
      case ThemeEnum.marvel:
        return "Os maiores heróis e vilões da Terra";
      case ThemeEnum.dccomics:
        return "Os superheróis mais famosos e seus vilões";
      case ThemeEnum.videogames:
        return "O melhor do entretenimento eletrônico";
      case ThemeEnum.series:
        return "Séries de todos os gêneros e de todas as eras";
      case ThemeEnum.got:
        return "A história dos Sete Reinos e mais";
      case ThemeEnum.friends:
        return "6 amigos, uma galinha e um pato";
      case ThemeEnum.vikings:
        return "A batalha pra descobrir o verdadeiro Rei";
      case ThemeEnum.the80s:
        return "Disco não morreu. Não aqui, ao menos";
      case ThemeEnum.the90s:
        return "Música, TV e a cara dos anos 1990";
      case ThemeEnum.the2000s:
        return "Os marcos que abalaram o mundo nos anos 2000";
      case ThemeEnum.bible:
        return "Pessoas e histórias do livro mais lido do mundo";
      case ThemeEnum.celebrities:
        return "As pessoas que todo mundo conhecem";
      case ThemeEnum.recife:
        return "Tema prático, histórico e sentimental da cidade do Recife";
      case ThemeEnum.olinda:
        return "Olinda, quero cantar... quer dizer, adivinhar";
      case ThemeEnum.rio:
        return "Cidade maravilhosa! E esse tema também";
      case ThemeEnum.romano:
        return "Você já pensou em jogar esse tema hoje?";
    }
  }

  String get imageName {
    switch (this) {
      case ThemeEnum.food:
        return 'food';
      case ThemeEnum.history:
        return 'history';
      case ThemeEnum.animals:
        return 'animals';
      case ThemeEnum.brand:
        return 'brand';
      case ThemeEnum.actions:
        return 'actions';
      case ThemeEnum.places:
        return 'places';
      case ThemeEnum.objects:
        return 'objects';
      case ThemeEnum.jobs:
        return 'jobs';
      case ThemeEnum.policy:
        return 'policy';
      case ThemeEnum.sports:
        return 'sports';
      case ThemeEnum.soccer:
        return 'soccer';
      case ThemeEnum.NFL:
        return 'NFL';
      case ThemeEnum.NBA:
        return 'NBA';
      case ThemeEnum.films:
        return 'films';
      case ThemeEnum.harrypotter:
        return 'harrypotter';
      case ThemeEnum.starwars:
        return 'starwars';
      case ThemeEnum.music:
        return 'music';
      case ThemeEnum.beatles:
        return 'beatles';
      case ThemeEnum.rock:
        return 'rock';
      case ThemeEnum.kids:
        return 'kids';
      case ThemeEnum.marvel:
        return 'marvel';
      case ThemeEnum.dccomics:
        return 'dccomics';
      case ThemeEnum.videogames:
        return 'videogames';
      case ThemeEnum.series:
        return 'series';
      case ThemeEnum.got:
        return 'got';
      case ThemeEnum.friends:
        return 'friends';
      case ThemeEnum.vikings:
        return 'vikings';
      case ThemeEnum.the80s:
        return 'the80s';
      case ThemeEnum.the90s:
        return 'the90s';
      case ThemeEnum.the2000s:
        return 'the2000s';
      case ThemeEnum.bible:
        return 'bible';
      case ThemeEnum.celebrities:
        return 'celebrities';
      case ThemeEnum.recife:
        return 'default';
      case ThemeEnum.olinda:
        return 'default';
      case ThemeEnum.rio:
        return 'default';
      case ThemeEnum.romano:
        return 'default';
    }
  }
}
