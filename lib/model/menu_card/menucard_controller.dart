import 'package:get/get.dart';

class FontSizeController extends GetxController {
  RxDouble fontSize = 16.0.obs;

  // Function to calculate font size based on screen width
  void calculateFontSize() {
    // You can set your own criteria for calculating the font size here
    if (Get.width <= 320) {
      fontSize.value = 14.0;
    } else if (Get.width <= 480) {
      fontSize.value = 16.0;
    } else {
      fontSize.value = 18.0;
    }
  }
}
