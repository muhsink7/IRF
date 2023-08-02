import 'package:flutter/material.dart';
import 'package:indian_race_fantasy/Model/Button/custom_button.dart';
import 'package:indian_race_fantasy/Model/Button/techraven_button.dart';
import 'package:pinput/pinput.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
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
                onChanged: (value) {
                  // print("{$controller.otpCode}");
                  //
                  // controller.otpCode = value;
                },
                // defaultPinTheme: PinTheme(
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(10),
                //   )
                // ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: CustomButton(onPressed: () {}, title: "Verify"),
              ),
              Text("Didn't recieve an Otp? "),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    "Resend OTP",
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.bold,
                      fontSize: 24.0,
                    ),
                  )),
              const SizedBox(height: 50),
              Container(
                child: Column(
                  children: [
                    Text("All rights reserved INDIA RACE FANTASY 2022"),
                    SizedBox(
                      height: 10.0,
                    ),
                    Center(
                      child: RichText(
                          text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Powered by',
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.black,
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
