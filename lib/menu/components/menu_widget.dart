import 'package:flutter/material.dart';
import 'package:guessfest/menu/Models/themes.dart';
import 'package:guessfest/menu/models/themes_section.dart';
import 'package:guessfest/menu/components/themes_section_widget.dart';

class MenuWidget extends StatelessWidget {
  final List<ThemeSection> themes = [
    ThemeSection(
      title: "General",
      themes: [
        Themes.jobs.name,
        Themes.brand.name,
        Themes.food.name,
        Themes.objects.name,
        Themes.celebrities.name,
        Themes.places.name,
        Themes.animals.name,
        Themes.actions.name,
      ],
    ),
    ThemeSection(
      title: "Sports",
      themes: [
        Themes.sports.name,
        Themes.soccer.name,
        Themes.NBA.name,
        Themes.NFL.name,
      ],
    ),
    ThemeSection(
      title: "Music",
      themes: [
        Themes.music.name,
        Themes.rock.name,
        Themes.beatles.name,
      ],
    ),
    ThemeSection(
      title: "TV",
      themes: [
        Themes.series.name,
        Themes.films.name,
        Themes.got.name,
        Themes.harry.name,
        Themes.starwars.name,
        Themes.friends.name,
        Themes.vikings.name,
      ],
    ),
    ThemeSection(
      title: "Kids",
      themes: [
        Themes.kids.name,
        Themes.objects.name,
        Themes.videogames.name,
      ],
    ),
    ThemeSection(
      title: "History",
      themes: [
        Themes.history.name,
        Themes.the80.name,
        Themes.the90.name,
        Themes.the2000.name,
        Themes.bible.name,
        Themes.politics.name,
      ],
    ),
    ThemeSection(
      title: "Geek",
      themes: [
        Themes.videogames.name,
        Themes.DC.name,
        Themes.marvel.name,
        Themes.got.name,
        Themes.harry.name,
        Themes.starwars.name,
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(82, 58, 113, 1),
      child: SizedBox(
        height: MediaQuery.of(context).size.height - 30,
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
