import 'package:flutter/material.dart';
import 'package:indian_race_fantasy/constants/color_constants.dart';

class ReusableCard extends StatelessWidget {
  const ReusableCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical:10.0,horizontal: 20.0),
      child: Card(
        color: secondaryColor,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("BANGALURU TROPHY",
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: 20.0,
                  ),
                  ),
                  Row(
                    children: [
                      const Text("Details",style: TextStyle(
                    color: kWhiteColor
                  ),),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.info_outline_rounded,
                            color: kWhiteColor,
                            
                          )),
                    ],
                  )
                ],
              ),
              const Divider(
                // Add a Divider widget to create the dividing line
                thickness: 2,
                color: primaryColor,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(
                    children: [
                      Icon(Icons.emoji_events,color: kWhiteColor,),
                      Text("price : 50000",style: TextStyle(
                    color: kWhiteColor
                  ),),
                    ],
                  ),
                  SizedBox(width: 5.0,),
                  const Row(children: [
                    Icon(Icons.money,color: kWhiteColor,),
                    Text("Entry fee : 500",style: TextStyle(
                    color: kWhiteColor
                  ),),
                  ]),
                  MaterialButton(
                    onPressed: () {},
                    child: Container(
                      width: 62,
                      height: 30,
                      decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(10.0),
                          ),
                      child: const Center(
                        child: Text(
                          "Register",
                          style: TextStyle(color: kWhiteColor, fontSize: 14.0),
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
