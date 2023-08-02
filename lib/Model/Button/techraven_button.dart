import 'package:flutter/material.dart';
import 'package:indian_race_fantasy/constants/image_constants.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class TechravenButton extends StatelessWidget {
  final String linkUrl = "https://www.techraven.live/";

  _launchURL() async {
    if (await canLaunchUrlString(linkUrl)) {
      await launchUrlString(linkUrl);
    } else {
      throw 'Could not launch $linkUrl';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: 100,
          child: Image.asset(
            Images.techraven,
            color: Colors.transparent, // Make the image transparent
          ),
        ),
        Positioned.fill(
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: _launchURL,
            ),
          ),
        ),
      ],
    );
  }
}
