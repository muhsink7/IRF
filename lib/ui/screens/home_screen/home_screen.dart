import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:indian_race_fantasy/Model/reusable_card/reusable_card.dart';
import 'package:indian_race_fantasy/constants/color_constants.dart';
import 'package:indian_race_fantasy/ui/screens/home_screen/home_controller.dart';
import 'package:indian_race_fantasy/ui/widgets/bottom_nav.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<HomeController>(
          builder: (controller) {
            if (controller.isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return Column(
              children: [
                // Positioned content for the top section
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 100,
                  decoration: BoxDecoration(
                    color: primaryColor,
                    boxShadow: [
                      BoxShadow(
                        color: kBlackColor.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Stack(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Username",
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                    color: secondaryColor,
                                  ),
                                ),
                                Container(
                                  child: Row(
                                    children: [
                                      for (int i = 0; i < 5; i++)
                                        const Icon(
                                          Icons.star,
                                          color: secondaryColor,
                                          size: 20.0,
                                        ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const Divider(
                              thickness: 2.0,
                              color: secondaryColor,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: const Row(
                                    children: [
                                      Icon(Icons.currency_rupee,
                                          size: 18.0, color: secondaryColor),
                                      Text(
                                        "99999 ",
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold,
                                          color: secondaryColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  child: const Row(
                                    children: [
                                      Icon(Icons.monetization_on,
                                          size: 18.0, color: secondaryColor),
                                      Text(
                                        "99999 ",
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold,
                                          color: secondaryColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Center(
                          child: Container(
                            height: 150.0,
                            width: 150.0,
                            decoration: BoxDecoration(
                              color: secondaryColor,
                              border: Border.all(
                                color: secondaryColor,
                                width: 2.0,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: kBlackColor.withOpacity(0.3),
                                  spreadRadius: 2,
                                  blurRadius: 4,
                                  offset: const Offset(0, 0),
                                ),
                              ],
                              shape: BoxShape.circle,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(
                                  8.0), // Adjust the padding as needed
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                        "assets/images/logo_gold.png"),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    width: 350.0,
                    height: 80,
                    color: kGreyColor,
                  ),
                ),
                // Your ListView.builder goes here
                Expanded(
                  child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (ctx, index) {
                      return GestureDetector(
                        onTap: () {},
                        child: const ReusableCard(),
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
      bottomNavigationBar: const BottomNavigationWidget(),
    );
  }
}