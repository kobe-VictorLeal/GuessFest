import 'package:flutter/material.dart';

class TutorialWidget extends StatelessWidget {
  const TutorialWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(45, 135, 123, 1),
      body: SafeArea(
        child: Stack(children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/menu/tutorial/tutorial.png"),
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          _backButton(context),
        ]),
      ),
    );
  }

  Widget _backButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 16, right: 16, bottom: 0),
      child: Row(
        children: [
          IconButton(
            icon: Image.asset('assets/images/game/buttons/back.png'),
            iconSize: 45,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
