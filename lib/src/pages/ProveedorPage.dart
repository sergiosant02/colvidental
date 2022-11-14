import 'package:colvidental/src/Constantes/AppTextStyles.dart';
import 'package:colvidental/src/Constantes/SimulatedData.dart';
import 'package:colvidental/src/Tipos/Proveedores.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ProveedorPage extends StatefulWidget {
  ProveedorPage({Key? key}) : super(key: key);

  @override
  State<ProveedorPage> createState() => _ProveedorPageState();
}

class _ProveedorPageState extends State<ProveedorPage> {
  @override
  Widget build(BuildContext context) {
    final Proveedores proveedores =
        ModalRoute.of(context)!.settings.arguments as Proveedores;

    List<Widget> encabezadoProd = [
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(
          "Productos",
          style: AppTextStyle.tittle,
        ),
      ),
    ];
    List<Widget> productos = List.generate(
      SimulatedData.materiales.length,
      (index) => ListTile(
        contentPadding: EdgeInsets.all(10),
        leading: FadeInImage(
          placeholder: AssetImage("assets/dentalLoading.gif"),
          image: AssetImage("assets/pastaDientes.jpg"),
        ),
        title: Text(SimulatedData.materiales[index]),
        trailing: Text("19.69€"),
      ),
    );

    encabezadoProd.addAll(productos);

    List<Widget> listado = [
      Divider(),
      ListTile(
        title: Text("Teléfono"),
        trailing: Text(proveedores.phone),
      ),
      ListTile(
        title: Text("Dirección"),
        trailing: Text(proveedores.addrees),
      ),
      Divider(),
    ];

    listado.addAll(encabezadoProd);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: Get.height * 0.2,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(proveedores.name),
              background: Image.asset(
                "assets/proveedor.jpg",
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "Información del proveedor",
                style: AppTextStyle.tittle,
              ),
            ),
          ),
          SliverList(delegate: SliverChildListDelegate(listado)),
        ],
      ),
    );
  }
}
