import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indian_race_fantasy/constants/profile_tile/profile_tile.dart';
import 'package:indian_race_fantasy/ui/screens/menu_contents/profile_screen/profile_controller.dart';

import '../../../../constants/color_constants.dart';

class ProfileScreen extends GetWidget<ProfileController> {
  final ProfileController controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(child: SingleChildScrollView(
          child: GetBuilder<ProfileController>(builder: (controller) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: Get.height * 0.1,
              decoration: BoxDecoration(
                color: primaryColor,
                boxShadow: [
                  BoxShadow(
                    color: kBlackColor.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                            'assets/images/logo_blue.png'),
                      ), // Use your default avatar image
                    ),
                    SizedBox(
                      width: Get.width * 0.1,
                    ),
                    Text('${controller.userDetails.userName ?? "User Name"}',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: secondaryColor,
                      ),),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),

            ProfileTile(
                title: 'Full Name',
                titleValue:
                    "${controller.userDetails.firstName ?? "Full "} ${controller.userDetails.lastName ?? "Name"}"),

            ProfileTile(title: 'Email', titleValue: "${controller.userDetails.email ?? "Email"}"),
            ProfileTile(title: 'Aadhar Number', titleValue: "${controller.userDetails.kycAadharCardNumber ?? "Aadhar Number"}"),
            ProfileTile(title: 'Pancard Number', titleValue: "${controller.userDetails.kycPancardNumber ?? "Pancard Number"}"),
            ProfileTile(title: 'Address', titleValue: "${controller.userDetails.kycPancardNumber ?? "Address"}"),

          ],
        );
      }))),
    );
  }
}
