import 'package:flutter/material.dart';
import 'package:indian_race_fantasy/ui/screens/login_screen/login_screen.dart';
import 'package:indian_race_fantasy/ui/screens/splash_screen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xffEABE41),
        primary: Color(0xffEABE41),
          secondary: Color(0xff112853),
        ),
        useMaterial3: true,
      ),
      home:  SplashScreen(),
    );
  }
}
