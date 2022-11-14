import 'package:colvidental/src/management/PageManager.dart';
import 'package:colvidental/src/sharedPreferences/sharedPreferences.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailTextEditingController =
      TextEditingController();
  final TextEditingController _passwordTextEditingController =
      new TextEditingController();
  final PageManager pageController = Get.put(PageManager());

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(15),
      children: [
        const Icon(
          Icons.supervised_user_circle_sharp,
          size: 300,
        ),
        TextField(
          decoration: const InputDecoration(
              label: Text("Email"),
              border: OutlineInputBorder(),
              hintText: "xxxxx@email.com"),
          controller: _emailTextEditingController,
        ),
        const SizedBox(
          height: 15,
        ),
        TextField(
          obscureText: true,
          decoration: const InputDecoration(
              label: Text("Password"),
              border: OutlineInputBorder(),
              hintText: "password"),
          controller: _passwordTextEditingController,
        ),
        const SizedBox(
          height: 100,
        ),
        ElevatedButton(
            onPressed: () {
              PreferenciasUsuario.email = _emailTextEditingController.text;
              pageController.page.value = 0;
              if (PreferenciasUsuario.email.contains("admin")) {
                pageController.changeType(2);
              } else {
                pageController.changeType(1);
              }
            },
            child: const Text("Iniciar sesión"))
      ],
    );
  }
}
