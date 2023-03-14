import 'package:flutter/material.dart';

class MenuPopupWidget extends StatelessWidget {
  MenuPopupWidget();

  @override
  Widget build(BuildContext context) {
    return Container(
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
          ElevatedButton(
              child: Text("Fechar", style: TextStyle(fontSize: 30)),
              onPressed: () {
                Navigator.pop(context);
              }), //function
        ],
      ),
    );
  }
}
