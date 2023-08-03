import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:indian_race_fantasy/Model/reusable_card/reusable_card.dart';
import 'package:indian_race_fantasy/constants/color_constants.dart';
import 'package:indian_race_fantasy/ui/screens/home_screen/home_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<HomeController>(
        builder: (controller) {
          if (controller.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
          return Column(
            children: [
              Container(
                width: double.infinity,
                height: 90,
                decoration: BoxDecoration(
                  color: primaryColor,
                  boxShadow: [
                     BoxShadow(
                      color: kBlackColor.withOpacity(0.3), // Shadow color with opacity
                      spreadRadius: 2, // Spread radius
                      blurRadius: 4, // Blur radius
                      offset: Offset(0, 2), // Offset in the vertical direction
                    ),
                  ]

                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    IconButton(onPressed: (){}, icon: Icon(Icons.account_circle,size: 50,)),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical:10.0,horizontal: 20.0),
                      child: Container(
                        width: 200,
                        height: 40.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: kWhiteColor,
                        ),
                    
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: (ctx,index){
                    return GestureDetector(
                      onTap: (){},
                      child: ReusableCard(),
                    );

                  }
                  ),
              )
            ],
          );
        }
      )
    );
  }
}