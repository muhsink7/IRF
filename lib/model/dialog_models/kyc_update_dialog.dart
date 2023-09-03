import 'package:flutter/material.dart';

class KycUpdateDialog extends StatelessWidget {
  final VoidCallback onOkPressed;

  KycUpdateDialog({required this.onOkPressed});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
              ),
            ),
            Text('Your KYC is updated'),
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
