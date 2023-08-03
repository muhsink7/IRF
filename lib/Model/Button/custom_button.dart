import 'package:flutter/material.dart';
import 'package:indian_race_fantasy/constants/color_constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.onPressed,required this.title});

  final void Function() onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(onPressed: onPressed,
    child:Container(
      width: 200,
      height: 50,
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5), // Shadow color
            blurRadius: 10.0, // Spread radius
            spreadRadius: 1.0, // Blur radius
            offset: Offset(1, 5), // Offset from the widget
          ),
        ]
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(color: Colors.white, fontSize: 18.0),
        ),
      ),
    ),
    );
  }
}
