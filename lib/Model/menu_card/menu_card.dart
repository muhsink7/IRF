import 'package:flutter/material.dart';
import 'package:indian_race_fantasy/constants/color_constants.dart';

class MenuCard extends StatelessWidget {
  const MenuCard({super.key, required this.cardImage, required this.cardTitle, required this.onTap});

  final Image cardImage;
  final String cardTitle;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: onTap,
      child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 400,
                        decoration: BoxDecoration(
                          color: secondaryColor,
                          borderRadius: BorderRadius.circular(20),
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
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 60,
                                width: 90,
                                child: cardImage,
                                ),
                               Expanded(
                                 child: Text(
                                     cardTitle,
                                     textAlign: TextAlign.center,
                                     style: const TextStyle(
                                       fontSize: 18,
                                       fontWeight: FontWeight.bold,
                                       color: primaryColor,
                                     ),
                                 ),
                               ),
                            ],
                          ),
                        ),
                      ),
                    ),
    );
  }
}