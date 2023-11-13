import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:guessfest/menu/models/theme_enum.dart';
import 'package:guessfest/menu/models/themes_section.dart';
import 'package:guessfest/menu/models/theme_words_list.dart';
import 'package:guessfest/menu/components/menu_themes_section_widget.dart';

class MenuWidget extends StatelessWidget {
  final List<ThemeSection> themes = [
    ThemeSection(
      title: "Geral",
      themes: [
        ThemeEnum.jobs,
        ThemeEnum.brand,
        ThemeEnum.food,
        ThemeEnum.objects,
        ThemeEnum.celebrities,
        ThemeEnum.places,
        ThemeEnum.animals,
        ThemeEnum.actions,
      ],
    ),
    ThemeSection(
      title: "Esportes",
      themes: [
        ThemeEnum.sports,
        ThemeEnum.soccer,
        ThemeEnum.NBA,
        ThemeEnum.NFL,
      ],
    ),
    ThemeSection(
      title: "Música",
      themes: [
        ThemeEnum.music,
        ThemeEnum.rock,
        ThemeEnum.beatles,
      ],
    ),
    ThemeSection(
      title: "TV",
      themes: [
        ThemeEnum.films,
        ThemeEnum.got,
        ThemeEnum.harrypotter,
        ThemeEnum.starwars,
        ThemeEnum.friends,
        ThemeEnum.vikings,
        ThemeEnum.series,
      ],
    ),
    ThemeSection(
      title: "Infantil",
      themes: [
        ThemeEnum.kids,
        ThemeEnum.objects,
        ThemeEnum.videogames,
      ],
    ),
    ThemeSection(
      title: "História",
      themes: [
        ThemeEnum.history,
        ThemeEnum.the80s,
        ThemeEnum.the90s,
        ThemeEnum.the2000s,
        ThemeEnum.bible,
        ThemeEnum.policy,
      ],
    ),
    ThemeSection(
      title: "Geek",
      themes: [
        ThemeEnum.videogames,
        ThemeEnum.dccomics,
        ThemeEnum.marvel,
        ThemeEnum.got,
        ThemeEnum.harrypotter,
        ThemeEnum.starwars,
      ],
    ),
    ThemeSection(
      title: "Outros Temas",
      themes: [
        ThemeEnum.recife,
        ThemeEnum.olinda,
      ],
    ),
  ];

  MenuWidget({Key? key}) : super(key: key);

  Future<void> _readWordsJson() async {
    final String jsonString = await rootBundle.loadString('assets/data/wordsPT.json');
    themeWords = themeWordsListFromJson(jsonString);
  }

  @override
  Widget build(BuildContext context) {
    _readWordsJson();
    return Container(
      color: const Color.fromRGBO(82, 58, 113, 1),
      child: SizedBox(
        height: MediaQuery.of(context).size.height - 90,
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: themes.length,
          itemBuilder: (ctx, index) {
            return Column(
              children: [
                ThemesSectionWidget(title: themes[index].title, themes: themes[index].themes),
                Visibility(visible: index == themes.length - 1, child: const SizedBox(height: 200))
              ],
            );
          },
        ),
      ),
    );
  }
}
