import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../Model/menu_card/menu_card.dart';
import '../../../api/api.dart';
import '../../../constants/color_constants.dart';
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
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(
                  height: Get.height*0.1,
                ),
                /*Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: (){
                          Get.offAllNamed(RoutePaths.loginScreen);
                        },
                        child: Text("Logout",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: secondaryColor,
                        ),
                        ),
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      InkWell(
                          onTap: (){
                            Get.offAllNamed(RoutePaths.loginScreen);
                          },
                          child: Icon(Icons.logout, size: 20,color: secondaryColor,fill: 1.0,))

                    ],
                  ),
                ),*/

                SizedBox(
                  height: Get.height*0.03,
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
                                cardImage: Image.asset('assets/icons/Customer.png'),
                                cardTitle: "My \n Profile", onTap: () {
                                Get.toNamed(RoutePaths.profileScreen);
                              },)),
                          Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: MenuCard(
                                cardImage: Image.asset('assets/icons/KYCDetails.png'),
                                cardTitle: "KYC \n Details", onTap: () {
                                Get.toNamed(RoutePaths.kycDetailsScreen);
                              },)),
                          Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: MenuCard(
                                cardImage: Image.asset('assets/icons/BankTransacion.png'),
                                cardTitle: "Bank \n Transactions", onTap: () {
                                Get.toNamed(RoutePaths.bankDetailScreen);
                              },)),
                          Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: MenuCard(
                                cardImage: Image.asset('assets/icons/Terms&Conditions.png'),
                                cardTitle: "Terms & \n Conditions", onTap: () {
                                Get.dialog(
                                  AlertDialog(
                                    title: const Text('Terms & Conditions'),
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
                                cardImage: Image.asset('assets/icons/OnlineSupport.png'),
                                cardTitle: "24 X 7 \n Support", onTap: () {
                                Get.dialog(
                                  AlertDialog(
                                    title: const Text('24 X 7 Support'),
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
                              cardImage: Image.asset('assets/icons/Shutdown.png'),
                              cardTitle: "Logout & \n Exit", onTap: () {
                              Get.offAllNamed(RoutePaths.loginScreen);
                            },),
                          )
                        ])),
              ])),
    );
  }
}
