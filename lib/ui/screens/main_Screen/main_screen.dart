import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indian_race_fantasy/ui/screens/main_Screen/main_controller.dart';
import '../../widgets/bottom_nav.dart';
import '../cashier_screen/cashier_controller.dart';
import '../cashier_screen/cashier_screen.dart';
import '../home_screen/home_controller.dart';
import '../home_screen/home_screen.dart';
import '../menu_screen/menu_screen.dart';
import '../race_screen/race_controller.dart';
import '../race_screen/race_screen.dart';
import '../result_screen/result_controller.dart';
import '../result_screen/result_screen.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key});

  final  MainController mainController = Get.put(MainController());


  final _pages = [
    RaceScreen(),
    ResultScreen(),
    HomeScreen(),
    CashierScreen(),
    MenuCardScreen(),
  ];


  @override
  Widget build(BuildContext context) {

    Get.put(HomeController());
    Get.put(RaceController());
    Get.put(MenuController());
    Get.put(CashierController());
    Get.put(ResultController());


    return Scaffold(
        body: SafeArea(
          child: Obx(() {
            final index = mainController.indexChangeNotifier.value;
            ever(mainController.indexChangeNotifier, (_) {
              // Trigger the refreshUserDetails method when the index changes
              mainController.refreshUserDetails();
            });
            print('Index Value: $index');
            return _pages[index];
          }),
        ),
        bottomNavigationBar: BottomNavigationWidget(indexChangeNotifier: mainController.indexChangeNotifier)

    );
  }
}
