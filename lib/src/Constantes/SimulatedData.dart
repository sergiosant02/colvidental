import 'package:colvidental/src/Tipos/Proveedores.dart';

import '../Tipos/Persona.dart';

class SimulatedData {
  static List<String> materiales = [
    "Pasta",
    "Bisturi",
    "Seda",
    "Agua",
    "Material 1",
    "Material 2",
    "Material 3"
  ];
  static List<Persona> personas = [
    Persona(name: "Sergio Santiago"),
    Persona(name: "María Vico"),
    Persona(name: "Alejandro Pérez"),
    Persona(name: "Juan Carlos Pérez", especialidad: "Odotólogo"),
    Persona(name: "Laura Roldán", especialidad: "Higienista"),
    Persona(name: "Alberto Pérez", especialidad: "Cirujano")
  ];

  static List<Proveedores> proveedores = [
    Proveedores(
        name: "Proveedor 1", phone: "123456789", addrees: "Calle falsa 1"),
    Proveedores(
        name: "Proveedor 2", phone: "123456789", addrees: "Calle falsa 2"),
    Proveedores(
        name: "Proveedor 3", phone: "123456789", addrees: "Calle falsa 3"),
    Proveedores(
        name: "Proveedor 4", phone: "123456789", addrees: "Calle falsa 4"),
    Proveedores(
        name: "Proveedor 5", phone: "123456789", addrees: "Calle falsa 5"),
    Proveedores(
        name: "Proveedor 6", phone: "123456789", addrees: "Calle falsa 6"),
    Proveedores(
        name: "Proveedor 7", phone: "123456789", addrees: "Calle falsa 7"),
    Proveedores(
        name: "Proveedor 8", phone: "123456789", addrees: "Calle falsa 8"),
    Proveedores(
        name: "Proveedor 9", phone: "123456789", addrees: "Calle falsa 9"),
    Proveedores(
        name: "Proveedor 10", phone: "123456789", addrees: "Calle falsa 10"),
    Proveedores(
        name: "Proveedor 11", phone: "123456789", addrees: "Calle falsa 11"),
    Proveedores(
        name: "Proveedor 12", phone: "123456789", addrees: "Calle falsa 12"),
    Proveedores(
        name: "Proveedor 13", phone: "123456789", addrees: "Calle falsa 13")
  ];

  static List<String> tratamientos = [
    "Limpieza",
    "Ortodoncia",
    "Implantología",
    "Revisión"
  ];
}
