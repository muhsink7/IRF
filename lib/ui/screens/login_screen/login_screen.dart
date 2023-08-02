import 'package:flutter/material.dart';
import 'package:indian_race_fantasy/Model/Button/custom_button.dart';
import 'package:indian_race_fantasy/ui/screens/otp_screen/otp_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 150,
                height: 150,
                child: Image.asset('assets/images/logo_blue.png'),
              ),
              const Text(
                'Hi',
                style: TextStyle(
                  fontSize: 36.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text("Let's get Started"),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                              color: Colors.black,
                              width: 2.0,
                            ),
                          ),
                          hintText: '+91',
                          hintStyle: TextStyle(

                          )// Hint text when the TextField is empty
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      flex: 3,
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                              color: Colors.black,
                              width: 2.0,
                            ),
                          ),
                          labelText: 'Mobile Number', // Placeholder text for the TextField
                          hintText: 'Enter Mobile Number', // Hint text when the TextField is empty
                        ),
                      ), // Use Expanded to allow TextFormField to take all available width
                    ),
                  ],
                ),
              ),
              CustomButton(onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const OtpScreen()),
                );
              }, title: "Login"),
              const SizedBox(height: 50),
              const SizedBox(height: 50), // Add some spacing between widgets
              Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  children: [
                    Text("All rights reserved INDIA RACE FANTASY 2022"),
                    Text("Powered by "),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
