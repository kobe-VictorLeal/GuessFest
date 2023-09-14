import 'package:flutter/material.dart';
import 'package:guessfest/menu/models/theme_enum.dart';
import 'package:guessfest/menu/models/themes_section.dart';
import 'package:guessfest/menu/components/menu_themes_section_widget.dart';

class MenuWidget extends StatelessWidget {
  final List<ThemeSection> themes = [
    ThemeSection(
      title: "General",
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
      title: "Sports",
      themes: [
        ThemeEnum.sports,
        ThemeEnum.soccer,
        ThemeEnum.NBA,
        ThemeEnum.NFL,
      ],
    ),
    ThemeSection(
      title: "Music",
      themes: [
        ThemeEnum.music,
        ThemeEnum.rock,
        ThemeEnum.beatles,
      ],
    ),
    ThemeSection(
      title: "TV",
      themes: [
        ThemeEnum.series,
        ThemeEnum.films,
        ThemeEnum.got,
        ThemeEnum.harry,
        ThemeEnum.starwars,
        ThemeEnum.friends,
        ThemeEnum.vikings,
      ],
    ),
    ThemeSection(
      title: "Kids",
      themes: [
        ThemeEnum.kids,
        ThemeEnum.objects,
        ThemeEnum.videogames,
      ],
    ),
    ThemeSection(
      title: "History",
      themes: [
        ThemeEnum.history,
        ThemeEnum.the80,
        ThemeEnum.the90,
        ThemeEnum.the2000,
        ThemeEnum.bible,
        ThemeEnum.politics,
      ],
    ),
    ThemeSection(
      title: "Geek",
      themes: [
        ThemeEnum.videogames,
        ThemeEnum.DC,
        ThemeEnum.marvel,
        ThemeEnum.got,
        ThemeEnum.harry,
        ThemeEnum.starwars,
      ],
    ),
  ];

  MenuWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(82, 58, 113, 1),
      child: SizedBox(
        height: MediaQuery.of(context).size.height - 90,
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: themes.length,
            itemBuilder: (ctx, index) {
              return ThemesSectionWidget(title: themes[index].title, themes: themes[index].themes);
            }),
      ),
    );
  }
}
