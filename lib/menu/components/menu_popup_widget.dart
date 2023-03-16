import 'package:flutter/material.dart';

class MenuPopupWidget extends StatelessWidget {
  MenuPopupWidget();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        padding: const EdgeInsets.all(30),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        child: Stack(
          children: [
            Image.asset(
              'assets/images/menu/popup/popupTheme.png',
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.fill,
            ),
            IconButton(
              icon: Image.asset('assets/images/menu/buttons/exit.png'),
              iconSize: 50,
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
