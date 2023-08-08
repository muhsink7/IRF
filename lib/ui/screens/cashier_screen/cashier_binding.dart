import 'package:get/get.dart';
import 'package:indian_race_fantasy/ui/screens/cashier_screen/cashier_controller.dart';




class CashierBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CashierController());
  }
}