import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indian_race_fantasy/Model/Button/custom_button.dart';
import 'package:indian_race_fantasy/constants/color_constants.dart';
import '../../../Model/Button/techraven_button.dart';
import 'login_controller.dart';

class LoginScreen extends GetWidget<LoginController> {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get instance of the LoginController
    final LoginController _loginController = Get.put(LoginController());

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: GetBuilder<LoginController>(
            builder: (controller) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 170,
                    height: 170,
                    child: Image.asset('assets/images/logo_blue.png'),
                  ),
                  const SizedBox(height: 10,),
                  const Text(
                    'Hi',
                    style: TextStyle(
                      fontSize: 36.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10,),
                  const Text("Let's get Started",style: TextStyle(
                    fontSize: 20.0,
                  ),),
                  const SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            onChanged: _loginController.updateMobileNumber, // Call the updateMobileNumber method on text change
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(
                                  color: kBlackColor,
                                  width: 2.0,
                                ),
                              ),
                              hintText: '+91',
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          flex: 3,
                          child: TextFormField(
                            onChanged: _loginController.updateMobileNumber, // Call the updateMobileNumber method on text change
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(
                                  color: kBlackColor,
                                  width: 2.0,
                                ),
                              ),
                              labelText: 'Mobile Number',
                              hintText: 'Enter Mobile Number',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 50,),
                  CustomButton(
                    onPressed: _loginController.onLoginButtonPressed, // Call the onLoginButtonPressed method on button press
                    title: "Login",
                  ),
                  
                  const Spacer(),// Add some spacing between widgets
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
                  const SizedBox(height: 30,),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
