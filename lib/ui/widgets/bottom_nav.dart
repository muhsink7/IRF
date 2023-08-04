import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:indian_race_fantasy/constants/color_constants.dart';

ValueNotifier<int> indexChangeNotifier =ValueNotifier(0);

class BottomNavigationWidget extends StatelessWidget {
  const BottomNavigationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(valueListenable: indexChangeNotifier, builder: (context, int newIndex, _) {
      return BottomNavigationBar(
      currentIndex: newIndex,
      onTap: (index){
        indexChangeNotifier.value = index;
      },
      elevation: 0,
      type: BottomNavigationBarType.fixed,
      backgroundColor: secondaryColor,
      selectedItemColor: kWhiteColor,
      unselectedItemColor: kGreyColor,
      selectedIconTheme: const IconThemeData(color: Colors.white),
      unselectedIconTheme: const IconThemeData(color: Colors.grey),
      items:  [
        BottomNavigationBarItem(icon: Container(
              height: 28,
              child: SvgPicture.asset(
                'assets/icons/race.svg',
                 color: newIndex == 0 ? kWhiteColor : kGreyColor,

              ),
            ),
        label: 'Race',
        ),
         BottomNavigationBarItem(icon: Container(
              height: 28,
              child: SvgPicture.asset(
                'assets/icons/result.svg',
                color: newIndex == 1 ? kWhiteColor : kGreyColor,
              ),
            ),
        label: 'Results',
        ),
         BottomNavigationBarItem(icon: Container(
              height: 28,
              child: SvgPicture.asset(
                'assets/icons/home.svg',
                color: newIndex == 2 ? kWhiteColor : kGreyColor,
              ),
            ),
        label: 'Home',
        ),
         BottomNavigationBarItem(icon: Container(
              height: 28,
              child: SvgPicture.asset(
                'assets/icons/rupee.svg',
                color: newIndex == 3 ? kWhiteColor : kGreyColor,
              ),
            ),
        label: 'Cashier',
        ),
         BottomNavigationBarItem(icon: Container(
              height: 28,
              child: SvgPicture.asset(
                'assets/icons/Menu.svg',
                color: newIndex == 4 ? kWhiteColor : kGreyColor,
              ),
            ),
        label: 'Menu',
        ),
      ]
      );
      
    },);
  }
}