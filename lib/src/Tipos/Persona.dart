import 'dart:convert';

class Persona {
  Persona({required this.name, this.especialidad});

  String name = "";
  String? especialidad;

  @override
  String toString() {
    // TODO: implement toString
    return "name: $name especialidad: $especialidad";
  }
}
