import 'package:flutter/material.dart';
import 'package:get/get.dart';
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


  final _pages = [
    RaceScreen(),
    ResultScreen(),
    HomeScreen(),
    CashierScreen(),
    MenuCardScreen(),
  ];

  RxInt indexChangeNotifier = 2.obs; // Use RxInt from GetX

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
            final index = indexChangeNotifier.value;
            print('Index Value: $index');
            return _pages[index];
          }),
        ),
        bottomNavigationBar: BottomNavigationWidget(indexChangeNotifier: indexChangeNotifier)

    );
  }
}
