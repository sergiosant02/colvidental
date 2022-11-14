import 'package:colvidental/src/Constantes/AppTextStyles.dart';
import 'package:colvidental/src/Constantes/SimulatedData.dart';
import 'package:colvidental/src/pages/ListadoElements.dart';
import 'package:colvidental/src/sharedPreferences/sharedPreferences.dart';
import 'package:flutter/material.dart';

class AdminPage extends StatefulWidget {
  AdminPage({Key? key}) : super(key: key);

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  List<Widget> citas = List.generate(
      8,
      (index) => ListTile(
            title: Text("Cita $index"),
            trailing: Text("XX:XX h"),
            leading: Icon(Icons.security_rounded),
          ));

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        const Icon(
          Icons.supervised_user_circle_outlined,
          size: 250,
        ),
        Text(
          PreferenciasUsuario.email,
          style: AppTextStyle.tittle,
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          child: Text(
            "Opciones",
            style: AppTextStyle.tittle,
          ),
          width: double.infinity,
          padding: EdgeInsets.all(15),
        ),
        const SizedBox(
          height: 20,
        ),
        Expanded(
          child: ListView(
            children: [
              ListTile(
                title: Text("Proveedores"),
                leading: Icon(Icons.shop_outlined),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Navigator.pushNamed(context, "/proveedores");
                },
              ),
              ListTile(
                title: Text("Inventario"),
                leading: Icon(Icons.inventory_sharp),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ListadoElements(
                              titleText: "Inventario",
                              info: SimulatedData.materiales,
                              count: true,
                              pref: Icon(Icons.how_to_vote_outlined))));
                },
              ),
              ListTile(
                title: Text("Personal"),
                leading: Icon(Icons.work),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ListadoElements(
                                titleText: "Personal",
                                info: SimulatedData.personas
                                    .where((element) =>
                                        element.especialidad != null)
                                    .map((e) => e.name)
                                    .toList(),
                                count: false,
                                pref: Icon(Icons.workspace_premium_outlined),
                                addIcon: true,
                              )));
                },
              ),
              ListTile(
                title: Text("Clientes"),
                leading: Icon(Icons.contacts_outlined),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ListadoElements(
                                titleText: "Clientes",
                                info: SimulatedData.personas
                                    .where((element) =>
                                        element.especialidad == null)
                                    .map((e) => e.name)
                                    .toList(),
                                count: false,
                                pref: Icon(Icons.perm_contact_calendar_sharp),
                                addIcon: true,
                              )));
                },
              ),
              ListTile(
                leading: Icon(Icons.book),
                title: Text("Gestionar disponibilidad"),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Navigator.pushNamed(context, "/agenda");
                },
              )
            ],
          ),
        )
      ],
    );
  }
}
