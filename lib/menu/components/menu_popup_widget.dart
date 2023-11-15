import 'package:flutter/material.dart';
import 'package:guessfest/game/game_word_widget.dart';
import 'package:guessfest/menu/models/theme_enum.dart';
import 'package:guessfest/menu/resources/menu_sound.dart';
import 'package:guessfest/resources/resources.dart';

class MenuPopupWidget extends StatelessWidget {
  final ThemeEnum theme;

  MenuPopupWidget({
    Key? key,
    required this.theme,
  }) : super(key: key);

  final MenuSound _sound = MenuSound();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      padding: Resources().isBigScreen(context)
          ? EdgeInsets.only(left: width * 0.25, top: height * 0.2, right: width * 0.25, bottom: height * 0.3)
          : EdgeInsets.only(left: width * 0.09, top: height * 0.08, right: width * 0.09, bottom: height * 0.19),
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
                  const Spacer(),
                  _descriptionText(),
                  const Spacer(),
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
      'assets/images/menu/themes/${theme.imageName}.png',
      width: 180,
      cacheWidth: 500,
    );
  }

  Widget _descriptionText() {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Text(
        theme.description,
        style: const TextStyle(
          fontFamily: "Avenir",
          fontSize: 25,
          color: Colors.white,
          fontWeight: FontWeight.normal,
          decoration: TextDecoration.none,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  IconButton _exitButton(BuildContext context) {
    return IconButton(
      icon: Image.asset('assets/images/menu/buttons/exit.png'),
      iconSize: 40,
      onPressed: () {
        _sound.playBack();
        Navigator.pop(context);
      },
    );
  }

  IconButton _playButton(BuildContext context) {
    return IconButton(
      icon: Image.asset('assets/images/menu/buttons/play.png'),
      iconSize: 60,
      onPressed: () {
        _sound.playStart();
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => GameWordWidget(theme: theme)),
        );
      },
    );
  }
}
