import 'package:colvidental/src/Constantes/AppTextStyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomListElement extends StatefulWidget {
  CustomListElement(
      {Key? key,
      required this.pref,
      required this.counter,
      required this.labelText})
      : super(key: key);
  Widget pref;
  bool counter;
  String labelText;

  @override
  State<CustomListElement> createState() => _CustomListElementState();
}

class _CustomListElementState extends State<CustomListElement> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(widget.labelText),
        leading: widget.pref,
        trailing: !widget.counter
            ? null
            : Container(
                alignment: Alignment.centerRight,
                height: 40,
                width: 200,
                child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  IconButton(
                      onPressed: () => setState(() {
                            count--;
                          }),
                      icon: Text(
                        "-",
                        style: AppTextStyle.tittle,
                      )),
                  Text("$count".padLeft(2, ' ')),
                  IconButton(
                      onPressed: () => setState(() {
                            count++;
                          }),
                      icon: Text(
                        "+",
                        style: AppTextStyle.tittle,
                      )),
                ]),
              ));
  }
}
