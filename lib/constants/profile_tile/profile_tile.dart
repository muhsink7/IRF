import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../color_constants.dart';

class ProfileTile extends StatelessWidget {
  const ProfileTile({Key? key, required this.title, required this.titleValue}) : super(key: key);

  final String title;
  final String titleValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: secondaryColor,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: kBlackColor.withOpacity(0.3),
                  spreadRadius: 3,
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Align(
                alignment: Alignment.center,
                child: Table(
                  children: [
                    TableRow(
                      children: [
                        Text(title,style: TextStyle(
                          fontSize: 15.0,
                          color: kWhiteColor,
                        ),),
                        Wrap(
                          children: [
                            Text(titleValue,
                              style: TextStyle(
                                fontSize: 16.0,
                                color: kWhiteColor,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}