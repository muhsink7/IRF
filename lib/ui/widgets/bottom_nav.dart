import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart'; // Import GetX
import 'package:indian_race_fantasy/constants/color_constants.dart';

RxInt indexChangeNotifier = 0.obs; // Use RxInt from GetX

class BottomNavigationWidget extends StatelessWidget {
  const BottomNavigationWidget({Key? key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return BottomNavigationBar(
        currentIndex: indexChangeNotifier.value, // Use the value from the RxInt
        onTap: (index) {
          indexChangeNotifier.value = index; // Update the value using RxInt
        },
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        backgroundColor: secondaryColor,
        selectedItemColor: kWhiteColor,
        unselectedItemColor: kGreyColor,
        selectedIconTheme: const IconThemeData(color: Colors.white),
        unselectedIconTheme: const IconThemeData(color: Colors.grey),
        items: [
          BottomNavigationBarItem(
            icon: Container(
              height: 28,
              child: SvgPicture.asset(
                'assets/icons/race.svg',
                color: indexChangeNotifier.value == 0 ? kWhiteColor : kGreyColor,
              ),
            ),
            label: 'Race',
          ),
          BottomNavigationBarItem(
            icon: Container(
              height: 28,
              child: SvgPicture.asset(
                'assets/icons/result.svg',
                color: indexChangeNotifier.value == 1 ? kWhiteColor : kGreyColor,
              ),
            ),
            label: 'Results',
          ),
          BottomNavigationBarItem(
            icon: Container(
              height: 28,
              child: SvgPicture.asset(
                'assets/icons/home.svg',
                color: indexChangeNotifier.value == 2 ? kWhiteColor : kGreyColor,
              ),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Container(
              height: 28,
              child: SvgPicture.asset(
                'assets/icons/rupee.svg',
                color: indexChangeNotifier.value == 3 ? kWhiteColor : kGreyColor,
              ),
            ),
            label: 'Cashier',
          ),
          BottomNavigationBarItem(
            icon: Container(
              height: 28,
              child: SvgPicture.asset(
                'assets/icons/Menu.svg',
                color: indexChangeNotifier.value == 4 ? kWhiteColor : kGreyColor,
              ),
            ),
            label: 'Menu',
          ),
        ],
      );
    });
  }
}
