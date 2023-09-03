import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import '../Model/model_api/kyc_update.dart';
import '../ui/screens/login_screen/login_screen.dart';
import '../ui/screens/main_Screen/main_screen.dart';
import '../ui/screens/otp_screen/otp_controller.dart';

class AuthChecker extends StatelessWidget {
  final GetStorage storage = GetStorage();


  @override
  Widget build(BuildContext context) {
    bool isAuthenticated = storage.read('is_authenticated') ?? false;

    return Scaffold(
      body: FutureBuilder<void>(
        // Simulate authentication process
        future: Future.delayed(Duration(seconds: 2)), // Replace with your authentication logic
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Show a circular progress indicator while authenticating
            return Center(child: CircularProgressIndicator());
          } else {
            // After authentication, show LoginScreen or MainScreen based on the authentication status
            if (isAuthenticated) {
              return MainScreen();
            } else {
              return LoginScreen();
            }
          }
        },
      ),
    );
  }
}



// class AuthChecker extends StatelessWidget {
//   final GetStorage storage = GetStorage();
//
//     @override
//     Widget build(BuildContext context) {
//       bool isAuthenticated = storage.read('is_authenticated') ?? false;
//
//       if (isAuthenticated) {
//         return MainScreen();
//       } else {
//         return LoginScreen();
//       }
//     }

  //   bool isVerified = storage.read('is_verified') ?? false;
  //   print("authchekc++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
  //   print("isUserAuthenticated: $isVerified");
  //    if (!isVerified) {
  //      storage.write('is_verified', isVerified);
  //    }
  //
  //   return isVerified
  //       ? MainScreen()
  //       : LoginScreen();
  // }
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  //
  // @override
  // Widget build(BuildContext context) {
  //   return StreamBuilder<User?>(
  //     stream: _auth.authStateChanges(),
  //     builder: (context, snapshot) {
  //       if (snapshot.connectionState == ConnectionState.active) {
  //         final user = snapshot.data;
  //         if (user == null) {
  //           // User is not logged in, navigate to LoginScreen
  //           return LoginScreen();
  //         } else {
  //           // User is logged in, navigate to MainScreen
  //           return MainScreen();
  //         }
  //       } else {
  //         // Show loading or splash screen if connection state is not active
  //         return CircularProgressIndicator(); // Placeholder, you can replace this
  //       }
  //     },
  //   );
  // }
// }