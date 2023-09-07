import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:indian_race_fantasy/ui/screens/menu_contents/kyc_details/kyc_controller.dart';
import '../../../../Model/Button/custom_button.dart';
import '../../../../constants/color_constants.dart';
import '../../otp_screen/otp_controller.dart';

class KYCDetailsScreen extends GetWidget<KYCController> {
  KYCDetailsScreen({super.key});
  final OtpController otpController = Get.put(OtpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: GetBuilder<KYCController>(builder: (controller) {
              return Column(children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'KYC Documents',
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
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: secondaryColor,
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: controller.userNameController,
                          cursorColor: Colors.white,
                          enabled: !controller.isKYCSubmitted,
                          style: const TextStyle(color: Colors.white),
                          decoration: const InputDecoration(
                              labelText: 'User name',
                              labelStyle: TextStyle(color: Colors.white),
                              hintText: 'User ',
                              border: InputBorder.none,
                              hintStyle: TextStyle(color: Colors.white)),
                        ),
                      ),
                    ),
                    if (controller.userNameError != null &&
                        controller.userNameError!.isNotEmpty)
                      // Display the error message if not empty
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          controller.userNameError!,
                          style: const TextStyle(
                            color: Colors.red,
                          ),
                        ),
                      ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                color: secondaryColor,
                                borderRadius: BorderRadius.circular(12)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextField(
                                controller: controller.firstNameController,
                                enabled: !controller.isKYCSubmitted,
                                cursorColor: Colors.white,
                                style: const TextStyle(color: Colors.white),
                                decoration: const InputDecoration(
                                    labelText: 'First name',
                                    labelStyle: TextStyle(color: Colors.white),
                                    hintText: 'First name',
                                    border: InputBorder.none,
                                    hintStyle: TextStyle(color: Colors.white)),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                color: secondaryColor,
                                borderRadius: BorderRadius.circular(12)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextField(
                                controller: controller.lastNameController,
                                enabled: !controller.isKYCSubmitted,
                                cursorColor: Colors.white,
                                style: const TextStyle(color: Colors.white),
                                decoration: const InputDecoration(
                                    labelText: 'Last name',
                                    labelStyle: TextStyle(color: Colors.white),
                                    hintText: 'Last name',
                                    border: InputBorder.none,
                                    hintStyle: TextStyle(color: Colors.white)),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     if (controller.firstNameError!.isNotEmpty) // Display the error message if not empty
                    //       Padding(
                    //         padding: const EdgeInsets.all(8.0),
                    //         child: Text(
                    //           controller.firstNameError!,
                    //           style: TextStyle(
                    //             color: Colors.red,
                    //           ),
                    //         ),
                    //       ),
                    //     if (controller.lastNameError!.isNotEmpty) // Display the error message if not empty
                    //       Padding(
                    //         padding: const EdgeInsets.all(8.0),
                    //         child: Text(
                    //           controller.lastNameError!,
                    //           style: TextStyle(
                    //             color: Colors.red,
                    //           ),
                    //         ),
                    //       ),
                    //   ],
                    // ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: secondaryColor,
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: controller.emailController,
                          enabled: !controller.isKYCSubmitted,
                          cursorColor: Colors.white,
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                              labelText: 'Email',
                              labelStyle: TextStyle(color: Colors.white),
                              hintText: 'Email',
                              border: InputBorder.none,
                              hintStyle: TextStyle(color: Colors.white)),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: secondaryColor,
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: TextField(
                                onTap: () {
                                  controller.showGenderOption();
                                },
                                controller: controller.genderController,
                                enabled: !controller.isKYCSubmitted,
                                cursorColor: Colors.white,
                                style: const TextStyle(color: Colors.white),
                                decoration: const InputDecoration(
                                    labelText: 'Gender',
                                    labelStyle: TextStyle(color: Colors.white),
                                    hintText: 'Gender',
                                    border: InputBorder.none,
                                    hintStyle: TextStyle(color: Colors.white)),
                                readOnly: true,
                              ),
                            ),
                            const Icon(
                              Icons.arrow_drop_down,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Date of Birth',
                      style: TextStyle(
                          fontWeight: FontWeight.w600, color: Colors.grey[800]),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                color: secondaryColor,
                                borderRadius: BorderRadius.circular(12)),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: TextField(
                                controller: controller.dateOfBirthController,
                                readOnly: true,
                                onTap: () => controller.selectDate(context),
                                style: const TextStyle(color: Colors.white),
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: ' Date of Birth',
                                  hintStyle: TextStyle(color: Colors.white),
                                  suffixIcon: Icon(
                                    Icons.calendar_today,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
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
                                      labelText: 'PAN number',
                                      labelStyle:
                                          TextStyle(color: Colors.white),
                                      hintText: 'PAN number',
                                      border: InputBorder.none,
                                      hintStyle: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: primaryColor,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: TextField(
                                          onTap: () {
                                            controller.showImageOption();
                                          },
                                          style: const TextStyle(
                                              color: Colors.black),
                                          decoration: const InputDecoration(
                                            hintText: 'PAN Card',
                                            border: InputBorder.none,
                                            hintStyle: TextStyle(
                                                color: secondaryColor),
                                          ),
                                          readOnly: true,
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          controller.showImageOption();
                                        },
                                        child: const Icon(
                                          Icons.attach_file,
                                          color: secondaryColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              // Add your Text or other widgets here
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: secondaryColor,
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: TextField(
                                keyboardType: TextInputType.number,
                                controller: controller.aadharNumController,
                                enabled: !controller.isKYCSubmitted,
                                cursorColor: Colors.white,
                                style: const TextStyle(color: Colors.white),
                                decoration: const InputDecoration(
                                    labelText: 'Aadhar number',
                                    labelStyle: TextStyle(color: Colors.white),
                                    hintText: 'Aadhar number',
                                    border: InputBorder.none,
                                    hintStyle: TextStyle(color: Colors.white)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: primaryColor,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: TextField(
                                          onTap: () {
                                            controller.showImageOption();
                                          },
                                          style: const TextStyle(
                                            color: Colors.black,
                                          ),
                                          decoration: const InputDecoration(
                                            hintText: 'Front side',
                                            border: InputBorder.none,
                                            hintStyle: TextStyle(
                                              color: secondaryColor,
                                            ),
                                          ),
                                          readOnly: true,
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          controller.showImageOption();
                                        },
                                        child: const Icon(
                                          Icons.attach_file,
                                          color: secondaryColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 20, // Add desired gap width here
                            ),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: primaryColor,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: TextField(
                                          onTap: () {
                                            controller.showImageOption();
                                          },
                                          style: const TextStyle(
                                            color: Colors.black,
                                          ),
                                          decoration: const InputDecoration(
                                            hintText: 'Back side',
                                            border: InputBorder.none,
                                            hintStyle: TextStyle(
                                              color: secondaryColor,
                                            ),
                                          ),
                                          readOnly: true,
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          controller.showImageOption();
                                        },
                                        child: const Icon(
                                          Icons.attach_file,
                                          color: secondaryColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            // Text(
                            //   'Approved',
                            //   style: TextStyle(
                            //     color: Color.fromARGB(255, 98, 187, 25),
                            //     fontWeight: FontWeight.w400,
                            //   ),
                            // ),
                            const SizedBox(height: 20),
                            Text(
                              'Bank Details',
                              style: TextStyle(
                                color: kBlackColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
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
                              keyboardType: TextInputType.number,
                              enabled: !controller.isKYCSubmitted,
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
                        const SizedBox(height: 30),
                      ],
                    )
                  ],
                ),
                CustomButton(
                  onPressed: () async {
                    // var userid = await otpController.userId;
                    // var phnno = await otpController.phoneNumber;
                    controller.kycUpdate(GetStorage().read("userId"),
                        GetStorage().read("phoneNumber"));
                    controller.getUserDetails(GetStorage().read("userId"));
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
