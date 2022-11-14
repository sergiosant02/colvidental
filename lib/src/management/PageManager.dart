import 'package:colvidental/src/Constantes/SimulatedData.dart';
import 'package:colvidental/src/sharedPreferences/sharedPreferences.dart';
import 'package:get/get.dart';

class PageManager extends GetxController {
  final RxInt page = 0.obs;

  final RxInt type = 0.obs;

  changePage(int i) {
    page.value = i;
  }

  changeType(int i) {
    if (i == 0) {
      PreferenciasUsuario.email = "";
      page.value = 0;
    }
    type.value = i;
    PreferenciasUsuario.log = i;
  }
}
