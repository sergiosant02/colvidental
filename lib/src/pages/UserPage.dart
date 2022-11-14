import 'package:colvidental/src/Constantes/AppTextStyles.dart';
import 'package:colvidental/src/sharedPreferences/sharedPreferences.dart';
import 'package:flutter/material.dart';

class UserPage extends StatefulWidget {
  UserPage({Key? key}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  List<Widget> citas = List.generate(
      8,
      (index) => ListTile(
            title: Text("Cita $index"),
            trailing: Text("XX:XX h"),
            leading: Icon(Icons.quick_contacts_dialer_outlined),
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
            "Próximas citas",
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
            children: citas,
          ),
        )
      ],
    );
  }
}
