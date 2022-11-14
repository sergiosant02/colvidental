import 'dart:developer';

import 'package:colvidental/src/personalWidgets/CustomListElement.dart';
import 'package:flutter/material.dart';

class ListadoElements extends StatefulWidget {
  ListadoElements(
      {Key? key,
      required this.titleText,
      required this.info,
      required this.count,
      required this.pref,
      this.addIcon})
      : super(key: key);
  String titleText;
  List<String> info;
  bool count;
  Widget pref;
  bool? addIcon = false;

  @override
  State<ListadoElements> createState() => _ListadoElementsState();
}

class _ListadoElementsState extends State<ListadoElements> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.titleText),
        actions: [
          (widget.addIcon != null || widget.addIcon == true)
              ? IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/creacionUser");
                  },
                  icon: Icon(Icons.add_reaction_outlined))
              : Container()
        ],
      ),
      body: ListView(
          children: List.generate(
              widget.info.length,
              (index) => CustomListElement(
                  pref: widget.pref,
                  counter: widget.count,
                  labelText: widget.info[index]))),
    );
  }
}
