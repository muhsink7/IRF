import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Import Get package
import 'package:indian_race_fantasy/constants/color_constants.dart';
import 'package:indian_race_fantasy/router.dart';
import 'package:indian_race_fantasy/ui/screens/splash_screen/splash_binding.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp( 
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: primaryColor,
          primary: primaryColor,
          secondary: secondaryColor,
        ),
        useMaterial3: true,
      ),
      title: 'IRF',
      initialRoute: RoutePaths.splash,
      initialBinding: SplashBinding(),
      getPages: AppPages.pages,
      defaultTransition: Transition.cupertino,
    );
  }
}
