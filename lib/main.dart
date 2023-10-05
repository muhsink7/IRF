import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:indian_race_fantasy/api/api.dart';
import 'package:indian_race_fantasy/constants/color_constants.dart';
import 'package:indian_race_fantasy/router.dart';
import 'package:sizer/sizer.dart';
import 'ui/screens/splash_screen/splash_binding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
      onInit: (){
        Get.put(Api());
      },
      initialRoute: RoutePaths.splash,
      initialBinding: SplashBinding(),
      getPages: AppPages.pages,
      defaultTransition: Transition.cupertino,
    );
  }
}