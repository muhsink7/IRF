import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indian_race_fantasy/Model/menu_card/menu_card.dart';

import 'menu_controller.dart';

class MenuCardScreen extends GetWidget<MenuCardController> {
  const MenuCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(children: [
        FloatingActionButton(
          onPressed: () {},
          child: SizedBox(
            child: Icon(Icons.close),
          ),
        ),
        Expanded(
            child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 1.5,
                ),
                children: [
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MenuCard(
                      cardImage: Image.asset('assets/images/logo_blue.png'),
                      cardTitle: "My Profile")),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MenuCard(
                      cardImage: Image.asset('assets/images/logo_blue.png'),
                      cardTitle: "My Profile")),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MenuCard(
                      cardImage: Image.asset('assets/images/logo_blue.png'),
                      cardTitle: "My Profile")),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MenuCard(
                      cardImage: Image.asset('assets/images/logo_blue.png'),
                      cardTitle: "My Profile")),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MenuCard(
                      cardImage: Image.asset('assets/images/logo_blue.png'),
                      cardTitle: "My Profile")),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MenuCard(
                      cardImage: Image.asset('assets/images/logo_blue.png'),
                      cardTitle: "My Profile"))
            ]))
      ])),
    );
  }
}

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
