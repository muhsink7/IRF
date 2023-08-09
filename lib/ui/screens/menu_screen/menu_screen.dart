import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indian_race_fantasy/Model/menu_card/menu_card.dart';
import 'package:indian_race_fantasy/constants/color_constants.dart';
import 'package:indian_race_fantasy/ui/screens/menu_contents/kyc_details/kyc_details_screen.dart';

import '../../../router.dart';
import 'menu_controller.dart';

class MenuCardScreen extends GetWidget<MenuCardController> {
  const MenuCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Align(
            alignment: Alignment.centerRight,
            child: IconButton(onPressed: (){}, icon: Icon(Icons.backspace, size: 60,color: secondaryColor,fill: 1.0,)

          ),
        ),),
        Expanded(
            child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 1.2,
                ),
                children: [
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MenuCard(
                      cardImage: Image.asset('assets/images/logo_gold.png'),
                      cardTitle: "My \n Profile", onTap: () {  },)),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MenuCard(
                      cardImage: Image.asset('assets/images/logo_gold.png'),
                      cardTitle: "My \n Profile", onTap: () {  },)),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MenuCard(
                      cardImage: Image.asset('assets/images/logo_gold.png'),
                      cardTitle: "My \n Profile", onTap: () {  },)),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MenuCard(
                      cardImage: Image.asset('assets/images/logo_gold.png'),
                      cardTitle: "My \n Profile", onTap: () {  },)),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MenuCard(
                      cardImage: Image.asset('assets/images/logo_gold.png'),
                      cardTitle: "KYC \n Details", onTap: () {
                    Get.toNamed(RoutePaths.kycDetailsScreen);
                  },)),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MenuCard(
                      cardImage: Image.asset('assets/images/logo_gold.png'),
                      cardTitle: "My \n Profile", onTap: () {  },),
              )
            ])),
      ])),
    );
  }
}
