import 'package:flutter/material.dart';
import 'package:indian_race_fantasy/constants/color_constants.dart';

class ReusableCard extends StatelessWidget {
  const ReusableCard(
      {Key? key,
      required this.registerPressed,
      required this.detailsPressed,
      required this.tournamentName,
      required this.price,
      required this.entryFee});

  final void Function() registerPressed;
  final void Function() detailsPressed;
  final String tournamentName;
  final String price;
  final String entryFee;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding:
          EdgeInsets.symmetric(vertical: 10.0, horizontal: screenWidth * 0.04),
      child: Card(
        color: secondaryColor,
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.02),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    tournamentName,
                    style: TextStyle(
                      color: primaryColor,
                      fontSize: screenWidth *
                          0.05, // Adjust font size based on screen width
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "Details",
                        style: TextStyle(
                          color: kWhiteColor,
                          fontSize: screenWidth *
                              0.035, // Adjust font size based on screen width
                        ),
                      ),
                      IconButton(
                        onPressed: detailsPressed,
                        icon: Icon(
                          Icons.info_outline_rounded,
                          color: kWhiteColor,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              const Divider(
                // Add a Divider widget to create the dividing line
                thickness: 2,
                color: primaryColor,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.emoji_events,
                        color: kWhiteColor,
                        size: screenWidth *
                            0.07, // Adjust icon size based on screen width
                      ),
                      Text(
                        "price : $price",
                        style: TextStyle(
                          color: kWhiteColor,
                          fontSize: screenWidth *
                              0.035, // Adjust font size based on screen width
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: screenWidth * 0.01),
                  Row(
                    children: [
                      Icon(
                        Icons.money,
                        color: kWhiteColor,
                        size: screenWidth *
                            0.07, // Adjust icon size based on screen width
                      ),
                      Text(
                        "Entry fee : $entryFee",
                        style: TextStyle(
                          color: kWhiteColor,
                          fontSize: screenWidth *
                              0.035, // Adjust font size based on screen width
                        ),
                      ),
                    ],
                  ),
                  MaterialButton(
                    onPressed: registerPressed,
                    child: Container(
                      width: screenWidth *
                          0.17, // Adjust button width based on screen width
                      height: screenWidth *
                          0.07, // Adjust button height based on screen width
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(screenWidth *
                            0.03), // Adjust border radius based on screen width
                      ),
                      child: Center(
                        child: Text(
                          "Register",
                          style: TextStyle(
                            color: kWhiteColor,
                            fontSize: screenWidth *
                                0.035, // Adjust font size based on screen width
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
