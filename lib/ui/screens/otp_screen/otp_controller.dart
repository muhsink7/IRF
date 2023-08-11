import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:indian_race_fantasy/router.dart';

class OtpController extends GetxController {
  var otpCode = ''.obs;

  void onOtpChanged(String value) {
    otpCode.value = value;
  }

  void verifyOtp() async {
    try {
      // Create a PhoneAuthCredential with the OTP code
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: 'YOUR_VERIFICATION_ID', // Replace with the actual verification ID
        smsCode: otpCode.value,
      );

      // Sign in the user with the PhoneAuthCredential
      UserCredential userCredential =
      await FirebaseAuth.instance.signInWithCredential(credential);

      // Navigate to the home screen
      Get.toNamed(RoutePaths.homeScreen);
    } catch (error) {
      print(error);
    }
  }

  void resendOtp() {
    // Add your logic to resend the OTP here
  }
}