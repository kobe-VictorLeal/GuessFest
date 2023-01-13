import 'package:flutter/material.dart';

class ThemesRowWidget extends StatefulWidget {
  @override
  State<ThemesRowWidget> createState() => _ThemesRowWidgetState();
}

class _ThemesRowWidgetState extends State<ThemesRowWidget> with SingleTickerProviderStateMixin {
  final List<String> themes = ["action", "beatle", "bible", "NBA", "NFL"];

  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 700),
    vsync: this,
  );
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.fastOutSlowIn,
  );

  _runExpandSection() {
    print("aaaaaaaaaa");
    if (_animation.status != AnimationStatus.completed) {
      _controller.forward();
    } else {
      _controller.animateBack(
        0,
        duration: const Duration(milliseconds: 500),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "GERALGERALGERAL",
          style: TextStyle(
            fontFamily: "Bebas",
            fontSize: 30,
            color: Colors.white,
            fontWeight: FontWeight.normal,
          ),
          textAlign: TextAlign.center,
        ),
        GestureDetector(
          onTap: () {
            _runExpandSection();
          },
          child: _sectionTitleWidget(context),
        ),
        SizeTransition(
          sizeFactor: _animation,
          axis: Axis.vertical,
          axisAlignment: -1,
          child: Center(
            child: _themesWidget(context, themes),
          ),
        ),
      ],
    );
  }

  Widget _sectionTitleWidget(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(left: 30, top: 15, right: 15, bottom: 20),
        height: 100,
        width: MediaQuery.of(context).size.width * 0.9,
        child: Stack(
          children: [
            Image.asset(
              'assets/images/menu/bars/greenBar.png',
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.fill,
            ),
            const Center(
              child: Text(
                "GERAL",
                style: TextStyle(
                  fontFamily: "Bebas",
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                  decoration: TextDecoration.none,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ));
  }

  Widget _themesWidget(BuildContext context, List<String> themes) {
    return SizedBox(
      height: 150,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: themes.length,
          itemBuilder: (ctx, index) {
            return Container(
              padding: const EdgeInsets.only(left: 5, top: 0, right: 5, bottom: 5),
              width: 150,
              child: Column(
                children: [
                  Image.asset('assets/images/menu/themes/${themes[index]}.png'),
                  const SizedBox(height: 5),
                  Text(
                    themes[index],
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
            );
          }),
    );
  }
}
