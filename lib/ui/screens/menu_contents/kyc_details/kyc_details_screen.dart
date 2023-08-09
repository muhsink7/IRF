import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indian_race_fantasy/ui/screens/menu_contents/kyc_details/kyc_controller.dart';

import '../../../../constants/color_constants.dart';

class KYCDetailsScreen extends GetWidget<KYCController> {
  final TextEditingController _inputController = TextEditingController();


  @override
  Widget build(BuildContext context) {

    final DateTime lastDate = DateTime.now().subtract(Duration(days: 365 * 18));


    return Scaffold(
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("KYC Details"),
                IconButton(onPressed: (){}, icon: const Icon(Icons.backspace, size: 60,color: secondaryColor,fill: 1.0,shadows: [
    ],)
    ),
                ],
              ),
            ),
            const SizedBox(height: 20,),
            Container(
              child: Row(
                children: [
                  // TextField(),
                  // TextField()
                ],
              ),
            ),
            const SizedBox(height: 20,),
            Text("Date of Birth"),
            const SizedBox(height: 20,),
            Row(
          children: [
            // InputDatePickerFormField(firstDate: DateTime(1900), lastDate: lastDate)
          ],
    )
          ],
        ),
      )),
    );
  }
}
