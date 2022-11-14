import 'package:colvidental/src/management/PageManager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget customAppNavBar(int type) {
  List<BottomNavigationBarItem> listaItems = [
    const BottomNavigationBarItem(
        icon: Icon(Icons.newspaper), label: "Noticias"),
    const BottomNavigationBarItem(
        icon: Icon(Icons.supervised_user_circle), label: "Perfil"),
  ];

  if (true) {
    listaItems.insert(
        1,
        BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month_outlined), label: "Citas"));
  }

  final PageManager pageController = Get.put(PageManager());
  return BottomNavigationBar(
      currentIndex: pageController.page.value,
      items: listaItems,
      onTap: (int i) {
        pageController.page.value = i;
      });
}
