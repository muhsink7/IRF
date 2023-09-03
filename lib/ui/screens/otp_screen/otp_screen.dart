import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indian_race_fantasy/ui/screens/home_screen/home_controller.dart';
import 'package:pinput/pinput.dart';

import '../../../Model/Button/custom_button.dart';
import '../../../Model/Button/techraven_button.dart';
import '../../../constants/color_constants.dart';
import 'otp_controller.dart';

class OtpScreen extends GetWidget<OtpController> {
  final OtpController _otpController = Get.put(OtpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: GetBuilder<OtpController>(
              builder: (controller) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      Center(
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                width: 150,
                                height: 150,
                                child: Image.asset('assets/images/logo_blue.png'),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: const Text(
                                  'Please enter the OTP sent to your mobile number',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: SizedBox(
                                  height: 60.0,
                                  child: Pinput(
                                    length: 6,
                                    keyboardType: TextInputType.number,
                                    pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                                    showCursor: true,
                                    // androidSmsAutofillMethod:
                                    //     AndroidSmsAutofillMethod.smsRetrieverApi,
                                    controller: controller.otpTextController,
                                    onSubmitted: (value){
                                      print(controller.otpTextController);

                                      _otpController.setOtp(value); // Set the otp in controller
                                      _otpController.verifyOtp();

                                    },
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(30.0),
                                child: CustomButton(onPressed: (){
                                  print(controller.otpTextController);
                                  _otpController.setOtp(controller.otpTextController.text);
                                  _otpController.verifyOtp();
                                }, title: "Verify"),
                              ),
                              const Text("Didn't recieve an Otp? ",style: TextStyle(fontSize: 16.0),),
                              SizedBox(height: 20,),
                              TextButton(
                                  onPressed: _otpController.resendOtp,
                                  child: const Text(
                                    "Resend OTP",
                                    style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24.0,
                                    ),
                                  )),
                              const SizedBox(height: 20),
                              SizedBox(
                                height: Get.height*.1,
                              ),
                              Column(
                                children: [
                                  const Text("All rights reserved INDIA RACE FANTASY 2022",style: TextStyle(fontSize: 14.0),),
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                  Center(
                                    child: RichText(
                                        text: TextSpan(
                                          children: [
                                            const TextSpan(
                                              text: 'Powered by   ',
                                              style: TextStyle(
                                                fontSize: 14.0,
                                                color: kBlackColor,
                                              ),
                                            ),

                                            WidgetSpan(
                                              child: TechravenButton(),
                                            ),
                                          ],
                                        )),
                                  ),
                                  // Text("Powered by "),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }
          ),
        ),
      ),
    );
  }
}
