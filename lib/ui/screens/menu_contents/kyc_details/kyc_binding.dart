import 'package:get/get.dart';

import 'kyc_controller.dart';




class KYCBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => KYCController());
  }
}