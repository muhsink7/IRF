import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indian_race_fantasy/ui/screens/betting_screen/betting_controller.dart';

import '../../../constants/color_constants.dart';

class BettingScreen extends GetWidget<BettingController> {
  const BettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: GetBuilder<BettingController>(
          builder: (controller) {
            if (controller.isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Positioned content for the top section
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: Get.height*0.12,
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
                    padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: Get.height*0.22,
                          width: Get.width*0.22,
                          decoration: BoxDecoration(
                            color: secondaryColor,
                            border: Border.all(
                              color: secondaryColor,
                              width: 5.0,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: kBlackColor.withOpacity(0.5),
                                spreadRadius: 3,
                                blurRadius: 4,
                                offset: const Offset(0, 0),
                              ),
                            ],
                            shape: BoxShape.circle,
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(
                                8.0), // Adjust the padding as needed
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      "assets/images/logo_gold.png"),
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: Get.height*0.05,
                          width: Get.width*0.4,
                          decoration: BoxDecoration(
                            color: secondaryColor,
                            border: Border.all(
                              color: secondaryColor,
                              width: 5.0,
                            ),
                            borderRadius: BorderRadius.circular(50.0),
                            boxShadow: [
                              BoxShadow(
                                color: kBlackColor.withOpacity(0.5),
                                spreadRadius: 3,
                                blurRadius: 4,
                                offset: const Offset(0, 0),
                              ),
                            ],
                          ),
                          child:  Center(
                            child: Padding(
                              padding: EdgeInsets.all(
                                  1.0), // Adjust the padding as needed
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.currency_bitcoin,
                                    color: primaryColor,
                                    size: screenWidth *
                                        0.07, // Adjust icon size based on screen width
                                  ),
                                  Text( '${controller.userDetails.balanceAmount?? "500"}',
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                      color: primaryColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                ),
            ),

                TabBar(
                  controller: controller.tabController,
                  tabs: List.generate(
                    controller.mainTabs.length,
                        (index) => Tab(
                      text: controller.mainTabs[index],
                    ),
                  ),
                ),
                //
                // // Sub Tab Bar
                // TabBar(
                //   controller: controller.tabController,
                //   tabs: List.generate(
                //     controller.subTabs[controller.selectedMainTabIndex].length,
                //         (index) => Tab(
                //       text: controller.subTabs[controller.selectedMainTabIndex][index],
                //     ),
                //   ),
                // ),
                //
                // // Details
                // Expanded(
                //   child: Center(
                //     child: Text(
                //       controller.details[controller.selectedMainTabIndex][controller.selectedSubTabIndex],
                //       style: TextStyle(fontSize: 24),
                //     ),
                //   ),
                // ),
              ],
            );
          },
        ),
      ),
    );
  }
}