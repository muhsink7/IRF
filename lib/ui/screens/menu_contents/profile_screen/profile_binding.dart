import 'package:get/get.dart';
import 'package:indian_race_fantasy/ui/screens/menu_contents/profile_screen/profile_controller.dart';


class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileController());
  }
}