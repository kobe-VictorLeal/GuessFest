import 'package:flutter/material.dart';
import 'package:guessfest/menu/components/themes_section_widget.dart';

class ThemeSection {
  String title;
  List<String> themes;

  ThemeSection({
    required this.title,
    required this.themes,
  });
}

class MenuWidget extends StatelessWidget {
  final List<ThemeSection> themes = [
    ThemeSection(
      title: "AAAB",
      themes: ["action", "beatle", "bible", "NBA", "NFL"],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ThemesSectionWidget(title: themes[0].title, themes: themes[0].themes),
      ThemesSectionWidget(title: "BBB", themes: const ["action", "beatle", "bible", "NBA", "NFL"]),
    ]);
  }
}
