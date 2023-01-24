import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static late SharedPreferences _prefs;

  static String _email = "";
  static String _password = "";
  static bool _guardar = false;

  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static bool get guardar {
    return _prefs.getBool('guardar') ?? _guardar;
  }

  static set guardar(bool guardar) {
    _guardar = guardar;
    _prefs.setBool('guardar', _guardar);
  }

  static String get email {
    return _prefs.getString('email') ?? _email;
  }

  static set email(String email) {
    _email = email;
    _prefs.setString('email', email);
  }

  static String get pass {
    return _prefs.getString('pass') ?? _email;
  }

  static set pass(String pass) {
    _password = pass;
    _prefs.setString('pass', pass);
  }
}
