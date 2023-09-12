import 'package:get/get.dart';
import 'package:indian_race_fantasy/ui/screens/menu_contents/bank_details/bank_details_controller.dart';



class BankDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BankDetailController());
  }
}