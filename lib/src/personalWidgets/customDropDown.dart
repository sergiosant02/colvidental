import 'package:flutter/material.dart';

class CustomDropDown<T> extends StatelessWidget {
  CustomDropDown(
      {Key? key,
      required this.label,
      required this.listaItem,
      required this.value})
      : super(key: key);

  List<DropdownMenuItem<T>> listaItem;
  T value;
  String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(label),
        DropdownButton<T>(
            value: value,
            items: listaItem,
            onChanged: (T? d) {
              value = d as T;
            })
      ],
    );
  }
}
