import 'package:shared_preferences/shared_preferences.dart';

class MainFunctions {
  static void saveIntro() async {
    SharedPreferences _sharePrefer = await SharedPreferences.getInstance();
    await _sharePrefer.setBool('INTRO', true);
  }
}
