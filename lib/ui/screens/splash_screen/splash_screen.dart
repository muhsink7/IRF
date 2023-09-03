import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indian_race_fantasy/ui/screens/splash_screen/splash_controller.dart';
import '../../../Authentication/auth_checker.dart';
import '../../../Model/Button/techraven_button.dart';
import '../../../constants/color_constants.dart';

class SplashScreen extends GetWidget<SplashController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetX<SplashController>(
          builder: (controller) {
            if (controller.isLoading.value) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spacer(),
                  const SizedBox(height: 40,),
                  SizedBox(
                    width: 300,
                    child: Image.asset("assets/images/horse1.gif"),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50.0),
                    child: LinearProgressIndicator(
                      value: controller.progressValue.value,
                      semanticsLabel: 'Linear progress indicator',
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text("Loading...${(controller.progressValue.value * 100).round()}%"),
                  const Spacer(),
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
                  const SizedBox(height: 50),
                ],
              );
            } else {
              // Delayed navigation to the LoginScreen and pop the SplashScreen from the stack
              Future.delayed(Duration.zero, () {
                Get.offAll(()=>AuthChecker()); // Use Get.offAll to remove all previous routes from the stack
              });
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
