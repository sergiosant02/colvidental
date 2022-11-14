import 'package:colvidental/src/Constantes/SimulatedData.dart';
import 'package:colvidental/src/management/PageManager.dart';
import 'package:colvidental/src/pages/AdminPage.dart';
import 'package:colvidental/src/pages/CitasPage.dart';
import 'package:colvidental/src/pages/LoginPage.dart';
import 'package:colvidental/src/pages/NewsPage.dart';
import 'package:colvidental/src/pages/UserPage.dart';
import 'package:colvidental/src/personalWidgets/CustomBottonNavBar.dart';
import 'package:colvidental/src/sharedPreferences/sharedPreferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../Tipos/Persona.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageManager pageController = Get.put(PageManager());
  String name = SimulatedData.personas[0].name;
  @override
  void initState() {
    super.initState();
  }

  Widget changeBody(int i) {
    switch (pageController.page.value) {
      case 0:
        return NewsPage();
        break;
      case 1:
        if (pageController.type.value == 0) {
          return Container(
              child: Center(
                  child: ElevatedButton(
            child: const Text("Iniciar sesión"),
            onPressed: () {
              pageController.changePage(2);
            },
          )));
        }
        return CitasPage();
        break;
      case 2:
        if (pageController.type.value == 0) {
          return LoginPage();
        } else if (pageController.type.value == 1) {
          return UserPage();
        } else {
          return AdminPage();
        }
        break;
      default:
        return Container();
    }
  }

  String tratamiento = SimulatedData.tratamientos.first;
  Persona? persDepl = SimulatedData.personas
      .where((element) => element.especialidad == null)
      .first;
  Persona? profDepl = SimulatedData.personas
      .where((element) => element.especialidad != null)
      .first;
  List trabajadores = SimulatedData.personas
      .where((element) => element.especialidad != null)
      .toList();
  List clientes = SimulatedData.personas
      .where((element) => element.especialidad == null)
      .toList();
  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem<Persona>> buttonClientes = clientes.map((e) {
      return DropdownMenuItem<Persona>(
        value: e,
        child: Text(e.name),
      );
    }).toList();

    List<DropdownMenuItem<Persona>> buttonTrabajadores = trabajadores.map((e) {
      return DropdownMenuItem<Persona>(
        value: e,
        child: Text(e.name),
      );
    }).toList();

    List<DropdownMenuItem<String>> buttonTratamiento =
        SimulatedData.tratamientos.map((e) {
      return DropdownMenuItem<String>(
        value: e,
        child: Text(e),
      );
    }).toList();

    return Scaffold(
      bottomNavigationBar:
          Obx(() => customAppNavBar(pageController.page.value)),
      appBar: AppBar(
        title: const Text("Colvidental"),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset("assets/logo.png"),
        ),
        actions: [
          Obx(() => pageController.type.value == 2 &&
                  pageController.page.value == 1
              ? IconButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text("Añadir cita"),
                            actions: [
                              TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text(
                                    "Cancelar",
                                    style: TextStyle(color: Colors.red),
                                  )),
                              TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text(
                                    "Aceptar",
                                    style: TextStyle(color: Colors.blue),
                                  ))
                            ],
                            content: StatefulBuilder(
                                builder: (context, StateSetter dropDownState) {
                              return Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Row(
                                    children: [
                                      Text("Cliente"),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      DropdownButton<Persona>(
                                        value: persDepl,
                                        items: buttonClientes,
                                        onChanged: (Persona? p) {
                                          persDepl = p;
                                          dropDownState(() {});
                                        },
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text("Profesional"),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      DropdownButton<Persona>(
                                        value: profDepl,
                                        items: buttonTrabajadores,
                                        onChanged: (Persona? p) {
                                          profDepl = p;
                                          dropDownState(() {});
                                        },
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text("Tratamiento"),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      DropdownButton<String>(
                                        value: tratamiento,
                                        items: buttonTratamiento,
                                        onChanged: (String? p) {
                                          tratamiento = p!;
                                          dropDownState(() {});
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              );
                            }),
                          );
                        });
                  },
                  icon: const Icon(Icons.post_add_sharp))
              : pageController.page == 0 && pageController.type.value == 2
                  ? IconButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text("Añadir publicación"),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const TextField(
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          label: Text("Título")),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    const TextField(
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          label:
                                              Text("Cuerpo de la publicación")),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    const TextField(
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          label: Text("Pie de la publicación")),
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.add_photo_alternate_rounded,
                                            size: 40,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        Text("No photo added")
                                      ],
                                    )
                                  ],
                                ),
                                actions: [
                                  TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: const Text(
                                        "Cancelar",
                                        style: TextStyle(color: Colors.red),
                                      )),
                                  TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: const Text(
                                        "Aceptar",
                                        style: TextStyle(color: Colors.blue),
                                      ))
                                ],
                              );
                            });
                      },
                      icon: Icon(Icons.newspaper))
                  : Container()),
          Obx(() => pageController.type.value >= 1
              ? IconButton(
                  onPressed: () {
                    pageController.changeType(0);
                  },
                  icon: const Icon(Icons.logout))
              : Container()),
        ],
      ),
      body: Obx(() => changeBody(pageController.page.value)),
    );
  }
}
