
import 'package:get/get.dart';
import 'package:indian_race_fantasy/ui/screens/login_screen/login_screen.dart';
import 'package:indian_race_fantasy/ui/screens/otp_screen/otp_binding.dart';
import 'package:indian_race_fantasy/ui/screens/otp_screen/otp_screen.dart';
import 'package:indian_race_fantasy/ui/screens/splash_screen/splash_binding.dart';

import 'ui/screens/home_screen/home_binding.dart';
import 'ui/screens/home_screen/home_screen.dart';
import 'ui/screens/login_screen/login_binding.dart';
import 'ui/screens/splash_screen/splash_screen.dart';

class RoutePaths {
  static const String splash = '/';
  static const String loginScreen = '/login';
  static const String otpScreen = '/otp';
  static const String homeScreen = '/home';

}

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: RoutePaths.splash,
      binding: SplashBinding(),
      page: () =>  SplashScreen(),
    ),
    
    GetPage(
      name: RoutePaths.loginScreen,
      binding: LoginBinding(),
      page: () => LoginScreen(),
    ),

    GetPage(
      name: RoutePaths.otpScreen,
      binding: OtpBinding(),
      page: () =>  OtpScreen(),
    ),

    GetPage(
      name: RoutePaths.homeScreen,
      binding: HomeBinding(),
      page: () =>  HomeScreen(),
    ),
  ];
}
