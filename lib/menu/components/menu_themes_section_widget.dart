import 'package:flutter/material.dart';
import 'package:guessfest/menu/components/menu_popup_widget.dart';
import 'package:guessfest/menu/models/theme_enum.dart';

class ThemesSectionWidget extends StatefulWidget {
  final String title;
  final List<ThemeEnum> themes;

  const ThemesSectionWidget({
    Key? key,
    required this.title,
    required this.themes,
  }) : super(key: key);

  @override
  State<ThemesSectionWidget> createState() => _ThemesSectionWidgetState();
}

class _ThemesSectionWidgetState extends State<ThemesSectionWidget> with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 700),
    vsync: this,
  );
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.fastOutSlowIn,
  );

  _runExpandSection() {
    if (_animation.status != AnimationStatus.completed) {
      _controller.forward();
    } else {
      _controller.animateBack(
        0,
        duration: const Duration(milliseconds: 500),
      );
    }
  }

  _openPopup(BuildContext context, ThemeEnum theme) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return MenuPopupWidget(theme: theme);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
            child: _themesWidget(context, widget.themes),
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
            Center(
              child: Text(
                widget.title,
                style: _setTextStyle(fontSize: 30),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ));
  }

  Widget _themesWidget(BuildContext context, List<ThemeEnum> themes) {
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
                  GestureDetector(
                    onTap: () {
                      _openPopup(context, themes[index]);
                    },
                    child: Image.asset('assets/images/menu/themes/${themes[index].name}.png'),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    themes[index].title,
                    style: _setTextStyle(fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            );
          }),
    );
  }

  TextStyle _setTextStyle({double fontSize = 12}) {
    return TextStyle(
      fontFamily: "Bebas",
      fontSize: fontSize,
      color: Colors.white,
      fontWeight: FontWeight.normal,
      decoration: TextDecoration.none,
    );
  }
}
