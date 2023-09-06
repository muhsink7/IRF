import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../api/api.dart';
import '../../../router.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();
  final Api api = Get.find(); // Create an instance of the new API class

  final countryCodeController = TextEditingController(text: "+91");
  final phoneNumber = TextEditingController();
  String phoneNo = '';

  void phoneNumberWithCode() {
    phoneNo = '${phoneNumber.text.trim()}';
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

  Future<void> phoneAuthentication(String phoneNo) async {
    try {
      await api.phoneAuthentication(phoneNo);
    } catch (e) {
      print('Error sending OTP: $e');
      Get.snackbar("Error", "Failed to send OTP");
    }
  }
}
