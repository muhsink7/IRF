import 'package:flutter/material.dart';
import 'package:indian_race_fantasy/constants/color_constants.dart';

class MenuCard extends StatelessWidget {
  const MenuCard({
    Key? key,
    required this.cardImage,
    required this.cardTitle,
    required this.onTap,
  }) : super(key: key);

  final Image cardImage;
  final String cardTitle;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    // Get the screen dimensions
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Calculate the size of the card image container
    final cardImageContainerConstraints = BoxConstraints(
      maxWidth: screenWidth * 0.1, // Adjust the percentage as needed
      maxHeight: screenHeight * 0.12, // Adjust the percentage as needed
    );

    // Calculate the font size based on screen width
    final fontSize = screenWidth < 400 ? 14.0 : 16.0; // Adjust the values as needed

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0,horizontal: 10.0),
        child: Container(
          decoration: BoxDecoration(
            color: secondaryColor,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: kGreyColor.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ConstrainedBox(
                  constraints: cardImageContainerConstraints,
                  child: cardImage,
                ),
                Text(
                  cardTitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: fontSize,
                    fontWeight: FontWeight.bold,
                    color: primaryColor,
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
