import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasUsuario {
  static final PreferenciasUsuario _singleton = PreferenciasUsuario._internal();

  factory PreferenciasUsuario() {
    return _singleton;
  }
  PreferenciasUsuario._internal();

  static SharedPreferences? _prefs;

  initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static int get log {
    return _prefs!.getInt('log') ??
        1; // 0 = no iniciado -- 1 = user -- 2 == admin
  }

  static set log(int log) {
    _prefs!.setInt('log', log);
  }

  static String get email {
    return _prefs!.getString('email') ??
        ""; // 0 = no iniciado -- 1 = user -- 2 == admin
  }

  static set email(String emailE) {
    _prefs!.setString('email', emailE);
  }
}
