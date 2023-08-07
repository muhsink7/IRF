import 'package:flutter/material.dart';
import 'package:indian_race_fantasy/constants/color_constants.dart';

class MenuCard extends StatelessWidget {
  const MenuCard({super.key, required this.cardImage, required this.cardTitle});

  final Image cardImage;
  final String cardTitle;

  @override
  Widget build(BuildContext context) {
    return  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: secondaryColor,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: kGreyColor.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset:
                                const Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 60,
                            width: 90,
                            child: cardImage,
                            ),
                           Text(
                            cardTitle,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
  }
}