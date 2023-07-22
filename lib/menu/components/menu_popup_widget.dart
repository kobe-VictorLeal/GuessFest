import 'package:flutter/material.dart';

class MenuPopupWidget extends StatelessWidget {
  final String theme;

  MenuPopupWidget({required this.theme});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(30, 30, 30, 30),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Container(
        color: const Color.fromRGBO(0, 133, 144, 1),
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
              padding: const EdgeInsets.all(10.0),
              child: Material(
                color: Colors.transparent,
                child: Column(
                  children: [
                    Row(
                      children: [
                        IconButton(
                          icon: Image.asset('assets/images/menu/buttons/exit.png'),
                          iconSize: 50,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Image.asset('assets/images/menu/themes/$theme.png'),
                    const SizedBox(height: 5),
                    Text(
                      theme,
                      style: const TextStyle(
                        fontFamily: "Bebas",
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                        decoration: TextDecoration.none,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
