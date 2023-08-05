import 'package:guessfest/menu/models/theme_enum.dart';

class ThemeSection {
  String title;
  List<ThemeEnum> themes;

  ThemeSection({
    required this.title,
    required this.themes,
  });
}
