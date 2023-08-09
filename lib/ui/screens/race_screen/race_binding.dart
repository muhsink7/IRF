import 'package:get/get.dart';

import 'race_controller.dart';



class RaceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RaceController());
  }
}