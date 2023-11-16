import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IconController extends GetxController {
  var isPressed = false.obs;
  int selectedIndex = -1;

  void toggleButton(int index) {
    isPressed.value = !isPressed.value;
    if (isPressed.value) {
      selectedIndex = index;
      // Show the bottom sheet with the selected horse number and amount field
      Get.bottomSheet(
        Container(
          child: Column(
            children: [
              Text('Selected Horse Number: ${selectedIndex + 1}'),
              // Add your text field here to enter the amount
            ],
          ),
        ),
      );
    } else {
      selectedIndex = -1;
      // Close the bottom sheet if it's open
      Get.back();
    }
  }

  void reset() {
    isPressed.value = false;
    selectedIndex = -1;
  }
}