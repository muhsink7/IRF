import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../color_constants.dart';

class TextfieldTypeWidget extends StatelessWidget {
  TextfieldTypeWidget({
    super.key,
    required this.controller,
    required this.hintText,
    this.labelText,
    this.enabled = false,
    this.keyBoardType = TextInputType.text,
    this.inputFormatters,
  });

  final TextEditingController controller;
  final bool enabled;
  final String hintText;
  final String? labelText;
  final TextInputType keyBoardType;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: secondaryColor, borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          controller: controller,
          enabled: enabled,
          keyboardType: keyBoardType,
          textInputAction: TextInputAction.done,
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'^[A-Z0-9]+$')),
            // This formatter ensures that the input is converted to uppercase
          ],
          cursorColor: Colors.white,
          style: const TextStyle(color: kWhiteColor),
          decoration: InputDecoration(
              labelText: labelText,
              labelStyle: TextStyle(color: kWhiteColor),
              hintText: hintText,
              border: InputBorder.none,
              hintStyle: TextStyle(color: kWhiteColor)),
        ),
      ),
    );
  }
}
