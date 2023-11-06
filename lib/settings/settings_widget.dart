import 'package:flutter/material.dart';
import 'package:guessfest/menu/resources/menu_sound.dart';
import 'package:guessfest/settings/shared_preferences.dart';

class SettingsWidget extends StatefulWidget {
  const SettingsWidget({Key? key}) : super(key: key);

  @override
  State<SettingsWidget> createState() => _SettingsWidgetState();
}

class _SettingsWidgetState extends State<SettingsWidget> {
  final MenuSound _sound = MenuSound();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/menu/settings/background.png"),
              fit: BoxFit.none,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16, top: 16, right: 16, bottom: 0),
          child: Column(
            children: [
              _backButton(context),
              const SizedBox(height: 20),
              sectionTitleWidget("Efeitos sonoros"),
              _soundsRow(context),
              sectionTitleWidget("Música de fundo"),
              _musicRow(context),
            ],
          ),
        )
      ]),
    );
  }

  Column sectionTitleWidget(String title) {
    return Column(
      children: [
        const SizedBox(height: 40),
        _textWidget(text: title, fontSize: 36),
        Image.asset(
          "assets/images/menu/settings/lineSettings.png",
          width: 180,
          height: 7,
          fit: BoxFit.fill,
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _backButton(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: Image.asset('assets/images/game/buttons/back.png'),
          iconSize: 45,
          onPressed: () {
            _sound.playBack();
            Navigator.pop(context);
          },
        ),
        const Spacer(),
        _textWidget(text: "Ajustes"),
        const Spacer(),
        const Spacer(),
      ],
    );
  }

  Widget _textWidget({required String text, double fontSize = 30}) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: "Bebas",
        fontSize: fontSize,
        color: Colors.white,
        fontWeight: FontWeight.normal,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _soundsRow(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        IconButton(
          icon: Image.asset('assets/images/menu/settings/soundOn${isSoundActive ? 'Yellow' : 'White'}.png'),
          iconSize: 60,
          onPressed: () {
            setState(() {
              isSoundActive = true;
              _sound.playSelected();
            });
          },
        ),
        const SizedBox(width: 40),
        IconButton(
          icon: Image.asset('assets/images/menu/settings/soundOff${isSoundActive ? 'White' : 'Yellow'}.png'),
          iconSize: 60,
          onPressed: () {
            setState(() {
              isSoundActive = false;
            });
          },
        ),
        const Spacer(),
      ],
    );
  }

  Widget _musicRow(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        IconButton(
          icon: Image.asset('assets/images/menu/settings/soundOn${isMusicActive ? 'Yellow' : 'White'}.png'),
          iconSize: 60,
          onPressed: () {
            setState(() {
              _sound.playSelected();
              isMusicActive = true;
            });
          },
        ),
        const SizedBox(width: 40),
        IconButton(
          icon: Image.asset('assets/images/menu/settings/soundOff${isMusicActive ? 'White' : 'Yellow'}.png'),
          iconSize: 60,
          onPressed: () {
            setState(() {
              _sound.playSelected();
              isMusicActive = false;
            });
          },
        ),
        const Spacer(),
      ],
    );
  }
}
