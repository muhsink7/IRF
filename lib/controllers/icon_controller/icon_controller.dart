import 'package:get/get.dart';

class IconController extends GetxController {
  var isPressed = false.obs;

  void toggleButton() {
    isPressed.value = !isPressed.value;
  }
}