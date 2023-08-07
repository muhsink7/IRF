import 'package:get/get.dart';

import 'menu_controller.dart';



class MenuCardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MenuCardController());
  }
}