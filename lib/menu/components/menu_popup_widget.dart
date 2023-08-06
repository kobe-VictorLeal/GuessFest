import 'package:flutter/material.dart';
import 'package:guessfest/menu/models/theme_enum.dart';

class MenuPopupWidget extends StatelessWidget {
  final ThemeEnum theme;

  const MenuPopupWidget({
    Key? key,
    required this.theme,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(30, 80, 30, 100),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            'assets/images/menu/popup/popupTheme.png',
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.fill,
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(12.0),
            child: Material(
              color: Colors.transparent,
              child: Column(
                children: [
                  Row(
                    children: [
                      const Spacer(),
                      _exitButton(context),
                    ],
                  ),
                  _titleText(),
                  const SizedBox(height: 10),
                  _themeImage(),
                  const SizedBox(height: 15),
                  _descriptionText(),
                  const SizedBox(height: 10),
                  const Spacer(),
                  _playButton(context),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Text _titleText() {
    return Text(
      theme.title,
      style: const TextStyle(
        fontFamily: "Bebas",
        fontSize: 40,
        color: Colors.white,
        fontWeight: FontWeight.normal,
        decoration: TextDecoration.none,
      ),
      textAlign: TextAlign.center,
    );
  }

  Image _themeImage() {
    return Image.asset(
      'assets/images/menu/themes/${theme.name}.png',
      width: 180,
    );
  }

  Text _descriptionText() {
    return Text(
      theme.description,
      style: const TextStyle(
        fontFamily: "Avenir",
        fontSize: 25,
        color: Colors.white,
        fontWeight: FontWeight.normal,
        decoration: TextDecoration.none,
      ),
      textAlign: TextAlign.center,
    );
  }

  IconButton _exitButton(BuildContext context) {
    return IconButton(
      icon: Image.asset('assets/images/menu/buttons/exit.png'),
      iconSize: 40,
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  IconButton _playButton(BuildContext context) {
    return IconButton(
      icon: Image.asset('assets/images/menu/buttons/play.png'),
      iconSize: 60,
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }
}
