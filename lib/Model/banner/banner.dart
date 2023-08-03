// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

// class Banner extends StatelessWidget {
//    Banner({super.key});

//   List imageList = [
//   {"id" : 1, "image" : "assets/images/slide/image1.jpg"},
//   {"id" : 2, "image" : "assets/images/slide/image2.jpg"},
//   {"id" : 3, "image" : "assets/images/slide/image3.jpg"},
//   {"id" : 4, "image" : "assets/images/slide/image4.jpg"},
//   {"id" : 5, "image" : "assets/images/slide/image5.jpg"},
//   {"id" : 6, "image" : "assets/images/slide/image6.jpg"},
//   ];

//   final CarouselController carouselController = CarouselController();
//   int currentIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     return  SingleChildScrollView(
//                 scrollDirection: Axis.vertical,
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Stack(
//                     children: [
//                       InkWell(
//                         onTap: () {
//                           carouselController.nextPage();
//                         },
//                         child: Container(
//                           decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(8),
//                             boxShadow: [
//                               BoxShadow(
//                                 color: Colors.grey.withOpacity(0.5),
//                                 spreadRadius: 5,
//                                 blurRadius: 7,
//                                 offset: const Offset(
//                                     0, 3), // changes position of shadow
//                               ),
//                             ],
//                           ),
//                           child: CarouselSlider(
//                             carouselController: carouselController,
//                             options: CarouselOptions(
//                               height: 200,
//                               autoPlay: true,
//                               autoPlayInterval: const Duration(seconds: 3),
//                               autoPlayAnimationDuration:
//                                   const Duration(milliseconds: 800),
//                               autoPlayCurve: Curves.fastOutSlowIn,
//                               pauseAutoPlayOnTouch: true,
//                               aspectRatio: 2.0,
//                               enlargeCenterPage: true,
//                               scrollDirection: Axis.horizontal,
//                               viewportFraction: 1,
//                               onPageChanged: (index, reason) {
//                                 setState(() {
//                                   currentIndex = index;
//                                 });
//                               },
//                             ),
//                             items: imageList
//                                 .map((item) => Container(
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(8),
//                                 image: DecorationImage(
//                                   image: AssetImage(item['image']),
//                                   fit: BoxFit.cover,
//                                 ),
//                               ),
//                                       // child: Expanded(
//                                       //   child: Image.asset(
//                                       //     item['image'],
//                                       //     fit: BoxFit.cover,
//                                       //     width: 1000,
//                                       //   ),
//                                       // ),
//                                     ))
//                                 .toList(),
//                           ),
//                         ),
//                       ),
//                       Positioned(
//                         bottom: 0,
//                         left: 0,
//                         right: 0,
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: imageList.asMap().entries.map((entry) {
//                             // print(entry);
//                             // print(entry.key);
//                             // int index = imageList.indexOf(url);
//                             return GestureDetector(
//                               onTap: () {
//                                 carouselController.animateToPage(entry.key);
//                               },
//                               child: Container(
//                                 width: currentIndex == entry.key ? 22.0 : 8.0,
//                                 height: 9.0,
//                                 margin: const EdgeInsets.symmetric(
//                                      horizontal: 3.0),
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(10),
//                                   color: currentIndex == entry.key
//                                       ? Colors.blueGrey[900]
//                                       : Colors.blueGrey,
//                                 ),
//                               ),
//                             );
//                           }).toList(),
//                         ),
//                       ),

//                     ],
//                   ),
//                 ),
//               );
//   }
// }