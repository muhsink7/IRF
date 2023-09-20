import 'package:get/get.dart';
import 'package:indian_race_fantasy/ui/screens/betting_screen/betting_controller.dart';

class BettingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BettingController());
  }
}