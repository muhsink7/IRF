import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../../api/api.dart';
import '../../../../model/dialog_models/update_error.dart';
import '../../../../model/dialog_models/update_success.dart';
import '../../../../model/model_api/kyc_update.dart';
import '../../../../model/model_api/user_details.dart';
import '../../../../router.dart';

class BankDetailController extends GetxController{
  bool isKYCSubmitted = false;
  Api api = Get.find();


  List<KycUpdate> kycUpdateData = [];
  var userDetails = UserDetails().obs;

  var kycData;

  TextEditingController pancardNumController = TextEditingController();
  TextEditingController bankNameController = TextEditingController();
  TextEditingController accountNumberController = TextEditingController();
  TextEditingController ifscCodeController = TextEditingController();
  TextEditingController upiIdController = TextEditingController();



  String? accountNumberError;
  String? bankNameError;
  String? ifscCodeError;
  String? pancardNumError;
  String? upiIdError;



  @override
  void onInit() {
    getUserDetails(GetStorage().read('userId'));
    print(GetStorage().read('userId'));
    update();
    super.onInit();
    // getUserDetails(OtpController.instance.userId);
  }

  void showBankUpdateDialog() {
    Get.dialog(
      UpdateSuccess(
        onOkPressed: () {
          // Implement the refresh KYC logic here
          // This function will be called when the "OK" button is pressed
          isKYCSubmitted = true;
          Get.offAndToNamed(RoutePaths.menuScreen);
        }, title: 'Your Bank Details Updated.',
      ),
    );
  }

  Future<void> kycUpdate(String userId, String phoneNumber,) async {
    bool isValidPanCard(String panCardNumber) {
      // PAN card should be in the format of five uppercase letters, four digits, and one uppercase letter
      return RegExp(r'^[A-Z]{5}[0-9]{4}[A-Z]{1}$').hasMatch(panCardNumber);
    }


    bool isValidUPIId(String upiId) {
      // Define a regular expression pattern for a valid UPI ID
      // This pattern allows alphanumeric characters, "@" and "."
      final RegExp regExp = RegExp(r'^[a-zA-Z0-9@.]+$');

      // Check if the UPI ID matches the pattern
      return regExp.hasMatch(upiId);
    }

    if (accountNumberController.text.isEmpty) {
      accountNumberError = 'Account Number is required';
    }

    if (bankNameController.text.isEmpty) {
      bankNameError = 'Bank Name is required';
    }

    if (ifscCodeController.text.isEmpty) {
      ifscCodeError = 'IFSC Code is required';
    }

    if (pancardNumController.text.isEmpty) {
      pancardNumError = 'PANCard number is required';
    }
    // Check if any error message is set

    if (!isValidPanCard(pancardNumController.text)) {

      Get.snackbar(
        'Error',
        'Invalid PAN card number format',
        colorText: Colors.red,
        backgroundColor: Colors.white,
        duration: const Duration(seconds: 3),
      );
      return;
    }

    if (
    accountNumberError != null ||
    bankNameError != null ||
        upiIdError != null ||
        ifscCodeError != null ||
        pancardNumError != null
    ) {
      Get.snackbar(
        'Error',
        'Please fill in all required fields or Enter correct format of PAN card and Aadhar card number',
        // snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.red,
        backgroundColor: Colors.white,
        duration: const Duration(seconds: 3),
      );
      return;
    }


    KycUpdate kycData = KycUpdate(
      accountNumber: accountNumberController.text,
      bankName: bankNameController.text,
      ifscCode: ifscCodeController.text,
      kycPancardNumber: pancardNumController.text,
      userId: userId,
      upiId: upiIdController.text,
    );
    
    try {
      await api.updateKyc(kycData);
      print('++++++++++++++++$kycData+++++++++++++');

      // Update user details after KYC update (Assuming you have a method for this)
      await updateUserDetails(userId);

      // Show the KYC update dialog
      showBankUpdateDialog();
    } catch (e) {
      UpdateError(onOkPressed: () {
        Get.back();
      }, title: 'Your Bank Details is not updated, Please fill all the Details in the form and try again.',);
      print('Error updating Bank Details: $e');
    }
  }

// Add a method to update user details
  Future<void> updateUserDetails(String userId) async {
    try {
      var userDetailsData = await api.getUserDetails(userId);
      userDetails.value = userDetailsData;
      print(userDetailsData);
      bankNameController.text = userDetailsData.bankName ?? "";
      pancardNumController.text = userDetailsData.kycPancardNumber ?? "";
      accountNumberController.text = userDetailsData.accountNumber ?? "";
      ifscCodeController.text = userDetailsData.ifscCode ?? "";
      upiIdController.text = userDetailsData.upiId ?? "";

      // Add more fields to update as needed
      print("Fetched user's username: ${userDetails.value.userName}");
    } catch (e) {
      print('Error updating user details: $e');
    }
  }

  Future<void> getUserDetails(String? userId) async {
    try {
      if (userId == null) {
        return;
      }
      var userDetailsData = await api.getUserDetails(userId);
      userDetails.value = userDetailsData;
      pancardNumController.text = userDetailsData.kycPancardNumber ?? "";
      accountNumberController.text = userDetailsData.accountNumber ?? "";
      ifscCodeController.text = userDetailsData.ifscCode ?? "";
      upiIdController.text = userDetailsData.upiId ?? "";
      bankNameController.text = userDetailsData.bankName ?? "";


      print("Fetched user's username: ${userDetails.value.bankName}");
      print("Fetched user's username: ${userDetails.value.accountNumber}");
      print("Fetched user's username: ${userDetails.value.ifscCode}");
      print("Fetched user's username: ${userDetails.value.upiId}");

      print(userDetailsData);
    } catch (e) {
      print('Error fetching user details: $e');
    }
  }

  @override
  void onClose() {
    // _imageBox.close();
    // Hive.close();
    super.onClose();
  }

}