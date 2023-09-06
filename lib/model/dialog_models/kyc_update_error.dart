import 'package:flutter/material.dart';

class KycUpdateError extends StatelessWidget {
  final VoidCallback onOkPressed;

  KycUpdateError({required this.onOkPressed});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [

            Text('Your KYC Details is not updated, Please fill all the Details in the form and try again.',
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
