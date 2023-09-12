
import 'package:get/get.dart';
import 'package:indian_race_fantasy/ui/screens/cashier_screen/cashier_binding.dart';
import 'package:indian_race_fantasy/ui/screens/cashier_screen/cashier_screen.dart';
import 'package:indian_race_fantasy/ui/screens/login_screen/login_screen.dart';
import 'package:indian_race_fantasy/ui/screens/main_Screen/main_binding.dart';
import 'package:indian_race_fantasy/ui/screens/main_Screen/main_screen.dart';
import 'package:indian_race_fantasy/ui/screens/menu_contents/bank_details/bank_details_bindings.dart';
import 'package:indian_race_fantasy/ui/screens/menu_contents/bank_details/bank_details_screen.dart';
import 'package:indian_race_fantasy/ui/screens/menu_contents/kyc_details/kyc_binding.dart';
import 'package:indian_race_fantasy/ui/screens/menu_contents/kyc_details/kyc_details_screen.dart';
import 'package:indian_race_fantasy/ui/screens/menu_screen/menu_binding.dart';
import 'package:indian_race_fantasy/ui/screens/menu_screen/menu_screen.dart';
import 'package:indian_race_fantasy/ui/screens/otp_screen/otp_binding.dart';
import 'package:indian_race_fantasy/ui/screens/otp_screen/otp_screen.dart';
import 'package:indian_race_fantasy/ui/screens/race_screen/race_binding.dart';
import 'package:indian_race_fantasy/ui/screens/race_screen/race_screen.dart';
import 'package:indian_race_fantasy/ui/screens/result_screen/result_binding.dart';
import 'package:indian_race_fantasy/ui/screens/result_screen/result_screen.dart';
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
  static const String menuScreen = '/menu';
  static const String raceScreen = '/race';
  static const String resultScreen = '/result';
  static const String cashierScreen = '/cashier';
  static const String mainScreen = '/main';
  static const String kycDetailsScreen = '/kyc';
  static const String bankDetailScreen = '/bank';




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

    GetPage(
      name: RoutePaths.menuScreen,
      binding: MenuCardBinding(),
      page: () =>  MenuCardScreen(),
    ),

    GetPage(
      name: RoutePaths.raceScreen,
      binding: RaceBinding(),
      page: () =>  RaceScreen(),
    ),

    GetPage(
      name: RoutePaths.resultScreen,
      binding: ResultBinding(),
      page: () =>  ResultScreen(),
    ),

    GetPage(
      name: RoutePaths.cashierScreen,
      binding: CashierBinding(),
      page: () =>  CashierScreen(),
    ),

    GetPage(
      name: RoutePaths.mainScreen,
      binding: MainBinding(),
      page: () =>  MainScreen(),
    ),

    GetPage(
      name: RoutePaths.kycDetailsScreen,
      binding: KYCBinding(),
      page: () =>  KYCDetailsScreen(),
    ),

    GetPage(
      name: RoutePaths.bankDetailScreen,
      binding: BankDetailBinding(),
      page: () =>  BankDetailScreen(),
    ),

  ];
}
