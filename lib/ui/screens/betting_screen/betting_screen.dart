import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indian_race_fantasy/model/raceCard/raceCardModel.dart';
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
                  height: Get.height * 0.12,
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 5.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: Get.height * 0.22,
                          width: Get.width * 0.22,
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
                                  image:
                                      AssetImage("assets/images/logo_gold.png"),
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: Get.height * 0.05,
                          width: Get.width * 0.4,
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
                          child: Center(
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
                                  Text(
                                    '${controller.userDetails.balanceAmount ?? "500"}',
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
                SizedBox(
                  height: Get.height * 0.02,
                ),
                Column(
                  children: [
                    // Main Tabs
                    Wrap(
                      spacing: 8.0, // Adjust the spacing between tabs as needed
                      runSpacing: 8.0, // Adjust the run spacing as needed
                      alignment: WrapAlignment.center,
                      children: List.generate(
                        controller.mainTabs.length,
                            (index) => Container(
                              child: ElevatedButton(
                          onPressed: () {
                              // Change the tab when the button is pressed
                              controller.tabController.animateTo(index);
                              controller.tabController2.animateTo(0);
                              controller.update();
                          },
                          style: ButtonStyle(
                              shape: MaterialStateProperty.resolveWith<OutlinedBorder?>(
                                    (states) {
                                  if (states.contains(MaterialState.pressed)) {
                                    // Use a different shape when the button is pressed
                                    return RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                    );
                                  } else {
                                    // Use the default shape when the button is not pressed
                                    return RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                    );
                                  }
                                },
                              ),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                controller.selectedMainTabIndex == index
                                    ? primaryColor
                                    : kGreyColor,
                              ),
                          ),
                          child: Text(
                              "R ${index + 1}",
                              style: TextStyle(
                                color: kWhiteColor,
                              ),
                          ),
                        ),
                            ),
                      ),
                    ),


                    // Sub Tabs
                    Wrap(
                      spacing: 5.0, // Adjust the spacing between tabs as needed
                      runSpacing: 0.0, // Adjust the run spacing as needed
                      alignment: WrapAlignment.center,
                      children: List.generate(
                        controller.subTabs[controller.selectedMainTabIndex].length,
                            (index) => ElevatedButton(
                          onPressed: () {
                            // Change the tab when the button is pressed
                            controller.tabController2.animateTo(index);
                          },
                          style: ButtonStyle(
                            shape: MaterialStateProperty.resolveWith<OutlinedBorder?>(
                                  (states) {
                                if (states.contains(MaterialState.pressed)) {
                                  // Use a different shape when the button is pressed
                                  return RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  );
                                } else {
                                  // Use the default shape when the button is not pressed
                                  return RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  );
                                }
                              },
                            ),
                            backgroundColor: MaterialStateProperty.all<Color>(
                              controller.selectedSubTabIndex == index
                                  ? secondaryColor
                                  : kGreyColor,
                            ),
                          ),
                          child: Text(
                            controller.subTabs[controller.selectedMainTabIndex][index],
                            style: TextStyle(
                              color: kWhiteColor,
                            ),
                          ),
                        ),
                      ),
                    ),


                    // Content for Selected Tab
                    // Center(
                    //   child: Text(
                    //     'Selected: ${controller.mainTabs[controller.selectedMainTabIndex]} > ${controller.subTabs[controller.selectedMainTabIndex][controller.selectedSubTabIndex]}',
                    //     style: TextStyle(fontSize: 24),
                    //   ),
                    // ),
                  ],
                ),
                // DefaultTabController(
                //   length:
                //       controller.mainTabs.length, // Specify the number of tabs
                //   initialIndex: controller
                //       .selectedMainTabIndex, // Set the initial selected tab index
                //   child: Column(
                //     children: [
                //       // Main Tabs
                //       SingleChildScrollView(
                //         scrollDirection: Axis.horizontal,
                //         child: TabBar(
                //           controller: controller.tabController,
                //           isScrollable:
                //               true, // Allow horizontal scrolling of tabs
                //           indicator: BoxDecoration(
                //             borderRadius: BorderRadius.circular(Get.width * 20),
                //             color: primaryColor,
                //           ),
                //           labelColor:
                //               kWhiteColor, // Text color for selected tab
                //           unselectedLabelColor:
                //               secondaryColor, // Text color for unselected tabs
                //           tabs: List.generate(
                //             controller.mainTabs.length,
                //             (index) => Container(
                //               width: Get.width * 0.10,
                //               decoration: BoxDecoration(
                //                 borderRadius:
                //                     BorderRadius.circular(Get.width * 0.01),
                //                 color: primaryColor,
                //               ),
                //               child: Tab(
                //                 text: controller.mainTabs[index],
                //               ),
                //             ),
                //           ),
                //           onTap: (index) {
                //             controller.selectedMainTabIndex = index;
                //             controller.selectedSubTabIndex =
                //                 0; // Reset sub-tab index
                //           },
                //         ),
                //       ),
                //
                //       // Sub Tabs
                //       SingleChildScrollView(
                //         scrollDirection: Axis.horizontal,
                //         child: TabBar.secondary(
                //           controller: controller.tabController2,
                //           indicatorColor: Colors.transparent,
                //           isScrollable:
                //               true, // Allow horizontal scrolling of tabs
                //           indicator: BoxDecoration(
                //             borderRadius: BorderRadius.circular(Get.width * 20),
                //             color: primaryColor,
                //           ),
                //           labelColor:
                //               kWhiteColor, // Text color for selected tab
                //           unselectedLabelColor:
                //               secondaryColor, // Text color for unselected tabs
                //           tabs: List.generate(
                //             controller.subTabs[controller.selectedMainTabIndex]
                //                 .length,
                //             (index) => Container(
                //               width: Get.width * 0.25,
                //               decoration: BoxDecoration(
                //                 borderRadius:
                //                     BorderRadius.circular(Get.width * 20),
                //                 color: primaryColor,
                //               ),
                //               child: Tab(
                //                 text: controller.subTabs[
                //                     controller.selectedMainTabIndex][index],
                //               ),
                //             ),
                //           ),
                //           onTap: (index) {
                //             controller.selectedSubTabIndex = index;
                //           },
                //         ),
                //       ),
                //
                //       // Content for Selected Tab
                //       Center(
                //         child: Text(
                //           'Selected: ${controller.mainTabs[controller.selectedMainTabIndex]} > ${controller.subTabs[controller.selectedMainTabIndex][controller.selectedSubTabIndex]}',
                //           style: TextStyle(fontSize: 24),
                //         ),
                //       ),
                //     ]
                //   ),
                // ),

                // RaceCardModel(
                //   horseNumber: controller.race.,
                //   drawBox: "5",
                //   horseName: controller.todayTournaments[0].races[controller.selectedMainTabIndex]?.horseName ?? "N/A",
                //   acs: controller.todayTournaments[0].races[controller.selectedMainTabIndex]?.aCS ?? "N/A",
                //   trainer: controller.todayTournaments[0].races[controller.selectedMainTabIndex]?.trainer ?? "N/A",
                //   jockey: controller.todayTournaments[0].races[controller.selectedMainTabIndex]?.jockey ?? "N/A",
                //   weightCarry: controller.todayTournaments[0].races[controller.selectedMainTabIndex]?.weight?.toString() ?? "N/A",
                //   allowance: controller.todayTournaments[0].races[controller.selectedMainTabIndex]?.allowance?.toString() ?? "N/A",
                //   rating: controller.todayTournaments[0].races[controller.selectedMainTabIndex]?.rating?.toString() ?? "N/A",
                //   jockeyDress: null,
                // ),



                SizedBox(
                  height: 50.0,
                ),

                ElevatedButton(
                    onPressed: () {
                      var currentDate = "19/09/23";
                      controller.fetchRaceCardDetails(currentDate);
                    },
                    child: Text("ok"))
              ],
            );
          },
        ),
      ),
    );
  }
}
