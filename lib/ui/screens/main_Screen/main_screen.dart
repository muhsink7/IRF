import 'package:flutter/material.dart';
import 'package:indian_race_fantasy/ui/screens/cashier_screen/cashier_screen.dart';
import 'package:indian_race_fantasy/ui/screens/home_screen/home_screen.dart';
import 'package:indian_race_fantasy/ui/screens/menu_screen/menu_screen.dart';
import 'package:indian_race_fantasy/ui/screens/result_screen/result_screen.dart';

import '../../widgets/bottom_nav.dart';
import '../race_screen/race_screen.dart';

class ScreenMainPage extends StatelessWidget {
   ScreenMainPage({super.key});

final _pages =[
  RaceScreen(),
  ResultScreen(),
  HomeScreen(),
  CashierScreen(),
  MenuScreen(),
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder(valueListenable: indexChangeNotifier, builder: (context, int index,_) {
          return _pages[index];   
        },),
      ),
      bottomNavigationBar: BottomNavigationWidget(),
    );
  }
}