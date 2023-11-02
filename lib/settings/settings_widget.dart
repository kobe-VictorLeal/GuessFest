import 'package:flutter/material.dart';
import 'package:guessfest/settings/shared_preferences.dart';

class SettingsWidget extends StatelessWidget {
  const SettingsWidget({Key? key}) : super(key: key);

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
              const SizedBox(height: 60),
              _textWidget(text: "Efeitos sonoros", fontSize: 36),
              Image.asset(
                "assets/images/menu/settings/lineSettings.png",
                width: 180,
                height: 7,
                fit: BoxFit.fill,
              ),
              const SizedBox(height: 20),
              _soundsRow(context),
            ],
          ),
        )
      ]),
    );
  }

  Widget _backButton(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: Image.asset('assets/images/game/buttons/back.png'),
          iconSize: 45,
          onPressed: () {
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
          icon: Image.asset('assets/images/menu/settings/soundOnWhite.png'),
          iconSize: 60,
          onPressed: () {
            setActiveSoundValue(value: true);
          },
        ),
        const SizedBox(width: 40),
        IconButton(
          icon: Image.asset('assets/images/menu/settings/soundOffWhite.png'),
          iconSize: 60,
          onPressed: () {
            setActiveSoundValue(value: false);
          },
        ),
        const Spacer(),
      ],
    );
  }
}
