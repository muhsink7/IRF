import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indian_race_fantasy/Model/Button/custom_button.dart';
import 'package:indian_race_fantasy/Model/Button/techraven_button.dart';
import 'package:indian_race_fantasy/constants/color_constants.dart';
import 'package:pinput/pinput.dart';

import 'otp_controller.dart';

class OtpScreen extends StatelessWidget {
  final OtpController _otpController = Get.put(OtpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: GetBuilder<OtpController>(
            builder: (controller) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 150,
                    height: 150,
                    child: Image.asset('assets/images/logo_blue.png'),
                  ),
                  const Text(
                    'Please enter the OTP sent to your mobile number',
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Pinput(
                    length: 4,
                    keyboardType: TextInputType.number,
                    pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                    showCursor: true,
                    androidSmsAutofillMethod:
                        AndroidSmsAutofillMethod.smsRetrieverApi,
                    onChanged: _otpController.onOtpChanged,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: CustomButton(onPressed: _otpController.verifyOtp, title: "Verify"),
                  ),
                  const Text("Didn't recieve an Otp? ",style: TextStyle(fontSize: 16.0),),
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
                  const SizedBox(height: 50),
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
              );
            }
          ),
        ),
      ),
    );
  }
}
