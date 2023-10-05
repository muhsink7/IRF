import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:indian_race_fantasy/ui/screens/menu_contents/bank_details/bank_details_controller.dart';
import '../../../../Model/Button/custom_button.dart';
import '../../../../constants/color_constants.dart';

class BankDetailScreen extends GetWidget<BankDetailController> {
  String? accountNumberError;

  String? bankNameError;

  String? ifscCodeError;

  String? pancardNumError;

  String? upiIdError;

  BankDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {



    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: GetBuilder<BankDetailController>(builder: (controller) {
              return Column(children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Bank Details',
                      style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    const Spacer(),
                    GestureDetector(
                        onTap: () {
                          Get.back();
                          // showBettingOption();
                        },
                        child: const Icon(Icons.arrow_back_ios))
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                        Container(
                          decoration: BoxDecoration(
                          color: secondaryColor,
                          borderRadius: BorderRadius.circular(12)),
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: controller.bankNameController,
                          enabled: !controller.isKYCSubmitted,
                          cursorColor: Colors.white,
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                              labelText: 'Bank Name',
                              labelStyle: TextStyle(color: Colors.white),
                              hintText: 'Bank Name',
                              border: InputBorder.none,
                              hintStyle: TextStyle(color: Colors.white)),
                        ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Container(
                          decoration: BoxDecoration(
                          color: secondaryColor,
                          borderRadius: BorderRadius.circular(12)),
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: controller.accountNumberController,
                          enabled: !controller.isKYCSubmitted,
                          keyboardType: TextInputType.number,
                          cursorColor: Colors.white,
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                              labelText: 'Account Number',
                              labelStyle: TextStyle(color: Colors.white),
                              hintText: 'Account Number',
                              border: InputBorder.none,
                              hintStyle: TextStyle(color: Colors.white)),
                        ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Container(
                          decoration: BoxDecoration(
                        color: secondaryColor,
                        borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: controller.ifscCodeController,
                          enabled: !controller.isKYCSubmitted,
                          keyboardType: TextInputType.text,
                          textCapitalization:
                          TextCapitalization.characters,
                          textInputAction: TextInputAction.done,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'^[A-Z0-9]+$')),
                            // This formatter ensures that the input is converted to uppercase
                          ],
                          cursorColor: Colors.white,
                          style: const TextStyle(color: Colors.white),
                          decoration: const InputDecoration(
                            labelText: 'IFSC Code',
                            labelStyle:
                            TextStyle(color: Colors.white),
                            hintText: 'IFSC Code',
                            border: InputBorder.none,
                            hintStyle: TextStyle(color: Colors.white),
                          ),
                        ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Container(
                          decoration: BoxDecoration(
                          color: secondaryColor,
                          borderRadius: BorderRadius.circular(12)),
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: controller.upiIdController,
                          enabled: !controller.isKYCSubmitted,
                          cursorColor: Colors.white,
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                              labelText: 'Upi Id',
                              labelStyle: TextStyle(color: Colors.white),
                              hintText: 'Upi Id',
                              border: InputBorder.none,
                              hintStyle: TextStyle(color: Colors.white)),
                        ),
                          ),
                        ),
                    const SizedBox(height: 20),

                    Container(
                      decoration: BoxDecoration(
                        color: secondaryColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: controller.pancardNumController,
                          enabled: !controller.isKYCSubmitted,
                          textCapitalization:
                          TextCapitalization.characters,
                          textInputAction: TextInputAction.done,
                          readOnly: true,
                          cursorColor: Colors.white,
                          style: const TextStyle(color: Colors.white),
                          decoration: const InputDecoration(
                        labelText: 'PAN number',
                        labelStyle:
                        TextStyle(color: Colors.white),
                        hintText: 'PAN number',
                        border: InputBorder.none,
                        hintStyle: TextStyle(color: Colors.white),
                        counterText: '',
                          ),
                          maxLength: 10,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text("Bank Details isn't verified.",
                        style: TextStyle(
                          color: Colors.redAccent,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                        const SizedBox(height: 30),
                ]),
                CustomButton(
                  onPressed: () async {
                    // var userid = await otpController.userId;
                    // var phnno = await otpController.phoneNumber;
                    controller.kycUpdate(GetStorage().read("userId"),
                        GetStorage().read("phoneNumber"));
                    controller.getUserDetails(GetStorage().read("userId"));
                    controller.accountNumberError = accountNumberError;
                    controller.bankNameError = bankNameError;
                    controller.ifscCodeError = ifscCodeError;
                    controller.pancardNumError = pancardNumError;
                    controller.upiIdError = upiIdError;

                    // Refresh the UI
                    controller.update();
                    // if (otpController.isVerified) {
                    //   String userId = otpController.userId;
                    //   String phoneNumber = Get.arguments;
                    //   // Call KYC update with the obtained userId and phoneNumber
                    //   KYCController.instance.kycUpdate(userId, phoneNumber);
                    // }
                  },
                  title: "Submit",
                )
              ]);
            }),
          ),
        ),
      ),
    );
  }
}
