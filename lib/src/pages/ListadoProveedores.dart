import 'package:colvidental/src/Constantes/SimulatedData.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProveedoresListado extends StatelessWidget {
  const ProveedoresListado({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Proveedores")),
      body: ListView(
        children: List.generate(
            SimulatedData.proveedores.length,
            (index) => ListTile(
                  title: Text(SimulatedData.proveedores[index].name),
                  subtitle: Text(
                      "Teléfono: " + SimulatedData.proveedores[index].phone),
                  leading: Icon(Icons.propane_tank_rounded),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    Navigator.pushNamed(context, "/proveedor",
                        arguments: SimulatedData.proveedores[index]);
                  },
                )),
      ),
    );
  }
}
