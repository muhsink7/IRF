import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart'; // Import GetX
import '../../constants/color_constants.dart';


class BottomNavigationWidget extends StatelessWidget {
  BottomNavigationWidget({super.key,required this.indexChangeNotifier });
  final RxInt indexChangeNotifier; // Use RxInt from GetX


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
        selectedItemColor: primaryColor,
        unselectedItemColor: kGreyColor,
        selectedIconTheme:  IconThemeData(color: Color(0xffEABE41)),
        unselectedIconTheme: const IconThemeData(color: kGreyColor),
        items: [
          BottomNavigationBarItem(
            icon: Container(
              height: 28,
              child: SvgPicture.asset(
                'assets/icons/race.svg',
                color: indexChangeNotifier.value == 0 ? primaryColor : kGreyColor,
              ),
            ),
            label: 'Race',
          ),
          BottomNavigationBarItem(
            icon: Container(
              height: 28,
              child: SvgPicture.asset(
                'assets/icons/result.svg',
                color: indexChangeNotifier.value == 1 ? primaryColor : kGreyColor,
              ),
            ),
            label: 'Results',
          ),
          BottomNavigationBarItem(
            icon: Container(
              height: 28,
              child: SvgPicture.asset(
                'assets/icons/home.svg',
                color: indexChangeNotifier.value == 2 ? primaryColor : kGreyColor,
              ),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Container(
              height: 28,
              child: SvgPicture.asset(
                'assets/icons/rupee.svg',
                color: indexChangeNotifier.value == 3 ? primaryColor : kGreyColor,
              ),
            ),
            label: 'Cashier',
          ),
          BottomNavigationBarItem(
            icon: Container(
              height: 28,
              child: SvgPicture.asset(
                'assets/icons/Menu.svg',
                color: indexChangeNotifier.value == 4 ? primaryColor : kGreyColor,
              ),
            ),
            label: 'Menu',
          ),
        ],
      );
    });
  }
}
