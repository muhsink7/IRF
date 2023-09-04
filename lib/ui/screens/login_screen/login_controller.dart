// import 'dart:convert';
// import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../api/api.dart';
import '../../../authentication/authentication_repository.dart';
// import '../../../router.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();
  final AuthenticationRepository authenticationRepository = Get.put(AuthenticationRepository());

  final Api api = Get.find(); // Create an instance of the new API class

  final countryCodeController = TextEditingController(text: "+91");
  final phoneNumber = TextEditingController();
  String phoneNo = '';

  void phoneNumberWithCode() {
    phoneNo = '${countryCodeController.text.trim()}${phoneNumber.text.trim()}';
    print(phoneNo);
    update();
  }
  void onCountryCodeChanged(String value) {
    phoneNumberWithCode();
    update();
  }

  void onPhoneNumberChanged(String value) {
    phoneNumberWithCode();
    update();
  }

  // Future<void> phoneAuthentication(String phoneNo) async {
  //   try {
  //     await api.phoneAuthentication(phoneNo);
  //     Get.toNamed(RoutePaths.otpScreen, arguments: phoneNo);
  //   } catch (e) {
  //     print('Error sending OTP: $e');
  //     Get.snackbar("Error", "Failed to send OTP");
  //   }
  // }
  void phoneAuthentication(String phoneNo) {
    print(phoneNo);
    if (phoneNo.isNotEmpty) {
      authenticationRepository.phoneAuthentication(phoneNo);
    } else {
      Get.snackbar("Error", "Not found a Mobile Number");
    }
  }
}
