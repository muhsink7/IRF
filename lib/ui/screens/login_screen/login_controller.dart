import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../router.dart';

class LoginController extends GetxController {
  // RxString to hold the mobile number input
  RxString mobileNumber = ''.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  // Method to update the mobile number input
  void updateMobileNumber(String value) {
    mobileNumber.value = value;
  }

  // Method to handle login button press

  void onLoginButtonPressed() async {
    try {
      // Verify the phone number using Firebase Authentication
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: mobileNumber.value,
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (FirebaseAuthException e) {},
        codeSent: (String verificationId, int? resendToken) {},
        codeAutoRetrievalTimeout: (String verificationId) {},
      );

  void onLoginButtonPressed() {
    // You can perform any validation or logic related to the mobile number here.
    // For example, you can check if the mobile number is valid before navigating to OTPScreen.
    print("before navigating otp page");
      Get.toNamed(RoutePaths.mainScreen);
      print("after navigating otp page");


      // Navigate to the OTP screen
      Get.toNamed(RoutePaths.mainScreen);
    } catch (error) {
      print(error);
    }
  }
}