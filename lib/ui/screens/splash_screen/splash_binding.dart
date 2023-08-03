import 'package:get/get.dart';
import 'package:indian_race_fantasy/ui/screens/splash_screen/splash_controller.dart';


class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController());
  }
}