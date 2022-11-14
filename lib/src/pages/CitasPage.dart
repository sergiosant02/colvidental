import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CitasPage extends StatefulWidget {
  CitasPage({Key? key}) : super(key: key);

  @override
  State<CitasPage> createState() => _CitasPageState();
}

class _CitasPageState extends State<CitasPage> {
  final List<Widget> citas = List.generate(
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
        CalendarDatePicker(
          firstDate: DateTime.now(),
          initialDate: DateTime.now(),
          lastDate: DateTime(DateTime.now().year + 1),
          onDateChanged: (date) {},
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
