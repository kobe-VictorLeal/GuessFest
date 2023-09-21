import 'dart:convert';
import 'package:collection/collection.dart';
import 'package:guessfest/menu/models/theme_enum.dart';

ThemeWordsList themeWords = ThemeWordsList(themes: []);

ThemeWordsList themeWordsListFromJson(String str) => ThemeWordsList.fromJson(json.decode(str));

//String themeWordsToJson(ThemeWordsList data) => json.encode(data.toJson());

class ThemeWordsList {
  List<ThemeWords> themes;

  ThemeWordsList({
    required this.themes,
  });

  List<String> getWords(ThemeEnum theme) {
    final themeSelected = themes.firstWhereOrNull((element) => element.title.toLowerCase() == theme.name.toLowerCase());
    return themeSelected?.words ?? [];
  }

  factory ThemeWordsList.fromJson(Map<String, dynamic> json) => ThemeWordsList(
        themes: List<ThemeWords>.from(json["theme"].map((x) => ThemeWords.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "theme": List<dynamic>.from(themes.map((x) => x.toJson())),
      };
}

class ThemeWords {
  String title;
  List<String> words;

  ThemeWords({
    required this.title,
    required this.words,
  });

  factory ThemeWords.fromJson(Map<String, dynamic> json) => ThemeWords(
        title: json["title"],
        words: List<String>.from(json["words"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "words": List<dynamic>.from(words.map((x) => x)),
      };
}
