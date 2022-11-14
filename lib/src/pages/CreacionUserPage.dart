import 'package:colvidental/src/Constantes/SimulatedData.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../Tipos/Persona.dart';

class CreacionUserPage extends StatefulWidget {
  const CreacionUserPage({Key? key}) : super(key: key);

  @override
  State<CreacionUserPage> createState() => _CreacionUserPageState();
}

class _CreacionUserPageState extends State<CreacionUserPage> {
  bool trabajador = true;
  String tratamiento = SimulatedData.tratamientos.first;
  List tratamientos = SimulatedData.tratamientos;
  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem<String>> buttonTrabajadores = tratamientos.map((e) {
      return DropdownMenuItem<String>(
        value: e,
        child: Text(e),
      );
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Edición de usuario"),
      ),
      body: ListView(
        padding: EdgeInsets.all(15),
        children: [
          SizedBox(
            height: 10,
          ),
          IconButton(
              iconSize: 200,
              onPressed: () {},
              icon: Icon(
                Icons.add_photo_alternate_rounded,
                size: 200,
              )),
          SizedBox(
            height: 10,
          ),
          TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(), label: Text("Nombre")),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(), label: Text("Dirección")),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(), label: Text("Teléfono")),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(), label: Text("Email")),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(), label: Text("Password")),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text("Fecha de nacimiento (dd/mm/yy)")),
          ),
          SizedBox(
            height: 10,
          ),
          SwitchListTile.adaptive(
              title: Text("Es trabajador"),
              value: trabajador,
              onChanged: (b) => setState(() {
                    trabajador = b;
                  })),
          trabajador
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("Especialiadd"),
                    DropdownButton<String>(
                      value: tratamiento,
                      items: buttonTrabajadores,
                      onChanged: (String? p) {
                        tratamiento = p!;
                        setState(() {});
                      },
                    ),
                  ],
                )
              : Container()
        ],
      ),
    );
  }
}
