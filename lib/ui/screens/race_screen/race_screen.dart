import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indian_race_fantasy/ui/screens/race_screen/race_controller.dart';

class RaceScreen extends GetWidget<RaceController> {
  const RaceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Race page is yet to come",style: TextStyle(
        fontSize: 20.0,
      ),)),
    );
  }
}