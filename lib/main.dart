import 'package:flutter/material.dart';
import 'package:guessfest/menu/menu_widget.dart';
import 'package:guessfest/tutorial/tutorial_widget.dart';
import 'package:guessfest/settings/settings_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          fontFamily: "Bebas",
        ),
        home: const MainWidget());
  }
}

class MainWidget extends StatelessWidget {
  const MainWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromRGBO(82, 58, 113, 1),
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                const SizedBox(width: 24),
                _settingsButton(context),
                const Spacer(),
                _titleWidget(),
                const Spacer(),
                _tutorialButton(context),
                const SizedBox(width: 24),
              ],
            ),
            const SizedBox(height: 10),
            MenuWidget(),
          ],
        ),
      ),
    );
  }

  Widget _titleWidget() {
    return const Text(
      "Categorias",
      style: TextStyle(
        fontFamily: "Bebas",
        fontSize: 30,
        color: Colors.white,
        fontWeight: FontWeight.normal,
      ),
      textAlign: TextAlign.center,
    );
  }

  IconButton _settingsButton(BuildContext context) {
    return IconButton(
      icon: Image.asset('assets/images/menu/buttons/settings.png'),
      iconSize: 45,
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SettingsWidget()),
        );
      },
    );
  }

  IconButton _tutorialButton(BuildContext context) {
    return IconButton(
      icon: Image.asset('assets/images/menu/buttons/tutorial.png'),
      iconSize: 45,
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const TutorialWidget()),
        );
      },
    );
  }
}
