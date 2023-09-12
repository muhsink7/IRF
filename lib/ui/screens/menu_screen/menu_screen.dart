import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Model/menu_card/menu_card.dart';
import '../../../api/api.dart';
import '../../../router.dart';
import 'menu_controller.dart';

class MenuCardScreen extends GetWidget<MenuCardController> {
   MenuCardScreen({super.key});

  final Api api = Get.find();



   @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Padding(
                //   padding: const EdgeInsets.all(20.0),
                //   child: Align(
                //     alignment: Alignment.centerRight,
                //     child: IconButton(onPressed: (){
                //       Get.back();
                //     }, icon: Icon(Icons.backspace, size: 60,color: secondaryColor,fill: 1.0,)
                //
                //   ),
                // ),),

                const SizedBox(
                  height: 100,
                ),
                Expanded(
                    child: GridView(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
                                cardTitle: "My \n Profile", onTap: () {
                                Get.dialog(
                                  AlertDialog(
                                    title: const Text('My Profile'),
                                    content: const Text('This Feature is yet to come.'),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Get.back(); // Close the dialog
                                        },
                                        child: const Text('Close'),
                                      ),
                                    ],
                                  ),);
                              },)),
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
                                cardTitle: "Bank \n Detailss", onTap: () {
                                Get.toNamed(RoutePaths.bankDetailScreen);
                              },)),
                          Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: MenuCard(
                                cardImage: Image.asset('assets/images/logo_gold.png'),
                                cardTitle: "My \n Profile", onTap: () {
                                Get.dialog(
                                  AlertDialog(
                                    title: const Text('My Profile'),
                                    content: const Text('This Feature is yet to come.'),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Get.back(); // Close the dialog
                                        },
                                        child: const Text('Close'),
                                      ),
                                    ],
                                  ),);
                              },)),
                          Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: MenuCard(
                                cardImage: Image.asset('assets/images/logo_gold.png'),
                                cardTitle: "My \n Profile", onTap: () {
                                Get.dialog(
                                  AlertDialog(
                                    title: const Text('My Profile'),
                                    content: const Text('This Feature is yet to come.'),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Get.back(); // Close the dialog
                                        },
                                        child: const Text('Close'),
                                      ),
                                    ],
                                  ),);
                              },)),

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: MenuCard(
                              cardImage: Image.asset('assets/images/logo_gold.png'),
                              cardTitle: "My \n Profile", onTap: () {
                              Get.dialog(
                                AlertDialog(
                                  title: const Text('My Profile'),
                                  content: const Text('This Feature is yet to come.'),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Get.back(); // Close the dialog
                                      },
                                      child: const Text('Close'),
                                    ),
                                  ],
                                ),);
                            },),
                          )
                        ])),
              ])),
    );
  }
}
