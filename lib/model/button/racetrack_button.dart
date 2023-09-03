import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indian_race_fantasy/constants/color_constants.dart';
import 'package:indian_race_fantasy/controllers/race_track_button_controller/race_track_button_controller.dart';


class RaceTrackButton extends StatelessWidget {
  final RaceTrackButtonController controller = Get.put(RaceTrackButtonController());
  final void Function() onPressed;
  final String title;

  RaceTrackButton({Key? key, required this.onPressed, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
          () => MaterialButton(
        onPressed: () {
          controller.toggleSelection(); // Toggle the selection state
          onPressed();
        },
        child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: controller.isSelected.value ? primaryColor : kGreyColor, // Change color based on selection
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                blurRadius: 10.0,
                spreadRadius: 1.0,
                offset: Offset(1, 5),
              ),
            ],
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(color: Colors.white,),
            ),
          ),
        ),
      ),
    );
  }
}