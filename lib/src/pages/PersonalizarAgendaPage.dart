import 'package:colvidental/src/Constantes/AppTextStyles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PersonalizarAgendaPage extends StatefulWidget {
  PersonalizarAgendaPage({Key? key}) : super(key: key);

  @override
  State<PersonalizarAgendaPage> createState() => _PersonalizarAgendaPageState();
}

class _PersonalizarAgendaPageState extends State<PersonalizarAgendaPage> {
  List<Widget> children = List.generate(
      10,
      (index) => Dismissible(
            background: Container(
              padding: EdgeInsets.all(10),
              alignment: Alignment.centerRight,
              color: Colors.red,
              child: Icon(Icons.delete),
            ),
            onDismissed: (dis) {},
            key: Key(index.toString() + DateTime.now().toString()),
            direction: DismissDirection.endToStart,
            child: ListTile(
              leading: Icon(Icons.watch_later_outlined),
              title: Text("Fecha: dd/mm/yyyy Horario: xx:xx - xx:xx"),
            ),
          ));

  List<Widget> pickers = [
    SizedBox(
        height: 300,
        child: TimePickerDialog(
          helpText: "Hora de inicio",
          confirmText: "",
          cancelText: "",
          initialTime: TimeOfDay.now(),
          initialEntryMode: TimePickerEntryMode.input,
        )),
    SizedBox(
        height: 300,
        child: TimePickerDialog(
          helpText: "Hora de finalización",
          initialTime: TimeOfDay.now(),
          initialEntryMode: TimePickerEntryMode.input,
        )),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        "Agenda actual: ",
        style: AppTextStyle.tittle,
      ),
    )
  ];

  @override
  Widget build(BuildContext context) {
    pickers.addAll(children);
    List<Widget> cuerpo = [
      Expanded(
        flex: 1,
        child: Container(
          child: DateRangePickerDialog(
              helpText: "Seleccionar fechas afectadas",
              fieldStartLabelText: "Primer día",
              fieldEndLabelText: "Último día",
              fieldStartHintText: "Primer día",
              fieldEndHintText: "Último día",
              saveText: "Guardar",
              initialEntryMode: DatePickerEntryMode.calendarOnly,
              firstDate: DateTime.now(),
              lastDate: DateTime.now().add(Duration(days: 365))),
        ),
      ),
      Expanded(
        flex: 1,
        child: ListView.separated(
          itemCount: pickers.length,
          controller: ScrollController(),
          itemBuilder: (context, i) {
            return pickers[i];
          },
          separatorBuilder: (context, i) {
            return i < 2 ? Container() : const Divider();
          },
        ),
      )
    ];
    return Scaffold(
        //appBar: AppBar(title: Text("Abrir disponibilidad de agenda")),
        body: Get.width > 500
            ? Row(children: cuerpo)
            : Column(
                children: cuerpo,
              ));
  }
}
