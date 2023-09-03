import 'package:get/get.dart';

class RaceTrackButtonController extends GetxController {
  var isSelected = false.obs;
  void toggleSelection() {
    isSelected.value = !isSelected.value;
  }
}