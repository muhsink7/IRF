import 'package:flutter/material.dart';

class UpdateError extends StatelessWidget {
  final VoidCallback onOkPressed;
  final String title;

  UpdateError({required this.onOkPressed, required this.title});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [

            Text(title,
              style: TextStyle(
                color: Colors.red,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),),
            ElevatedButton(
              onPressed: () {
                onOkPressed(); // Call the provided function to refresh KYC
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('OK'),
            ),
          ],
        ),
      ),
    );
  }
}