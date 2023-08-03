import 'package:get/get.dart';
import 'package:indian_race_fantasy/router.dart';

class OtpController extends GetxController {
 var otpCode = ''.obs;

  void onOtpChanged(String value) {
    otpCode.value = value;
  }

  void verifyOtp() {
    // Add your verification logic here
    // For example, you can check if the OTP code is valid and navigate to the next screen
    Get.toNamed(RoutePaths.homeScreen);
  }

  void resendOtp() {
    // Add your logic to resend the OTP here
  }

}