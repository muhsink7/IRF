import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indian_race_fantasy/ui/screens/cashier_screen/cashier_screen.dart';
import 'package:indian_race_fantasy/ui/screens/home_screen/home_screen.dart';
import 'package:indian_race_fantasy/ui/screens/menu_screen/menu_screen.dart';
import 'package:indian_race_fantasy/ui/screens/result_screen/result_screen.dart';

import '../../widgets/bottom_nav.dart';
import '../race_screen/race_screen.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key});

  final _pages = [
    RaceScreen(),
    ResultScreen(),
    HomeScreen(),
    CashierScreen(),
    MenuCardScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(() {
          final index = indexChangeNotifier.value;
          return _pages[index];
        }),
      ),
      bottomNavigationBar: BottomNavigationWidget(),
    );
  }
}
