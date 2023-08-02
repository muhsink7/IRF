import 'dart:async';
import 'package:flutter/material.dart';
import 'package:indian_race_fantasy/ui/screens/login_screen/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late bool loading;
  late double progressValue;

  @override
  void initState() {
    super.initState();
    loading = true;
    progressValue = 0.0;

    // Start the timer after initState
    Future.delayed(Duration(seconds: 6), () {
      // Navigate to LoginScreen after the delay
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    });

    updateProgress();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: loading
            ? Stack(
              children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                SizedBox(
                    width: 200,
                    child: Image.asset("assets/images/horse1.gif")),
                // const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50.0),
                  child: LinearProgressIndicator(
                    value: progressValue,
                    semanticsLabel: 'Linear progress indicator',
                  ),
                ),
                const SizedBox(height: 20),
                Text("Loading...${(progressValue * 100).round()}%"),
                const SizedBox(height: 150),
            ],
          ),
                Positioned(
                  bottom: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("All rights reserved INDIA RACE FANTASY 2022"),
                        Text("Powered by "),
                      ],
                    ),
                  ),
                ),

              ],
            )
            : SizedBox(),
      ),
    );
  }

  void updateProgress() {
    const totalDuration = const Duration(seconds: 5);
    const updateInterval = const Duration(milliseconds: 50);
    int totalSteps = (totalDuration.inMilliseconds / updateInterval.inMilliseconds).round();
    double increment = 1.0 / totalSteps;

    Timer.periodic(updateInterval, (Timer t) {
      setState(() {
        progressValue += increment;
        if (progressValue >= 1.0) {
          loading = false;
          t.cancel();
          return;
        }
      });
    });
  }
}
