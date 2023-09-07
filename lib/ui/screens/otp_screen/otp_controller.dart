import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:indian_race_fantasy/api/api.dart';
import 'package:indian_race_fantasy/ui/screens/home_screen/home_controller.dart';
import '../../../model/model_api/kyc_update.dart';
import '../menu_contents/kyc_details/kyc_controller.dart';

class OtpController extends GetxController {
  static OtpController get instance => Get.find();

  final KYCController kycController = Get.put(KYCController());
  final HomeController homeController = Get.put(HomeController());
  final Api api = Get.find(); // Create an instance of the new API class

  final box = GetStorage();

  late TextEditingController otpTextController;

  var isVerified;
  var userId;
  var phoneNumber;
  var responseData;

  List<KycUpdate> kycUpdateData = [];

  @override
  void onInit() {
    otpTextController = TextEditingController();
    super.onInit();
  }

  var otp = '';

  void setOtp(String value) {
    otp = value;
  }

  Future<void> verifyOtp() async {
    if (otp.isNotEmpty) {
      // Pass otp and phoneNumber to the API method
      await api.verifyOtp(otp, Get.arguments);
    } else {
      print("OTP is empty");
    }
  }

  void resendOtp() {
    // Add your logic to resend the OTP here
  }
}