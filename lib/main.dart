import 'package:colvidental/src/pages/CreacionUserPage.dart';
import 'package:colvidental/src/pages/HomePage.dart';
import 'package:colvidental/src/pages/ListadoProveedores.dart';
import 'package:colvidental/src/pages/PersonalizarAgendaPage.dart';
import 'package:colvidental/src/pages/ProveedorPage.dart';
import 'package:colvidental/src/sharedPreferences/sharedPreferences.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PreferenciasUsuario().initPrefs();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ColviDental',
      initialRoute: "/home",
      routes: {
        "/home": ((context) => HomePage()),
        "/proveedores": ((context) => ProveedoresListado()),
        "/proveedor": ((context) => ProveedorPage()),
        "/creacionUser": ((context) => CreacionUserPage()),
        "/agenda": ((context) => PersonalizarAgendaPage())
      },
    );
  }
}
