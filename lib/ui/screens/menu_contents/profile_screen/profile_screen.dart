import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indian_race_fantasy/ui/screens/menu_contents/profile_screen/profile_controller.dart';

class ProfileScreen extends GetWidget<ProfileController> {
  final ProfileController controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: SingleChildScrollView(
            child: Padding(
            padding: const EdgeInsets.all(20),
        child: GetBuilder<ProfileController>(builder: (controller) {
      return Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/images/logo_gold.png'), // Use your default avatar image
                ),
                SizedBox(
                  width: Get.width*0.1,
                ),
                Text('${controller.userDetails.userName?? "Nil"}'),
              ],
            ),
            SizedBox(height: 20),

            Table(
              children: [
                TableRow(
                  children: [
                    Text('Full Name '),
                    Text(" ${controller.userDetails.firstName??"Nil"} ${controller.userDetails.lastName??"Nil"}")
                  ],
                ),

                TableRow(
                  children: [
                    Text('Email'),
                    Text(" ${controller.userDetails.email?? "Nil"}")
                  ],
                ),
                TableRow(
                  children: [
                    Text('Aadhar Number'),
                    Text(" ${controller.userDetails.kycAadharCardNumber?? "Nil"}")
                  ],
                ),
                TableRow(
                  children: [
                    Text('Pancard Number'),
                    Text(" ${controller.userDetails.kycPancardNumber?? "Nil"}")
                  ],
                ),
                TableRow(
                  children: [
                    Text('Address'),
                    Text(" ${controller.userDetails.kycPancardNumber?? "Nil"}")
                  ],
                ),

              ],
            ),



            // Text('Address: ${controller.userDetails.address}'),
          ],
        );
        }
        )
            )
            )
      ),
    );
  }
}
