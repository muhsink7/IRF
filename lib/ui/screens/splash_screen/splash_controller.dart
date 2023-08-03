import 'dart:async';
import 'package:get/get.dart';
import 'package:indian_race_fantasy/router.dart';


class SplashController extends GetxController {
  RxBool isLoading = true.obs;
  RxDouble progressValue = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    updateProgress();

  }

  void updateProgress() {
    const totalDuration = Duration(seconds: 5);
    const updateInterval = Duration(milliseconds: 50);
    int totalSteps = (totalDuration.inMilliseconds / updateInterval.inMilliseconds).round();
    double increment = 1.0 / totalSteps;

    Timer.periodic(updateInterval, (Timer t) {
      progressValue.value += increment;
      if (progressValue.value >= 1.0) {
        isLoading.value = false;
        t.cancel();
        print("before navigate to login");
        // Navigate to the LoginScreen
       Get.toNamed(RoutePaths.loginScreen);
       print("after navigate to login");

      }
    });
  }
}
