import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indian_race_fantasy/constants/color_constants.dart';

import '../../controllers/icon_controller/icon_controller.dart';

class RaceCardModel extends StatelessWidget {
  final IconController iconController = Get.put(IconController());

  RaceCardModel(
      {super.key,
      required this.horseNumber,
      required this.drawBox,
      required this.horseName,
      required this.acs,
      required this.trainer,
      required this.jockey,
      required this.weightCarry,
      required this.allowance,
      required this.rating,
      required this.jockeyDress});

  final String horseNumber;
  final String drawBox;
  final String horseName;
  final String acs;
  final String trainer;
  final String jockey;
  final String weightCarry;
  final String allowance;
  final String rating;
  final Image? jockeyDress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                  border:Border.all(
                    color: primaryColor, // Border color
                    width: 2.0, // Border width
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width : Get.width*0.15,
                      decoration: BoxDecoration(
                        color: primaryColor,
                      ),
                      child: Center(child: Text(horseNumber)),
                    ),
                    SizedBox(
                        height: 50.0,
                        width: 50.0,
                        child: Image.asset("assets/images/logo_gold.png")),
                    Center(
                      child: Text("($drawBox)"),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(horseName),
                      Text("($acs) * ($rating)"),
                      Row(
                        children: [
                          Text("J"),
                          Text("- $jockey (Wt. ${weightCarry}Kgs$allowance)"),
                        ],
                      ),
                      Row(
                        children: [
                          Text("T"),
                          Text("- $trainer"),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Spacer(),
              InkWell(
                onTap: () {
                  iconController.toggleButton();
                },
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  border:Border.all(
                    color: primaryColor, // Border color
                    width: 2.0, // Border width
                  ),
                ),
                child: Obx(() {
                  return iconController.isPressed.value
                      ? Container(
                    color: secondaryColor, // Change to your desired color
                    child: Center(
                      child: Icon(
                        Icons.done,
                        color: Colors
                            .white, // Change to your desired color
                      ),
                    ),
                  )
                      : Container(
                    child: Center(
                      child: IconButton(
                        onPressed: () {
                          iconController.toggleButton();
                        },
                        icon: Icon(Icons.add),
                      ),
                    ),
                  );
                }),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
