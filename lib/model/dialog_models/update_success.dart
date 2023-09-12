import 'package:flutter/material.dart';
import 'package:indian_race_fantasy/Model/Button/custom_button.dart';

class UpdateSuccess extends StatelessWidget {
  final VoidCallback onOkPressed;
  final String title;

  UpdateSuccess({required this.onOkPressed, required this.title});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the dialog
                  },
                ),
              ),
            ),
            Text(title,
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: CustomButton(onPressed: () {
      onOkPressed(); // Call the provided function to refresh KYC
      Navigator.of(context).pop(); // Close the dialog
      }, title: 'OK'),
            ),
            // ElevatedButton(
            //   onPressed: () {
            //     onOkPressed(); // Call the provided function to refresh KYC
            //     Navigator.of(context).pop(); // Close the dialog
            //   },
            //   child: Text('OK'),
            // ),
          ],
        ),
      ),
    );
  }
}
