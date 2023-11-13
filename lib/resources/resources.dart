import 'package:flutter/material.dart';
import 'package:guessfest/resources/constants.dart';

class Resources {
  static final Resources _instance = Resources._internal();

  factory Resources() {
    return _instance;
  }

  Resources._internal() {}

  bool isBigScreen(BuildContext context) {
    return (MediaQuery.of(context).size.width > Constants.isBigWidth);
  }
}
