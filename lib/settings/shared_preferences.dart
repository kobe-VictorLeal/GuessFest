import 'package:shared_preferences/shared_preferences.dart';

getActiveSoundValue() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool value = prefs.getBool('isSoundActive');
  return value;
}

getActiveMusicValue() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getBool('isMusicActive');
}

setActiveSoundValue({required bool value}) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool('isSoundActive', value);
}

setActiveMusicValue({required bool value}) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool('isMusicActive', value);
}
